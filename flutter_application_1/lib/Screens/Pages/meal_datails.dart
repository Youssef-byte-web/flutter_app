import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/meal.dart';

bool? isChecked = false;
bool? isChecked2 = false;

class MealDatails extends StatefulWidget {
  final Meal meal;
  const MealDatails({super.key, required this.meal});

  @override
  State<MealDatails> createState() => _MealDatailsState();
}

class _MealDatailsState extends State<MealDatails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Details"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              Image.network(
                widget.meal.image,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                widget.meal.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("Category: ${widget.meal.category}"),
              SizedBox(height: 10),
              Text("Area: ${widget.meal.area}"),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Instructions:",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Text(
                    widget.meal.instructions,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Ingredients:",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              CheckboxListTile(
                title: Text(widget.meal.ingredient.first),
                value: isChecked2,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked2 =
                        newValue ??
                        false;
                  });
                },

                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title: Text(widget.meal.ingredient.last),
                value: isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue ?? false;
                  });
                },

                controlAffinity: ListTileControlAffinity.leading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
