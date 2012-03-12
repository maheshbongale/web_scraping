class IMDB
	require 'mechanise'
	require 'rubygems'
	require 'hpricot'
	require 'open-uri'	
	require 'dbi'
	
	@@title = ""
	@@desc = ""

	def initialize(url)
		@url = url;
		@hp = Hpricot(open(@url))		
	end
	
	
	def  title
		
		obj=Mechanize.new
		page=obj.get(@hp)
		@@title = page
		#@@title = @hp.at("//title").inner_text		
		@@desc = @hp.at("meta[@name='description']")['content']
		puts @@title.class
		puts @@desc.class
		puts "title = " + "#{@@title}"
		puts "Description = " + "#{@@desc}"	
	end
	#def description
		#@@desc = @hp.at("meta[@name='description']")['content']
		#puts @@desc
	#end
	
	
	#begin
		# connect to the MySQL server
	#	dbh = DBI.connect("DBI:Mysql:testdb:localhost", "root", "webonise6186")
		# get server version string and display it
	#	row = dbh.select_one("SELECT VERSION()")
	#	puts "Server version: " + row[0]
	#	rescue DBI::DatabaseError => e
	#	puts "An error occurred"
	#	puts "Error code:    #{e.err}"
	#	puts "Error message: #{e.errstr}"
	#	ensure
		# disconnect from server
	#	dbh.disconnect if dbh
	#end
	
	begin
		# connect to the MySQL server
		dbh = DBI.connect("DBI:Mysql:testdb:localhost", "root", "webonise6186")
		#puts @@title
		sth = dbh.prepare( "INSERT INTO Info(,title,item,ingrediends,description,method)VALUES (?,?,?,?,?,?)" )
		sth.execute(@@title,@@desc)
		#sth.execute(@@desc)
		#th.execute(@@title)
		#sth.execute(@@desc)
		sth.finish
		dbh.commit
		puts "Record has been created"
		rescue DBI::DatabaseError => e
		puts "An error occurred"
		puts "Error code:#{e.err}"
		puts "Error message: #{e.errstr}"
		dbh.rollback
		ensure
		# disconnect from server
		dbh.disconnect if dbh
	end	

end
