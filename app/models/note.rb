class Note < ApplicationRecord
    validates :title, presence: true
    validates :course, presence: true, :case_sensitive => false
    
    belongs_to :user
    has_one :page, :through => :user
    
    has_many_attached :attachments, dependent: :delete_all
    has_many :comments, dependent: :delete_all
    
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

    def accept_donation(amount)
        self.user.accept_donation_user(amount.to_f)
    end

    def self.searchEmail(search)
        if search
            if search == ""
                self.all
            else
                self.joins(:user).where("lower(Users.email) = ?", search.downcase)
            end
        else
            self.all
        end
    end

    def self.searchName(search)
        if search
            if search == ""
                self.all
            else
                self.joins(:page).where("lower(Pages.name) = ?", search.downcase)
            end
            else
                self.all
        end
    end
end
