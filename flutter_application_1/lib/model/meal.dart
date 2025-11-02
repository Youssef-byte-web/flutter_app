class Meal {
  final String title;
  final String category;
  final String area;
  final String instructions;
  final List<String> ingredient;
  final String image;
  Meal({
    required this.title,
    required this.category,
    required this.area,
    required this.instructions,
    required this.ingredient,
    required this.image,
  });
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      title: json['strMeal'] as String,
      category: json['strCategory'] as String,
      area: json['strArea'] as String,
      instructions: json['strInstructions'] as String,
      ingredient: List<String>.generate(20, (index) {
        final ingredient = json['strIngredient${index + 1}'];
        final measure = json['strMeasure${index + 1}'];
        if (ingredient != null &&
            ingredient.toString().isNotEmpty &&
            measure != null &&
            measure.toString().isNotEmpty) {
          return '$ingredient - $measure';
        }
        return '';
      }).where((item) => item.isNotEmpty).toList(),
      image: json['strMealThumb'] as String,
    );
  }
}