Some very short note:

Thanks for download this application.  After getting a lot feedback from user...  
especialy about database connection.. I'm very sorry for no provide complete 
installation guide.

By default the database is using MS SQL using root as login and masteryoda as password.
To change it using other JDBC database server and login/password, pls change the below
2 files:
- common\dbconnect.jsp
- WEB-INF\classes\sjservlets\ConnectionPoolServlet.java (please re-compile)

This application is one of my study unit's assignmnet, I do it in rush
(finish in 2 months with one person working only, also that is my first time 
using Java for development)  So a lot place need to improve.  I will make a second version in 
year 2002.

That will be a lot thing I can include for next version...  more than I can imagine after I had
back to work (stop 1 1/2 years for my master study) and learn from working place.  For example:
- xml config file for easy modify and extent
- war file for easy deloyment
- support more database server
- more userfriendly GUI
- java mail for notice
- support barcode and samrt card device
- label printing
- search result can be export to database
- library iteam having graphics display like book cover
- natural langauge searching
- SWING version
- J2EE support
- User can be import and sync with LDAP directory
- provide custom API for other application linking this library system
- improve the database pool.
- more...

p/s: Pls let me know your ideal that I can enhance that system.

Rgds,
Song Jing