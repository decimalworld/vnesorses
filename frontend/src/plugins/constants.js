const constants = {
  install(App, options) {
    Vue.Constants = {
      IMAGE_REGEX: /<img src=["'](?<src>.+?)["']\s*(width=["'](?<width>.+?)['"])?>/g,
      GCLOUD_STORAGE: `${process.env.VUE_APP_STORAGE_URL}/${process.env.VUE_APP_BUCKET_NAME}`
      
    }
  }
}

export default constants
