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
          {{ category.name }}
            <DropTag 
              v-show="showDrop && !dropVisible"
              :tags="category.tags"
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
      showDrop: false
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
      this.showDrop = true
    },
    hideDrop() {
      this.showDrop = false
    }
  }
}
</script>

<style scoped lang="scss">
.category {
  margin: auto;
  text-align: center;
  font-size: 13px;
  cursor: pointer;
  &:hover {
    color: rgb(0, 60, 255);
  }
}
</style>
