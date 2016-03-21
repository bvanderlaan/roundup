# Roundup
This is a clone of http://meetup.com

This project is primarly a learning exersice in using Rails but also for developing a tool which can be used offline within an orignization for hosting private meet ups...err round ups ;-)

The inspuration for the functionality for Roundup is pulled from http://meetup.com.


## Creating the mySQL database
Roundup uses a mySQL database to store all its data so you need to create a database and setup it up Roundup to use.
The database information that Roundup will use can be found at /config/database.yml
You can modify the settings if your setup differs.

To create and setup the mySQL database follow the following steps - this assumes you already have mySQL installed.
1. Open a terminal window and log into mySQL.
..* $ mysql -u root -p
2. Create the database, for this we'll create the development database.
..* mysql> create database roundup_development
3. Grant privliages to the admin user that Roundup will use when talking to the database (the user name and password are found in /config/database.yml).
..* mysql> grant all privileges on roundup_development.* <press enter>
..      -> to 'roundupadmin'@'localhost' <press enter>
..      -> identified by 'p@$$word'; <press enter to execute the above multi line command>
4. Now you can log out then try to log back in as roundupadmin.
..* mysql> exit
..* $ mysql -u roundupadmin -p p@$$word
5. Now you can switch to the newly created database.
..* mysql>use roundup_development

At this point if you run the command *mysql> show tables;* you will see that your database is empty. To popluate it run the following command in a terminal.
**Note you may have to run *bundle install* if you haven't already to isntall the required gems.**
..* $ rake db:migrate

If you go back to mySQL and run *mysql> show tables;* you should now see a list of tables.

At this point you should be read to go to start up your rails server and check out Roundup.