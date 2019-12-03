class PostApplication < ApplicationRecord
    belongs_to :user
    belongs_to :post

    public
    def accept_payment(amount)
        self.user.accept_donation_user(amount.to_f)
    end
    
end
