desc "Encrypt passwords"
task :encrypt_passwords => :environment do |variable|
  User.where("password_plain is not null").find_each do |user|
    user.password = user.password_plain
    user.password_confirmation = user.password_plain
    user.password_plain =  nil
    user.save
  end
end
