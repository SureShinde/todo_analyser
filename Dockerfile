FROM ruby:3.3-slim
LABEL authors="sureshinde"

RUN apt update && apt install -y git

RUN bundle config --global frozen 1

WORKDIR /app

COPY Gemfile Gemfile.lock todo_analyser.gemspec ./

COPY . .

RUN bundle install

ENTRYPOINT ["bin/console"]
