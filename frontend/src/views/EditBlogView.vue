<template>
  <div class="edit-blog-view">
    <div class="edit-blog">
      <div class="title-group">
        <input type="text" placeholder="Enter Blog Title" v-model="blogTitle"/>
        <div class="upload-file">
          <label for="blog-photo" class="clickable">Upload Cover Photo</label>
          <input type="file" id="blog-photo" ref="blogPhoto" accept=".png, .jpg, .jpeg" @change="fileChange">
          <div :class="coverChosen ? 'clickable' : 'inactive'">Preview Photo</div>
          <span>File Chosen: {{ coverChosen }}</span>
        </div>
      </div>
      <VueEditor 
        v-model="blogContent" 
        :editorOptions="editorOptions"
      >
    
      </VueEditor>
      <div class="router-group">
        <div class="clickable" @click="publish">
          Publish Blog
        </div>
        <div class="clickable">
          Cancel
        </div>
      </div>
    </div>
    <div class="side-content"></div>
  </div>
</template>

<script>
import Quill from 'quill';
import reducer from 'image-blob-reduce';
import { mapActions, mapGetters } from 'vuex';
import { IMAGE_REGEX } from '../constants/index';

window.Quill = Quill;
const ImageResize = require('quill-image-resize-module').default;
Quill.register("modules/imageResize", ImageResize);

import { VueEditor } from 'vue3-editor';
import axios from 'axios';
export default {
  name: 'EditBlogView',
  components: { VueEditor },
  data() {
    return {
      cover: '',
      coverChosen: '',
      images: '',
      editorOptions: {
        modules: {
          imageResize: {}
        }
      }
    }
  },
  computed: {
    coverUrl: {
      get() { return this.getBlogCover() },
      set(value) { this.setBlogCover(value) },
    },
    blogTitle: {
      get() { return this.getBlogTitle() },
      set(value) { this.setBlogTitle(value) },
    },
    blogContent: {
      get() { return this.getBlogBody() },
      set(value) { this.setBlogBody(value) },
    }
  },
  methods: {
    ...mapActions(['setBlogTitle', 'setBlogBody', 'setBlogCover', 'toggleLoading', 'saveBlog', 'createBlog']),
    ...mapGetters(['getBlogTitle', 'getBlogBody', 'getBlogCover']),
    fileChange() {
      this.cover = this.$refs.blogPhoto.files[0];
      this.coverUrl = URL.createObjectURL(this.cover);
      this.coverChosen = this.cover.name;
    },
    async uploadCover(signed_url) {
      if (this.coverUrl)
        this.coverUrl = await reducer()
        .toBlob(this.cover, { max: 150 })
        .then(blob => {
          const config = {
            method: 'put',
            maxBodyLength: Infinity,
            headers: {
              'Content-Type': 'image/png'
            },
            url: signed_url,
            data: blob
          };
          return axios.request(config)
        })
    },
    async uploadBlogImage(images, entries) {
      const images_mapping = images.map(image => ({origin: image, entries: entries.shift()})); 
      return Promise.all([...images_mapping.map(({origin, entries}) => {
        return fetch(origin)
        .then(res => res.blob())
        .then(res => {
          const config = {
              method: 'put',
              maxBodyLength: Infinity,
              headers: {
                'Content-Type': 'image/png'
              },
              url: entries.signed_url,
              data: res
            };
          return axios.request(config)
        })
      })])
      .then(res => this.blogContent = images_mapping.reduce(
        (content, {origin, entries}) => content.replace(origin, entries.full_path),
        this.blogContent
      ))
    },
    async publish() {
      this.toggleLoading();
      const images = [...this.blogContent.matchAll(IMAGE_REGEX)].map(img => img.groups.src);
      const response = await this.createBlog(images.length);
      await Promise.all([
        this.uploadCover(response.data.cover.signed_url),
        this.uploadBlogImage(images, response.data.images)
      ])
      await this.saveBlog(response.data.id);
      this.toggleLoading();
      this.$router.push({ name: 'home' })
    },
  }
}
</script>

<style lang="scss" scoped>
.edit-blog-view{
  width: 100%;
  height: 100%;
  display: flex;
  .edit-blog {
    margin: 0 30px;
    width: 70%;
    display: flex;
    flex-direction: column;
    .clickable {
      background-color: #303030;
      color: white;
      height: 40px;
      justify-content: center;
      padding: 0 20px;
      align-items: center;
      display: flex;
      border-radius: 20px;
      cursor: pointer;
      transition: .5s ease-in-out all;
      &:hover {
        background-color: #666;
      }
    }
  
    .title-group {
      height: 50px;
      width: 100%;
      align-items: start;
      display: flex;
      .inactive,
      .clickable {
        width: 100px;
        min-width: 100px;
      }
      
      input {
        width: 180px;
        height: 25px;
        border: none;
        transition: .5s ease-in-out all;
        padding: 10px 4px;
        border-bottom: 1px solid #303030;
  
        &:focus{
          outline: none;
          box-shadow: 0 1px 0 0 #303030;
        }
      }
    }
  
    .upload-file {
      flex: 1;
      margin: auto 0;
      margin-left: 16px;
      position: relative;
      display: flex;
      * {
        margin: auto 10px;
      }
  
      input {
        display: none;
      }
  
      .inactive {
        background-color: #aaa;
        color: white;
        height: 40px;
        justify-content: center;
        padding: 0 20px;
        align-items: center;
        display: flex;
        border-radius: 20px;
      }

      span {
        width: 180px;
        text-align: start;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }
    }
    .router-group {
      display: flex;
      margin: auto;
      * {
        width: 100px;
        margin: 0 5px;
      }
    }
  }
  .side-content {
    width: 30%;
    background-color: blue;
  }
}
</style>

<style lang="scss">
.quillWrapper {
  margin: 10px 0;
  display: table;
  #quill-container {
    min-height: 500px;
  }
}
</style>
