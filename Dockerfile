FROM ruby:2.3

ENV app /vishu_app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir $app
WORKDIR $app
RUN gem install bundler
ENV BUNDLE_PATH /bundle

WORKDIR $app
COPY . ./

