FROM ruby:2.2.2
RUN apt-get update && apt-get install -y build-essential
ENV APP_HOME /kacebot
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
VOLUME $APP_HOME
RUN bundle install

ADD . $APP_HOME
