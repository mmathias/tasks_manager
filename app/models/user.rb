class User < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_uniqueness_of :email, :login
  validates_format_of :email,
      with: /\A[a-z0-9.]+(\+[a-z0-9_-]+)?@[a-z0-9.-]+\.[a-z]{2,4}\z/

  has_secure_password

  has_many :tasks
end
