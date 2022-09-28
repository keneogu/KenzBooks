class Article < ApplicationRecord
	enum category: [:adventure, :classic, :crime, :poetry, :action, :horror]
	has_one_attached :image
	has_one_attached :bodypdf

	belongs_to :user
	has_many :comments

	validates :title, :descrition, presence: true
end
