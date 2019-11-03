class PostMember < ApplicationRecord
    has_many :posts
    has_many :users, :through => :post
end
