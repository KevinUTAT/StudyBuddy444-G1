class Note < ApplicationRecord
    belongs_to :user
    
    has_many_attached :attachments
    
    acts_as_votable
    
    def self.search(search)
        if search
            if search == ""
                self.all
            else
                self.where(course: search)
            end
        else
            self.all
        end
    end
end
