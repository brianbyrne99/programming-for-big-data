Instructions
1) Move this folder to a suitable place so it can be accessed on the bash line.

2) Make every bash file exectutable using the following command on the bashline:
 chmod u+x <bashfilename>.sh

3) ./<bashfilename>.sh runs the bash file after the file has been made executable

4)Run in order on bash line:
q1.sh
q2.sh
q3.sh
q4.sh
q5.sh
q6a.sh
q6b.sh

5) Now execute the MySQL commands from the report to create the database and then the tables. You will need open the MySQL shell by issuing the command <mysql> on your bash line.
6) After running the the MySQL commands, run the populateMySQL.sh bash script. That will populate the newly formed tables:
./populateMySQL.sh
7) Now execute the Mongo commands by running ./populateMongo.sh. You will need open the MongoDB shell by issuing the command <mongo> on your bash line.




