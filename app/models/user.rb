class User < ActiveRecord::Base
  attr_accessor :password_confirmation

  validates_presence_of :name, :email, :password
  #cria um campo password confirmation e compara c o password
  validates_confirmation_of :password
  validates_format_of :email,
      with: /\A[a-z0-9.]+(\+[a-z0-9_-]+)?@[a-z0-9.-]+\.[a-z]{2,4}\z/

end
