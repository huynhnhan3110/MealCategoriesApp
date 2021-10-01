import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.headline1),
    );
  }

  Widget buildContainer(Widget childWidget) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: childWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String idMeal = routeArgs['id'];
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == idMeal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).dividerColor,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${(index + 1)}'),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: meal.steps.length,
            ))
          ],
        ),
      ),
    );
  }
}
