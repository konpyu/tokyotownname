namespace :development do
  desc 'reset dev and test database'
  task :refresh do
    if Rails.env.production?
      abort 'This task cannot be executed in production.'
    else
      %w(db:drop db:create db:schema:load db:seed_fu).each do |task|
        puts "Executing task #{task}\n"
        Rake::Task[task].invoke
      end
    end
  end
end
