class Group < ApplicationRecord
    belongs_to :user

    def self.search(search)
        if search
            if search == ""
                self.all
            else
                self.where("lower(category) = ?", search.downcase)
            end
        else
            self.all
        end
    end
end
