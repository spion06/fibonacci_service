FROM ruby:2.2.5

EXPOSE 8080

RUN mkdir -p /opt/app

WORKDIR /opt/app

COPY . .

RUN bundle install

CMD bundle exec rackup -o 0.0.0.0 -p 8080 config.ru
