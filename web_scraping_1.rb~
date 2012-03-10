class WebScraping
	require 'rubygems'
	require 'hpricot'
require 'hpricot'
	require 'open-uri'
	def initialize(url)
		@url = url
		@hp = Hpricot(open(@url))
	end
	def  title
		@title = @hp.at("meta[@name='title']")['content']
	end
end
