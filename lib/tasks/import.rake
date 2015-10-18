require "active_record"

namespace :import do
  desc "delete all records"
  task delete: :environment do
    Authentication.delete_all
    Comment.delete_all
    Favorite.delete_all
    Image.delete_all
    Live.delete_all
    Notification.delete_all
    Photo.delete_all
    User.delete_all
  end

  desc "import table: authentications"
  task authentications: :environment do
    class OldAuthentication < ActiveRecord::Base
      establish_connection :old_production
      self.table_name = 'authentications'
    end
    OldAuthentication.all.each do |auth|
      Authentication.create!(
        id:          auth.id,
        user_id:     auth.user_id,
        provider:    auth.provider,
        uid:         auth.uid,
        name:        auth.name,
        nickname:    auth.nickname,
        image:       auth.image,
        email:       auth.email,
        location:    auth.location,
        gender:      auth.gender,
        token:       auth.token,
        secret:      auth.secret,
        created_at:  auth.created_at,
        updated_at:  auth.updated_at,
      )
    end
  end

  desc "import table: images"
  task image: :environment do
    Image.delete_all
    class OldImage < ActiveRecord::Base
      establish_connection :old_production
      self.table_name = 'images'
    end
    class OldPhoto < ActiveRecord::Base
      establish_connection :old_production
      self.table_name = 'photos'
    end

    map = {}
    OldImage.all.each do |image|
      map[image.id] = image.image
      Image.create!(
        id: image.id,
        image: image.image,
        created_at: image.created_at,
        updated_at: image.updated_at,
        imageable_type: 'Photo',
        imageable_id: 1,
      )
    end
    OldPhoto.all.each do |photo|
      image_id = photo.image_id
      image = Image.find(image_id)
      image.imageable_id = photo.id
      image.save!
    end
    map.each do |id, image|
      ActiveRecord::Base.connection.execute("update images set image='#{image}' where id=#{id}")
    end
  end

  desc "import table: users"
  task user: :environment do
    class OldUser < ActiveRecord::Base
      establish_connection :old_production
      self.table_name = 'users'
    end

    OldUser.all.each do |user|
      User.create!(
        id: user.id,
        name: user.name,
        image: user.image,
        email: user.email,
        admin_flag: user.admin_flag,
        created_at: user.created_at,
        updated_at: user.updated_at,
      )
    end
  end

  desc "import table: photos"
  task photo: :environment do
    class OldPhoto < ActiveRecord::Base
      establish_connection :old_production
      self.table_name = 'photos'
    end

    OldPhoto.all.each do |photo|
      Photo.create!(
        id: photo.id,
        town_id: photo.town_id,
        ward_id: photo.ward_id,
        user_id: photo.user_id,
        comment: photo.comment,
        created_at: photo.created_at,
        updated_at: photo.updated_at
      )
    end

    Photo.all.each do |photo|
      photo.ward_id = photo.ward_id.to_i - 100
      photo.save!
    end
  end
end
