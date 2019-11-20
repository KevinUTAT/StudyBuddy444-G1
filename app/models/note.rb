class Note < ApplicationRecord
    belongs_to :user
    
    has_many_attached :attachments
    
    acts_as_votable
    
    def self.search(search)
        if search
            self.where(course: search)
        else
            self.all
        end
    end
end
