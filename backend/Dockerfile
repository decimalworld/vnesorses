FROM ruby

WORKDIR /backend/
RUN apt-get update -qq && apt-get install -y nodejs vim
COPY Gemfile* /backend/
RUN bundle install

EXPOSE 3000
