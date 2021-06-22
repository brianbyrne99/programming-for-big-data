Name: Brian Byrne
Student Number: 18391933

To run the Scala files, copy the file to your docker master, making sure both the master and the worker 
containers are running:

docker cp filepath masterContainerID:/

**Make sure you have both datasets in the folder**

Now simply run the following commands on your Masters ba$h line:
_______________________________________

/spark/bin/spark-shell -i task1.scala

/spark/bin/spark-shell -i task2.scala


This will display the results of all the questions in each task.