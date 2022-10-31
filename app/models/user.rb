class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options dependent: :destroy do |assoc|
    assoc.has_many :articles
    assoc.has_many :comments
    assoc.has_many :likes
  end

  # has_many :articles, :dependent => :destroy
  # has_many :comments, :dependent => :destroy
  # has_many :likes, :dependent => :destroy

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true
end
