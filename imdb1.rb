class IMDB
	require 'rubygems'
	require 'hpricot'
	require 'open-uri'
	#require 'web_db.rb'	
	require 'dbi'

	def initialize(url)
		@url = url;
		@hp = Hpricot(open(@url))
	end
	def  title
		@title = @hp.at("meta[@name='title']")['content']
	
	
		begin
			# connect to the MySQL server
			dbh = DBI.connect("DBI:Mysql:testdb:localhost", "root", "webonise6186")
			# get server version string and display it
			row = dbh.select_one("SELECT VERSION()")
			puts "Server version: " + row[0]
			rescue DBI::DatabaseError => e
			puts "An error occurred"
			puts "Error code:    #{e.err}"
			puts "Error message: #{e.errstr}"
			ensure
			# disconnect from server
			dbh.disconnect if dbh
		end
	
		begin
			# connect to the MySQL server
			dbh = DBI.connect("DBI:Mysql:testdb:localhost", "root", "webonise6186")
			sth = dbh.prepare( "INSERT INTO info("#{@title}") VALUES (?)" )
			sth.execute("#{@title}")			
			sth.finish
			dbh.commit
			puts "Record has been created"
			rescue DBI::DatabaseError => e
			puts "An error occurred"
			puts "Error code:    #{e.err}"
			puts "Error message: #{e.errstr}"
			dbh.rollback
			ensure
			# disconnect from server
			dbh.disconnect if dbh
		end
	end

end
