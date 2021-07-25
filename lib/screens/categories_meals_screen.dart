import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final CategoryId;
  // final CategoryTitle;

  // const CategoryMealsScreen( this.CategoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    print(categoryMeals);
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (BuildContext context, int index) {
          print('target1 reached');
          return MealItem(id: categoryMeals[index].id,title: categoryMeals[index].title, imageUrl: categoryMeals[index].imageUrl, duration: categoryMeals[index].duration, complexity: categoryMeals[index].complexity, affordability: categoryMeals[index].affordability);
        },
      ),
    );
  }
}
