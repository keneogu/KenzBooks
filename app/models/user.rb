class User < ApplicationRecord
  include SubscriptionConcern

  pay_customer stripe_attributes: :stripe_attributes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options dependent: :destroy do |assoc|
    assoc.has_many :articles
    assoc.has_many :comments
  end

  validates :email, uniqueness: true
end
