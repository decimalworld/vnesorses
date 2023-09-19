FROM ruby:3.2-alpine

ARG RAILS_MASTER_KEY
ARG DB_HOST
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_DEV
ARG DB_TEST

ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY}
ENV DB_HOST=${DB_HOST}
ENV DB_USERNAME=${DB_USERNAME}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV DB_DEV=${DB_DEV}
ENV DB_TEST=${DB_TEST}

WORKDIR /backend/
RUN apk update
RUN apk add vim make gcc musl-dev postgresql-dev tzdata
COPY Gemfile* /backend/
RUN bundle install
ADD ./ /backend/
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["sh", "entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

