//The following scala script displays completes all questions from task 1
//By Brian Byrne (18391933)
// Reading in the file as a CSV
val bigData =spark.read.format("com.databricks.spark.csv").option("header", "true").option("inferSchema","true").load("github-big-data.csv")

// Making a temporary table to preform queries using the scala and SQL languages
bigData.registerTempTable("bigTable1")

//Which project has the most stars
val maxStars=spark.sql("select name, description, language, stars from bigTable1 where stars = (select max(stars) from bigTable1)")

//The total number of stars for each language
val numStars=spark.sql("select language, sum(stars) from bigTable1 group by language")

//Determine the number of project descriptions that contain the word "data"
val numDataOccurances=spark.sql("select count(description) from bigTable1 WHERE description LIKE '%data%'")

//Of the data columns that have their language value set (not empty/null)
val numNonEmptyDataOccurances=spark.sql("select count(description) from bigTable1 WHERE CHAR_LENGTH(language)>0 AND description LIKE '%data%'")

//isolating the column
val descriptionCol=spark.sql("select description from bigTable1")

// Converting the column to a text file 
descriptionCol.write.format("csv").option("header","true").mode("overwrite").option("sep",",").save("temp.csv")
val asText=sc.textFile("temp.csv")
//MapReduce job that counts the number of words in the textfile 
val wordCount = asText.flatMap(line => line.split(" ")).map(word => (word, 1)).reduceByKey(_ + _);

//Formatting the veritices to display the most commonly occuring word
val swap=wordCount.map(_.swap)
val ordered=swap.sortByKey(false,1)

//Displaying the answers to each Question
println("Question 1:")
maxStars.collect.foreach(println)
println("\nQuestion 2:")
numStars.collect.foreach(println)
println("\nQuestion 3(a):")
numDataOccurances.collect.foreach(println)
println("\nQuestion 3(b):")
numNonEmptyDataOccurances.collect.foreach(println)
println("\nQuestion 4:")
val mostCommon=ordered.take(1)
val RDD = sc.parallelize(mostCommon)
RDD.collect.foreach(println)
System.exit(0)
