FROM ruby:3.4.10-alpine3.24

RUN apk update && apk add --no-cache \
    build-base \
    postgresql-dev \
    nodejs \
    npm \
    bash

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["bash"]