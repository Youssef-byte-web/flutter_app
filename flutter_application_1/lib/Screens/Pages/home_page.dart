import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Pages/meal_datails.dart';
import 'package:flutter_application_1/data/helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List> futureMeals;
  @override
  void initState() {
    super.initState();
    futureMeals = fetchMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("recipe generator"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text("feeling hungry"),
            SizedBox(height: 30),

            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                minimumSize: Size(200, 200)
              ),
              onPressed: () {
                setState(() {
                  futureMeals = fetchMeals();
                });
              },
              child: Text("Surprise Me"),
            ),
              SizedBox(height: 30,),
            FutureBuilder(future:futureMeals, builder:(context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final meal = snapshot.data![0];
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30),
                    child: Card(
                      child: Row(
                        children: [
                          Image.network(meal.image, height: 100, width: 100, fit: BoxFit.cover),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(meal.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                Text(meal.category),
                                Text(meal.area),
                                Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                                  FilledButton(style: FilledButton.styleFrom(backgroundColor: Colors.teal ,foregroundColor: Colors.white),onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MealDatails(meal: meal,)));
                                  }, child: Text("View Recipe"))
                                ],)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Text('No data found');
              }
            },)
          ],
        ),
      ),
    );
  }
}
