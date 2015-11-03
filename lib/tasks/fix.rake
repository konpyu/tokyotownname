namespace :fix do
  desc "fix user post num data"
  task user_post_num: :environment do
    Photo.group(:user_id).count.each do |uid, cnt|
      user = User.find(uid)
      user.post_num = cnt
      user.save!
    end
  end
end
