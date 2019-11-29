class Page < ApplicationRecord
    belongs_to :user

    validates :name, presence:true
    validates :user_id, presence:true

    has_one_attached :transcript
    has_one_attached :resume
end
