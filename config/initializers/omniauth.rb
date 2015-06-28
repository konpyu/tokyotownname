Rails.application.config.middleware.use OmniAuth::Builder do
  # Providers
  provider :twitter, "ENV[TWITTER_KEY]", "ENV[TWITTER_SECRET]", {
    image_size: 'original',
    authorize_params: {
      lang: 'ja',
    }
  }
  provider :facebook, "ENV[FACEBOOK_KEY]" , "ENV[FACEBOOK_SECRET]" , {
    image_size: 'large'
  }
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

# NOTE: This is setting of omniauth mock. You can do social login with following setting by commenting out.
#if Rails.env.development?
#  OmniAuth.config.test_mode = true
#  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
#    provider: 'twitter',
#    uid: '2015050804',
#    info: {
#      email:    's2015050804+twitter_test@gmail.com',
#      name:     "John Q Public",
#      nickname: "johnqpublic",
#    }
#  })
#  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
#    provider: 'facebook',
#    uid: '2015050804',
#    info: {
#      email:    's2015050804+facebook_test@gmail.com',
#      name:     'Joe Bloggs',
#      nickname: 'jbloggs',
#    }
#  })
#end
