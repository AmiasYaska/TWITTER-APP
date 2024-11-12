class Post < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    has_rich_text :body
    has_many :likes

end
