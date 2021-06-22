//The following scala script displays completes all questions from task 2
//By Brian Byrne (18391933)

import org.apache.spark._
import org.apache.spark.rdd.RDD
import org.apache.spark.util.IntParam
import org.apache.spark.graphx._
import org.apache.spark.graphx.util.GraphGenerators
// import classes required for using GraphX

// defining the Coauthorship Schema
case class Coauthorship(author1:String, author2:String)

// Function to parse the inputted file into the coauthorship class
def parseAuthors(str: String): Coauthorship={
	val line=str.split(",")
	Coauthorship(line(0),line(1))
}

// load the data into a RDD variable
var textRDD = sc.textFile("dblp_coauthorship.csv")
// seperate the header and data rows
val header=textRDD.first()
textRDD = textRDD.filter(row => row != header)
val coauthorshipRDD = textRDD.map(parseAuthors).cache()

//Creatiing tuples and assigning an index to each individual author. 
val authorIDs = coauthorshipRDD.flatMap(coauthorship => Seq((coauthorship.author1))).distinct.zipWithIndex

// Map the ids to the authors names
val authorMap=authorIDs.map{ case (name,id) => (name,id) }.collect.toMap 
// create routes RDD with srcid, destid, distance
val routes = coauthorshipRDD.map(coauthorship => (authorMap.get(coauthorship.author1), authorMap.get(coauthorship.author2))).distinct
// Set a univeral distance equal to one for graphx edges
val distance=1
// Defining a default vertex called nobody
val nobody="nobody"
// Formatting the authorIDs tuples as (id, author instead of author, id). These are the vertices
val swappedAuthors=authorIDs.map(_.swap)
//Creating our edges 
val edges=routes.map { case (id1,id2) =>Edge(id1.get,id2.get,distance) }

println("\nQuestion 2.1:\n") 

// Creting the graphx graph
val graph = Graph(swappedAuthors, edges, nobody)

//simple display features to show the design of the graph
val temp1=graph.vertices.take(4)
val temp2=graph.edges.take(4)
var string1 = temp1.mkString(" , ")
var string2 = temp2.mkString(" , ")
println("First 4 vertices ",string1)
println("First 4 edges ",string2)

////q2
// Retrieving the shortest path package to use ShortestPaths
import org.apache.spark.graphx.lib.ShortestPaths
// Getting the int value for Paul Erdös
val erdosInt= authorMap.get("Paul Erdös").get
//computing the length of the shortest path between Erd}os and the author authors.
val shortestPaths= ShortestPaths.run(graph,Seq(erdosInt)).vertices.collect
//finding the distance from the tuples
val values = shortestPaths.map(element => element._2).map(element => element.values)
// erdos is the longest shortest path
val erdos  = values.map(m => m.max).max
//displaying results of the answer
println("\nQuestion 2.2:\nMaximum Erdos number of authors:") 
println(erdos)

System.exit(0)

