class Comment < ApplicationRecord
  before_save :check_nil
  
  belongs_to :user
  belongs_to :article

  validates :content, presence: true

  def check_nil
    Comment.find_each { |comment| comment.destroy unless comment.user }
  end
  
end
