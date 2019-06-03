FROM ruby:2.6.3-alpine

ENV LANG C.UTF-8
ENV BUNDLE_PATH /usr/local/bundle

# dockerize用
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing/ >> /etc/apk/repositories

RUN apk add --no-cache --update \
    bash \
    build-base \
    font-ipa \
    mysql-client \
    mysql-dev \
    nodejs \
    yarn \
    dockerize \
    tzdata \
    less \
    curl \
    vim \
    chromium \
    chromium-chromedriver

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

ENV APP_PATH /usr/src/app
WORKDIR $APP_PATH

CMD ["docker/development/rails/entrypoint.sh"]
