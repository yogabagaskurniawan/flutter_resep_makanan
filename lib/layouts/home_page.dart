import 'package:flutter/material.dart';
import 'package:flutter_resep_makanan/utilities/data_app.dart';

// import '../utilities/constants.dart';
import '../widgets/category_item.dart';
import '../widgets/recipe_item.dart';

class HomePage extends StatefulWidget {
  static const routePath = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showAllTopRecipes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 0.0,
              top: 25.0,
              bottom: 15.0,
              right: 0.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        CircleAvatar(
                          radius: 14.0,
                          backgroundImage: AssetImage('assets/images/pp.jpg'),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Hi, Bagas',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      child: const Padding(
                        padding: EdgeInsets.only(
                          right: 10.0,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.black54,
                        ),
                      ),
                      onTap: () {
                        print('Search');
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      color: Color(0xAA000000),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 25.0,
                    bottom: 30.0,
                  ),
                  height: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: DUMMY_CATEGORIES.map((categoryData) {
                      return CategoryItem(
                        id: categoryData.id,
                        title: categoryData.title,
                        imagePath: categoryData.imagePath,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Top Recipes',
                    style: TextStyle(
                      color: Color(0xAA000000),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 25.0,
                  ),
                  height: 260.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // Display Top Recipes
                      ...DUMMY_RECIPES.take(5).map((recipeData) {
                        if (showAllTopRecipes ||
                            (recipeData.id == 'm1' ||
                                recipeData.id == 'm2' ||
                                recipeData.id == 'm3')) {
                          return RecipeItem(
                            id: recipeData.id,
                            category: recipeData.recipeCategoryTitle,
                            title: recipeData.title,
                            duration: recipeData.duration,
                            imagePath: recipeData.imagePath,
                          );
                        } else {
                          return Container();
                        }
                      }).toList(),
                      // Show More Button
                      if (!showAllTopRecipes)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showAllTopRecipes = true;
                            });
                          },
                          child: Container(
                            width: 260.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, size: 40.0),
                                Text('Show More',
                                    style: TextStyle(fontSize: 16.0)),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
