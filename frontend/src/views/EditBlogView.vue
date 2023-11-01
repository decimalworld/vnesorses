<template>
  <Container>

    <div class="edit-blog-view">

      <div class="edit-blog">
        <div class="cover-group">
          <label for="blog-photo" class="clickable upload-button">Upload Cover Photo</label>
          <input type="file" id="blog-photo" ref="blogPhoto" accept=".png, .jpg, .jpeg" @change="fileChange">
          <div class="file-info">File Chosen: {{ coverChosen }}</div>
          <div class="select-wrapper">
            <div class="select-label">Tag: </div>
            <select v-model="tag_name">
              <option disabled value="">Please select one</option>
              <template v-for="category in categories">
                <option disabled value="" class="category-marker">{{ category.name }}</option>
                <option v-for="(tag, index2) in category.tags" :value="tag.name" :key="index2">{{ tag.name }}</option>
              </template>
            </select>
          </div>
        </div>
        <div class="title-group">
          <textarea 
            placeholder="Enter Blog Title" 
            v-model="blogTitle" 
            class="title"
            ref="title"
            rows="1"
            @input="resizTitle"
          />
        </div>
        <VueEditor 
          v-model="blogContent" 
          :editorOptions="editorOptions"
        >
      
        </VueEditor>
        <div class="router-group">
          <div 
            :class="`clickable ${cover ? '' : 'inactive'}`"
            @click="cover && togglePreview()"  
          >
            Preview Cover
          </div>
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
  </Container>
</template>

<script>
import Container from '@/components/common/Container.vue';
import Quill from 'quill';
import reducer from 'image-blob-reduce';
import { mapActions, mapGetters } from 'vuex';

window.Quill = Quill;
const ImageResize = require('quill-image-resize-module').default;
Quill.register("modules/imageResize", ImageResize);

import { VueEditor } from 'vue3-editor';
import { CATEGORIES } from '@/constants';
export default {
  name: 'EditBlogView',
  inject: ["helpers"],
  components: { VueEditor, Container },
  data() {
    return {
      cover: '',
      coverChosen: '',
      images: '',
      tag_name: '',
      categories: CATEGORIES,
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
    ...mapActions([
      'setBlogTitle', 
      'setBlogBody', 
      'setBlogCover', 
      'toggleLoading', 
      'saveBlog',
      'createBlog',
      'togglePreview',
      'clearBlog'
    ]), ...mapGetters([
      'getBlogTitle', 
      'getBlogBody', 
      'getBlogCover',
      'getBlogImages',
      'getBlogSummary'
    ]),
    fileChange() {
      this.cover = this.$refs.blogPhoto.files[0];
      this.coverUrl = URL.createObjectURL(this.cover);
      this.coverChosen = this.cover.name;
    },
    resizTitle() {
      let element = this.$refs['title'];
      
      element.style.height = "auto";
      element.rows = 1;
      element.style.height = `${element.scrollHeight}px` ;
    },
    async uploadCover(signed_url) {
      if (this.coverUrl)
        this.coverUrl = await reducer()
        .toBlob(this.cover, { max: 250 })
        .then(blob => this.helpers.uploadImage(blob, signed_url))
    },
    async uploadBlogImage(images, entries) {
      const images_mapping = images.map(image => ({origin: image, entries: entries.shift()})); 
      return Promise.all([
        ...images_mapping.map(({origin, entries}) => fetch(origin)
        .then(res => res.blob())
        .then(blob => this.helpers.uploadImage(blob, entries.signed_url))
      )])
      .then(res => this.blogContent = images_mapping.reduce(
        (content, {origin, entries}) => content.replace(origin, entries.full_path),
        this.blogContent
      ))
    },
    async publish() {
      this.toggleLoading();
      const images = this.getBlogImages();
      const response = await this.createBlog({
        tag_name: this.tag_name,
        body_image_count: images.length,
      });
      await Promise.all([
        this.uploadCover(response.data.blog.cover.signed_url),
        this.uploadBlogImage(images, response.data.blog.images)
      ])
      await this.saveBlog(response.data.blog.id);
      this.toggleLoading();
      this.clearBlog();
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
    margin: 20px 30px;
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
  
    .cover-group {
      display: flex;
      width: 100%;
      .upload-button {
        width: 100px;
      }
      input {
        display: none;
      }
      .file-info {
        width: 250px;
        text-align: start;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        margin: auto 15px;
      }
      .select-wrapper{
        display: flex;
        .select-label {
          margin: auto 5px;
        }
        select {
          width: 250px;
          height: 30px;
          font-weight: 600;
          font-size: 15px;
          margin: auto 10px;
          .category-marker {
            background-color: #303030;
            color: white;
            font-weight: bold;
          }
        }
      }
    }

    .title-group {
      width: 100%;
      align-items: start;
      display: flex;
      .inactive,
      .clickable {
        width: 100px;
        min-width: 100px;
      }

      .title {
        width: 100%;
        height: auto;
        font-weight: bold;
        font-size: 32px;
        overflow-wrap: break-word;
        min-width: 180px;
        border: none;
        transition: .5s ease-in-out all;
        padding: 10px 5px 4px 4px;
        border-bottom: 1px solid #303030;
        resize: none;

        &:focus{
          outline: none;
          box-shadow: 0 1px 0 0 #303030;
        }
      }
    }
    .router-group {
      display: flex;
      margin: auto;
      * {
        width: 100px;
        margin: 0 5px;
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
