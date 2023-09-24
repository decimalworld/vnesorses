<template>
  <div 
    class="category"
    @click="redirectTo('category', { params: {category: category.url || category.name} })"
    @mouseover="dipslayDrop"
    @mouseleave="hideDrop"
  >
          {{ category.name }}
            <DropTag 
              v-show="showDrop"
              :tags="category.tags"
            ></DropTag>
  </div>
</template>

<script>
import DropTag from './DropTag'
export default {
  name: "Tab",
  components: { DropTag },
  data() {
    return {
      showDrop: false
    }
  },
  props: {
    category: Object,
  },
  methods: {
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
}
</style>
