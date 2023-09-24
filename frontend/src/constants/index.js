import axios from "axios";

const IMAGE_REGEX = /<img src=["'](?<src>.+?)["']\s*(width=["'](?<width>.+?)['"])?>/g
const PARAGRAPH_REGEX = /<p>(?<content>[^<]*)<\/p>/;
const VUE_APP_BACKEND_URL=process.env.VUE_APP_BACKEND_URL || 'VUE_APP_BACKEND_URL_PLACEHOLDER';
const VUE_APP_STORAGE_URL=process.env.VUE_APP_STORAGE_URL ||'VUE_APP_STORAGE_URL_PLACEHOLDER';
const VUE_APP_BUCKET_NAME=process.env.VUE_APP_BUCKET_NAME || 'VUE_APP_BUCKET_NAME_PLACEHOLDER';
const VUE_APP_ASSETS_DIR=process.env.VUE_APP_ASSETS_DIR || 'VUE_APP_ASSETS_DIR_PLACEHOLDER';
const GCLOUD_URL = `${VUE_APP_STORAGE_URL}/${VUE_APP_BUCKET_NAME}`
const CATEGORIES = (await axios.request({
      method: 'get',
      url: `${VUE_APP_BACKEND_URL}/categories`,
})).data

export {
  IMAGE_REGEX,
  PARAGRAPH_REGEX,
  GCLOUD_URL,
  CATEGORIES,
  VUE_APP_BACKEND_URL,
  VUE_APP_STORAGE_URL,
  VUE_APP_BUCKET_NAME,
  VUE_APP_ASSETS_DIR,
}
