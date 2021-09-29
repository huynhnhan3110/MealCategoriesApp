import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final idCategory = routeArgs['id'];
    final titleCategory = routeArgs['title'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(idCategory);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(titleCategory),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: categoryMeal[index].title,
            urlImage: categoryMeal[index].imageUrl,
            complexity: categoryMeal[index].complexity,
            affordability: categoryMeal[index].affordability,
            duration: categoryMeal[index].duration,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
