const GCLOUD_URL = `${process.env.VUE_APP_STORAGE_URL}/${process.env.VUE_APP_BUCKET_NAME}`
const IMAGE_REGEX = /<img src=["'](?<src>.+?)["']\s*(width=["'](?<width>.+?)['"])?>/g
const PARAGRAPH_REGEX = /<p>(?<content>[^<]*)<\/p>/;

export {
  IMAGE_REGEX,
  PARAGRAPH_REGEX,
  GCLOUD_URL
}
