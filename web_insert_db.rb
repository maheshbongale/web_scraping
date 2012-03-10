require 'rubygems'
require "dbi"

begin
     # connect to the MySQL server
     dbh = DBI.connect("DBI:Mysql:TESTDB:localhost", 
	                    "root", "webonise6186")
     sth = dbh.prepare( "INSERT INTO EMPLOYEE(FIRST_NAME,
                   LAST_NAME, 
                   AGE, 
 		   SEX, 
		   INCOME)
                   VALUES (?, ?, ?, ?, ?)" )
     sth.execute('John', 'Poul', 25, 'M', 2300)
     sth.execute('Zara', 'Ali', 17, 'F', 1000)
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