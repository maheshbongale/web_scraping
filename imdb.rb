
	require 'rubygems'
	require 'hpricot'
	require 'open-uri'	
	require 'dbi'
	require 'active_record'

	class IMDB < ActiveRecord::Base
	@url      = "http://www.kumarritesh.com"
	@response = ''
	open(@url, "User-Agent" => "Ruby/#{RUBY_VERSION}"  ) 
	{ 
		|f| @response = f.read
	}

	doc = Hpricot(@response)
	links = (doc/"/html/body/div/div/div[2]/div[2]/div[3]/div/ul/li/a").innerHTML
	puts "#{links} "

	links.each do |link|
    scraplink = Scrap.new(:links => link)
    scraplink.save
    puts "#{link} "
  end
