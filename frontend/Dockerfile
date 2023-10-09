FROM node:alpine AS development

WORKDIR /frontend/
RUN npm i -g @vue/cli
COPY ./package*.json /frontend/
RUN npm i
ADD ./ /frontend/
RUN npm run build

FROM nginx:stable-alpine as production

ARG BACKEND_URL
ARG STORAGE_URL
ARG BUCKET_NAME
ARG ASSETS_DIR

ENV VUE_APP_BACKEND_URL=${BACKEND_URL}
ENV VUE_APP_STORAGE_URL=${STORAGE_URL}
ENV VUE_APP_BUCKET_NAME=${BUCKET_NAME}
ENV VUE_APP_ASSETS_DIR=${ASSETS_DIR}

COPY --from=development /frontend/dist /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./subtitute_variables.sh /subtitute_variables.sh
RUN chmod +x /subtitute_variables.sh
ENTRYPOINT [ "/subtitute_variables.sh" ]
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
