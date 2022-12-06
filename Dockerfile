FROM ruby:2.6-alpine

LABEL maintainer="sobolevn@wemake.services"
LABEL vendor="wemake.services"

# Installing build tools:
RUN apk --no-cache add \
    git \
  && gem update --system \
  && gem install bundler

# Install deps:
WORKDIR /danger
COPY Gemfile Gemfile.lock /danger/

RUN bundle install

# Copy Dangerfiles:
COPY . /danger/

# Running
ENTRYPOINT ["bundle", "exec"]
