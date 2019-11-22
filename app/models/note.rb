class Note < ApplicationRecord
    validates :title, presence: true
    validates :course, presence: true, :case_sensitive => false
    
    belongs_to :user
    
    has_many_attached :attachments
    
    acts_as_votable
    
    def self.search(search)
        if search
            if search == ""
                self.all
            else
                self.where("lower(course) = ?", search.downcase)
            end
        else
            self.all
        end
    end
end
