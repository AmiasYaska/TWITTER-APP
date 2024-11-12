class Post < ApplicationRecord
    has_rich_text :body
    has_many :likes

end
