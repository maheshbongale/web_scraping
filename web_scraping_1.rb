#class for web scraping
class WebScraping
	require 'hpricot'
	require 'open-uri'
	def initialize(url)
		@url = http://simplyrecipes.com/title/tt0335266/;
		@hp = Hpricot(open(@url))
	end
	def  title
		@title = @hp.at("meta[@name='title']")['content']
	end
end
