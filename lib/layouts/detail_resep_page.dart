import 'package:flutter/material.dart';

import '../utilities/data_app.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/recipe_details.dart';

class RecipeDetailsPage extends StatelessWidget {
  static const routePath = '/recipe-details';

  @override
  Widget build(BuildContext context) {
    final _recipeId = ModalRoute.of(context)?.settings.arguments as String;
    final _selectedRecipe =
        DUMMY_RECIPES.firstWhere((recipe) => recipe.id == _recipeId);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    _selectedRecipe.imagePath,
                    height: 250.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 15.0,
                    left: 15.0,
                    child: CustomBackButton(),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      height: 15.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 0.0,
                  bottom: 15.0,
                  left: 15.0,
                  right: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _selectedRecipe.recipeCategoryTitle,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedRecipe.title,
                          style: TextStyle(
                            color: Color(0x99000000),
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                        InkWell(
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.black54,
                          ),
                          onTap: () {
                            print('My fav');
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconText(
                          icon: Icons.access_time,
                          text: '${_selectedRecipe.duration} mins',
                        ),
                        IconText(
                          icon:
                              _selectedRecipe.recipeCategoryTitle == 'Beverages'
                                  ? Icons.local_bar
                                  : Icons.room_service,
                          text: '${_selectedRecipe.servings} servings',
                        ),
                        IconText(
                          icon: Icons.whatshot,
                          text: '${_selectedRecipe.calories} calories',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      thickness: 0.3,
                      color: Colors.black54,
                    ),
                    RecipeDetails(
                      title: 'Ingredients',
                      recipeInfo: _selectedRecipe.ingredients,
                    ),
                    RecipeDetails(
                      title: 'Cooking Instructions',
                      recipeInfo: _selectedRecipe.instructions,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  IconText({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15.0,
          color: Colors.orange,
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
