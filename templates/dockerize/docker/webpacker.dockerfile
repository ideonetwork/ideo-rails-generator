FROM ruby:2.6.0

# Installo dipendenze
RUN apt-get update -qq && apt-get install -y apt-utils build-essential

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

COPY . /app
WORKDIR /app
RUN yarn install

RUN bundle config --local disable_platform_warnings true
RUN bundle install
