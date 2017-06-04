FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install && bundle exec rails db:migrate
ADD . /myapp
CMD bundle exec rails db:migrate && bundle exec rails s -p 3000 -b '0.0.0.0'
EXPOSE 3000
