class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username

  has_many :wrestlers
  has_many :teams, through: :wrestlers
end
