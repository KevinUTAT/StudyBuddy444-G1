class Note < ApplicationRecord
    belongs_to :user
    # belongs_to :user
    # belongs_to :post_member
    
    def self.search(search)
        if search
            self.where(course: search)
        else
            self.all
        end
    end
end
