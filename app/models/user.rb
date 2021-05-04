class User < ApplicationRecord
  has_secure_password

  has_many :wrestlers
  has_many :teams, through: :wrestlers
end
