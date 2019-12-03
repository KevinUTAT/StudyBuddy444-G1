class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_many :posts
  # has_many :post_members, :through => :posts

  has_many :posts
  has_many :notes
  has_many :groups
  has_one :profile, dependent: :destroy
  has_one :page, dependent: :destroy

  validates :page, presence:true

  
  # before_create :build_profile
  # accepts_nested_attributes_for :profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
  acts_as_voter

  def accept_donation_user(amount)
    self.balance += amount.to_f
    self.save
  end
end
