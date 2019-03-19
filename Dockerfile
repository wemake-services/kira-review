FROM ruby:2.3-alpine

LABEL maintainer="sobolevn@wemake.services"
LABEL vendor="wemake.services"

# Set it in case you want to have platform-specific rules:
ENV DANGER_PLATFORMS=${DANGER_PLATFORMS:-''}

# Installing build tools:
RUN apk --no-cache add \
    git \
  && gem update --system \
  && gem install bundler

# Install deps:
WORKDIR /danger
COPY Gemfile Gemfile.lock /danger/

RUN bundle install --frozen --deployment

# Copy Dangerfiles:
COPY . /danger/

# Running
ENTRYPOINT ["bundle", "exec"]
