require "active_record"

namespace :import do
  desc "delete"
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

  desc "fix ward id"
  task fix_ward_id: :environment do
    Photo.all.each do |photo|
      photo.ward_id = photo.ward_id.to_i - 100
      photo.save!
    end
  end

  desc "auth"
  task auth: :environment do

    class OldAuthentication < ActiveRecord::Base
      establish_connection(
        adapter:  "postgresql",
        host:     "ec2-50-19-219-235.compute-1.amazonaws.com",
        username: "pzgmeerqjorqsu",
        password: "SDl2_Du6jaK5ft0ZMOa1WSUUmY",
        database: "d5n6373v208ugg",
      )
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

  desc "image"
  task watch: :environment do
    class OldImage < ActiveRecord::Base
      establish_connection(
        adapter:  "postgresql",
        host:     "ec2-50-19-219-235.compute-1.amazonaws.com",
        username: "pzgmeerqjorqsu",
        password: "SDl2_Du6jaK5ft0ZMOa1WSUUmY",
        database: "d5n6373v208ugg",
      )
      self.table_name = 'images'
    end

    OldImage.all.each do |image|
      hoge = Image.find(image.id)
      p image.image
      hoge.image = image.image
      hoge.save!
    end
  end







  desc "Linking"
  task linking: :environment do

    class OldPhoto < ActiveRecord::Base
      establish_connection(
        adapter:  "postgresql",
        host:     "ec2-50-19-219-235.compute-1.amazonaws.com",
        username: "pzgmeerqjorqsu",
        password: "SDl2_Du6jaK5ft0ZMOa1WSUUmY",
        database: "d5n6373v208ugg",
      )
      self.table_name = 'photos'
    end
    OldPhoto.all.each do |photo|
      image_id = photo.image_id
      image = Image.find(image_id)
      image.imageable_id = photo.id
      image.save!
    end

  end

  desc "image"
  task image: :environment do
    class OldImage < ActiveRecord::Base
      establish_connection(
        adapter:  "postgresql",
        host:     "ec2-50-19-219-235.compute-1.amazonaws.com",
        username: "pzgmeerqjorqsu",
        password: "SDl2_Du6jaK5ft0ZMOa1WSUUmY",
        database: "d5n6373v208ugg",
      )
      self.table_name = 'images'
    end

    OldImage.all.each do |image|
      Image.create!(
        id: image.id,
        image: image.image,
        created_at: image.created_at,
        updated_at: image.updated_at,
        imageable_type: 'Photo',
        imageable_id: 1,
      )
    end
  end

  desc "fuga"
  task user: :environment do
    class OldUser < ActiveRecord::Base
      establish_connection(
        adapter:  "postgresql",
        host:     "ec2-50-19-219-235.compute-1.amazonaws.com",
        username: "pzgmeerqjorqsu",
        password: "SDl2_Du6jaK5ft0ZMOa1WSUUmY",
        database: "d5n6373v208ugg",
      )
      self.table_name = 'users'
    end

    OldUser.all.each do |user|
      User.create(
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

  desc "hoge"
  task photo: :environment do

    class OldPhoto < ActiveRecord::Base
      establish_connection(
        adapter:  "postgresql",
        host:     "ec2-50-19-219-235.compute-1.amazonaws.com",
        username: "pzgmeerqjorqsu",
        password: "SDl2_Du6jaK5ft0ZMOa1WSUUmY",
        database: "d5n6373v208ugg",
      )
      self.table_name = 'photos'
    end

    OldPhoto.all.each do |photo|
      Photo.create(id: photo.id, town_id: photo.town_id, ward_id: photo.ward_id, user_id: photo.user_id, comment: photo.comment, created_at: photo.created_at, updated_at: photo.updated_at)
    end

  end
end
