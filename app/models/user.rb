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
    assoc.has_many :likes
  end

  validates :email, uniqueness: true
  validates :email, presence: true


  def stripe_attributes(pay_customer)
    {
      metadata: {
        pay_customer_id: pay_customer.id,
        user_id: id # or pay_customer.owner_id
      }
    }
  end
end
