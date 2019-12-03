class Page < ApplicationRecord
    belongs_to :user

    validates :name, presence:true
    validates :user_id, presence:true

    has_one_attached :transcript
    has_one_attached :resume
    has_one_attached :avatar

    def self.search(search)
        if search
            if search == ""
                self.all
            else
                people = self.all.where("lower(name) LIKE ?", "%#{search.downcase}%")
                descriptions = self.all.where("lower(about_me) LIKE ?", "%#{search.downcase}%")
                return people + descriptions
            end
        else
            self.all
        end
    end

end
