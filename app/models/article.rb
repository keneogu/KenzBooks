class Article < ApplicationRecord
	enum category: [:adventure, :classic, :crime, :poetry, :action, :horror]
end
