FROM ruby:3.2-slim

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    nodejs \
    postgresql-client \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle config set deployment 'true' && \
    bundle config set without 'development test' && \
    bundle install -j4 --retry 3

COPY . .

# RUN bundle exec rake assets:precompile

EXPOSE 3017

ENV PORT=3017

CMD ["bundle", "exec", "puma", "-b", "tcp://0.0.0.0:3017", "-C", "config/puma.rb"]
