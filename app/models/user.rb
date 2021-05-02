class User < ApplicationRecord
  has_secure_password
  
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :wrestlers
  has_many :teams, through: :wrestlers
end
