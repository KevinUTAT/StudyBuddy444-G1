class Post < ApplicationRecord
    # dependant on user but not post_member
    # validates_prescence_of :user

    belongs_to :user
    # belongs_to :user
    # belongs_to :post_member
end
