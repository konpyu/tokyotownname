### radio

### setup

```
git clone git@github.com:konpyu/tokyotownname-new.git
cd radio
bundle install --path=vendor/bundle
bundle exec rake db:create
bundle exec rake db:migrate
bower install # if bower has not installed, npm install -g bower
```

### run server

```
mysql.server start
cd ~/tokyotownname-new
bundle exec rails s
# see localhost:3331 on your browser
```
