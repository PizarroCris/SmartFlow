class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
         
  has_many :weekly_goals
  has_many :tasks
  
  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
