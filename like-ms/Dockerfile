FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3015

ENV PORT 3015

CMD ["bundle", "exec", "puma", "-b", "tcp://0.0.0.0:3015", "-C", "config/puma.rb"]

