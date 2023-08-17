import 'package:flutter/material.dart';

import 'layouts/home_page.dart';
import 'layouts/category_page.dart';
import 'layouts/detail_resep_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes',
      initialRoute: HomePage.routePath,
      routes: {
        HomePage.routePath: (context) => HomePage(),
        CategoryPage.routePath: (context) => CategoryPage(),
        RecipeDetailsPage.routePath: (context) => RecipeDetailsPage(),
      },
    );
  }
}
