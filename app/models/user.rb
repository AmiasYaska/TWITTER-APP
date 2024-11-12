class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes
  has_many :comments
  has_many :posts

  # Users that a user is following
  has_many :active_relationships, class_name: "Follower", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :user

  # Users that follow the user
  has_many :passive_relationships, class_name: "Follower", foreign_key: "user_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower


end
