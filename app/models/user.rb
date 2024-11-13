class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes
  has_many :comments
  has_many :posts
  
  followability

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end
  
end
