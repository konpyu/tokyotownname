Rails.application.config.middleware.use OmniAuth::Builder do
  # Providers
  provider :twitter, "hAmhQKtF5fH8sOXTZE05A", "q7pbjByn8n9HGE0Au6ggQMJWzf0GUjgzLTrxx4DA", {
    image_size: 'original',
    authorize_params: {
      lang: 'ja',
    }
  }
  provider :facebook, "135928796599364" , "e23027131dfb92642dd92df53f38e90e" , {
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
