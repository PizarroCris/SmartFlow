class User < ApplicationRecord
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
         
  has_many :weekly_goals
  has_many :tasks

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, uniqueness: { case_sensitive: false }
end