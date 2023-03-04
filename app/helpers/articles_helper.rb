module ArticlesHelper
	def tag_image(article)
	 if article.image.attached?
		image_tag article.image, class: "w-full h-52"
	 end
	end

	def portal
		@portal_session.url unless @portal_session.nil?
	end

	def likes_count(article)
    article.likes.count
  end
end
