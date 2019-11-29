class Page < ApplicationRecord
    belongs_to :user

    validates :name, presence:true
    validates :user_id, presence:true

    has_many_attached :attachments
    has_one_attached :resume
end
