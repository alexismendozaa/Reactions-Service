FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3016

ENV PORT 3016

CMD ["bundle", "exec", "puma", "-b", "tcp://0.0.0.0:3016", "-C", "config/puma.rb"]
