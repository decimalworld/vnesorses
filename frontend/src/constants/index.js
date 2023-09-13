const IMAGE_REGEX = /<img src=["'](?<src>.+?)["']\s*(width=["'](?<width>.+?)['"])?>/g
const GCLOUD_URL = `${process.env.VUE_APP_STORAGE_URL}/${process.env.VUE_APP_BUCKET_NAME}`

export {
  IMAGE_REGEX,
  GCLOUD_URL
}
