# dockerfile for production
FROM ruby:2.6.5-alpine3.10

ENV LANG C.UTF-8
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN apk upgrade --no-cache && \
    apk add --update --no-cache \
      imagemagick6 \
      mariadb-dev \
      nodejs \
      tzdata  \
      yarn && \
    apk add --update --no-cache --virtual=build-dependencies \
      build-base \
      curl-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      ruby-dev \
      yaml-dev \
      zlib-dev && \
    gem install bundler && \
    bundle install --without development test -j4 && \
    apk del build-dependencies && \
    rm -rf /usr/local/bundle/cache/* \  
    /usr/local/share/.cache/* \
    /var/cache/* \
    /tmp/* \
    /usr/lib/mysqld* \
    /usr/bin/mysql*

RUN mkdir -p tmp/sockets
COPY . /myapp

ENV RAILS_ENV production
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY $RAILS_MASTER_KEY

RUN rm -f tmp/pids/server.pid
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
