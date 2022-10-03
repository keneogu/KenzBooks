module ArticlesHelper
	def tag_image(article)
	 if article.image.attached?
		image_tag article.image, class: "img"
	 end
	end
end
