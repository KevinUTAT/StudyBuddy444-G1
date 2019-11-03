class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_many :posts
  # has_many :post_members, :through => :posts

  has_many :posts


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
