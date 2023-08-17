import 'package:flutter/material.dart';

import '../layouts/category_page.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imagePath;

  CategoryItem({
    required this.id,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 7.0,
        right: 7.0,
      ),
      child: Column(
        children: [
          Container(
            height: 70.0,
            width: 70.0,
            child: Card(
              elevation: 6.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    // mengambail layouts import '../layouts/category_page.dart';
                    CategoryPage.routePath,
                    arguments: {
                      'id': id,
                      'title': title,
                    },
                  );
                },
                borderRadius: BorderRadius.circular(40.0),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(imagePath),
                ),
              ),
            ),
          ),
          Container(
            child: Text(title),
            margin: EdgeInsets.only(
              top: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
