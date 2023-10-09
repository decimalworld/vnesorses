<template>
  <div 
    class="category"
    @click="redirectTo('category', { 
      params: {
        category: dasherize(category.url || category.name)
      } 
    })"
    @mouseover="dipslayDrop"
    @mouseleave="hideDrop"
  >
          <div class='text'>{{ category.name }}</div>
            <DropTag 
              v-show="showDrop && !dropVisible"
              :tags="category.tags"
              @mouseover="dipslayDrop"
              @mouseleave="hideDrop"
            ></DropTag>
  </div>
</template>

<script>
import { dasherize } from '@/mixin';
import DropTag from './DropTag';
import { mapGetters } from 'vuex';
export default {
  name: "Tab",
  components: { DropTag },
  data() {
    return {
      showDrop: false,
      showTimeout: null,
    }
  },
  computed: {
    ...mapGetters(['dropVisible'])
  },
  props: {
    category: Object,
  },
  methods: {
    dasherize,
    redirectTo(name, { params } = {}) {
      let route = { name }
      route = (params ? { ...route, params} : route)
      this.$router.push(route)
    },
    dipslayDrop() {
      clearTimeout(this.showTimeout);
      this.showDrop = true;
    },
    hideDrop() {
      this.showTimeout = setTimeout(() => this.showDrop = false, 10)
    },
  }
}
</script>

<style scoped lang="scss">
.category {
  margin: auto;
  text-align: center;
  font-size: 15px;
  height: 100%;
  display: flex;
  cursor: pointer;
  .text {
    margin: auto;
  }
  &:hover {
    color: rgb(0, 60, 255);
  }
}
</style>
