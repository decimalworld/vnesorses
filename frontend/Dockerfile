FROM node

WORKDIR /frontend/
RUN npm i -g @vue/cli
COPY ./package*.json /frontend/
RUN npm i

EXPOSE 8080
