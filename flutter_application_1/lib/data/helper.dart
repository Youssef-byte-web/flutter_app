import 'package:flutter_application_1/model/meal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
Future<List<Meal>> fetchMeals() async {
  final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));
      if (response.statusCode == 200) {
        List<dynamic> jsonlist = (jsonDecode(response.body))['meals'];
        return jsonlist.map((json) => Meal.fromJson(json)).toList();

      }
      else {
        throw Exception('Failed to load meal');
      }
      
}