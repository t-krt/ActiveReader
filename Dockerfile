FROM ruby:2.5.1

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    build-essential \
    vim

RUN apt-get install -y curl apt-transport-https wget \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y yarn

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN yarn add node-sass

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN mkdir -p tmp/sockets

RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# EXPOSE 3000
# CMD ["rails", "server", "-b", "0.0.0.0"]
