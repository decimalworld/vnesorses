#!/bin/sh

ROOT_DIR=/usr/share/nginx/html

# Replace env vars in files served by NGINX
for file in $ROOT_DIR/js/*.js* $ROOT_DIR/index.html $ROOT_DIR/precache-manifest*.js;
do
  sed -i 's|VUE_APP_BACKEND_URL_PLACEHOLDER|'${VUE_APP_BACKEND_URL}'|g' $file
  sed -i 's|VUE_APP_STORAGE_URL_PLACEHOLDER|'${VUE_APP_STORAGE_URL}'|g' $file
  sed -i 's|VUE_APP_BUCKET_NAME_PLACEHOLDER|'${VUE_APP_BUCKET_NAME}'|g' $file
  sed -i 's|VUE_APP_ASSETS_DIR_PLACEHOLDER|'${VUE_APP_ASSETS_DIR}'|g' $file
done

exec "$@"
