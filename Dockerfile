FROM konpyu/centos7-ruby2.2.2-ttn

RUN curl -sL https://rpm.nodesource.com/setup_4.x | bash -
RUN yum install -y nodejs gcc-c++ make

ENV APP_HOME /app

WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle install
ADD . $APP_HOME

EXPOSE 3331

CMD ["bundle", "exec", "rails", "s"]
