class User < ActiveRecord::Base

  has_sercure_password

  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, length: { in 6..20 }, on: :create
end
