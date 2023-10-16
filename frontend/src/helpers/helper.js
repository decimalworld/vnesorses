import router from "@/router"

const helper = {
  goToBlog(id) {
    router.push({ name: `showBlog`, params: { id: id } })
  },
  goToCategory(url_name) {
    router.push({ name: `category`, params: { category: url_name } })
  },
  goToTag(category_url_name, tag_url_name) {
    router.push({ name: `tag`, params: { category: category_url_name, tag: tag_url_name } })
  }
}

export default helper
