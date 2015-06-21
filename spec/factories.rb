FactoryGirl.define do  factory :favorite do
    
  end
  factory :notification do
    
  end
  factory :episode do
    
  end
  factory :channel do
    
  end



#  sequence :sentence, aliases: [:title, :content] do
#    FFaker::Lorem.sentence
#  end

  sequence :name do
    FFaker::Name.name
  end

  sequence :access_token do
    SecureRandom.hex(32)
  end

#  sequence :file_name do
#    FFaker::Internet.user_name
#  end

  sequence(:url) { FFaker::Internet.uri('http') }

  factory :user do
    email { FFaker::Internet.email }
    name
    access_token

    trait :admin do
      admin true
    end
  end

  factory :image do
    ext              'png'
    original_name    'sample.png'
    image            'sample.png'
    size             50000
    width            1000
    height           800
    key              "ab5749a4a37cfdfe986081c13d28b6ec"
    trait :photo do
      kind           'photo'
    end
  end

  factory :photo do
    town_id 101001
    ward_id 1
  end

  factory :comment do
    comment FFaker::Lorem.word
  end

end
