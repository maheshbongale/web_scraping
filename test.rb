	require 'rubygems'
	require 'mechanize'
	require 'hpricot'
	require 'open-uri'	
	require 'dbi'
	
		title = ""
		desc = ""

		obj=Mechanize.new
		#@host = .host_with_port 
	
		page=obj.get('http://simplyrecipes.com/subject-index.php')
		title = page.content
		doc1=Hpricot(title)
		puts "doc1 = " + "#{doc1}"		
		
		puts "**********************************"

			(doc1/"div.center-module/p/a[@href]").each do |i|
			puts i.attributes['href']
			#page1=obj.get(i.attributes['href'])
			
			end 
			#link1 = page1.content
			#doc2=Hpricot(link1)
			#doc=Hpricot(i.attributes['href'])
			puts "doc2 = " + "#{doc2}"
			(doc2/"div.center-module/p/a[@href]").each do |j|
				page2=obj.get(j.attributes['href'])
				link2 = page2.content
				puts "doc3 = " + "#{doc2}"
			end
		end


=begin		
		link=links.to_a
		puts "title = " + "#{links}"
		puts links.split
		link.each do |i|
		puts "#{link[i]}"
    	 end		
		
		title = (doc/"/html/head/title").innerHTML
		puts "title = " + "#{title}"
		
		item = (doc/"h1.fn").innerHTML		
		puts "item = " + "#{item}"
		
		desc = (doc/"div#recipe-intro").innerHTML
		puts "Description = " + "#{desc}"
		
		
		ingrediants = (doc/"li.ingredient").innerHTML
		puts "ingredients = " + "#{ingrediants}"
		
		description = (doc/"div#recipe-intro/p").innerHTML
		puts "description = " + "#{description}"
		
		
		method = (doc/"div#recipe-method/p").innerHTML
		puts "Methods = " + "#{method}"
		puts "Description = " + "#{links}"	
	
		def description
		@@desc = @hp.at("meta[@name='description']")['content']
		puts @@desc
		end
		
		begin
		 connect to the MySQL server
			dbh = DBI.connect("DBI:Mysql:testdb:localhost", "root", "webonise6186")
		 get server version string and display it
			row = dbh.select_one("SELECT VERSION()")
			puts "Server version: " + row[0]
			rescue DBI::DatabaseError => e
			puts "An error occurred"
			puts "Error code:    #{e.err}"
			puts "Error message: #{e.errstr}"
			ensure
		 disconnect from server
			dbh.disconnect if dbh
		end
		begin
		 connect to the MySQL server
		dbh = DBI.connect("DBI:Mysql:testdb:localhost", "root", "webonise6186")
		puts @@title
		sth = dbh.prepare( "INSERT INTO Info(title,description)VALUES (?,?)" )
		sth = dbh.prepare( "INSERT INTO Info(title,item,ingrediants,description,method)VALUES (?,?,?,?,?)" )
		
		sth.execute(title,item,ingrediants,description,method) 
		sth.execute(@@desc)
		th.execute(@@title)
		sth.execute(@@desc)
		sth.finish
		dbh.commit
		puts "Record has been created"
		rescue DBI::DatabaseError => e
		puts "An error occurred"
		puts "Error code:#{e.err}"
		puts "Error message: #{e.errstr}"
		dbh.rollback
		ensure
		disconnect from server
		dbh.disconnect if dbh
	end	
=end	