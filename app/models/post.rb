class Post < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    has_rich_text :body
    has_many :likes
    has_many :comments
    belongs_to :user
    has_many :views, dependent: :destroy

end
