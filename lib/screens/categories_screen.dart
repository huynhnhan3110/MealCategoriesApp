import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DeliMeal"),),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((cateData) => CategoryItem(id: cateData.id,title: cateData.title, color: cateData.color,)).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20)),
    );
  }
}
