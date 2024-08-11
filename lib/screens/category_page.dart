import 'package:flutter/material.dart';
import 'package:store_app/screens/electornics.dart';
import 'package:store_app/screens/jewelery_page.dart';
import 'package:store_app/screens/mens_clothes.dart';
import 'package:store_app/screens/women_page.dart';
import 'package:store_app/widgets/category_card.dart';

class CategoryPage extends StatelessWidget {
  static String id = 'CategoryPage';

  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .7, // Number of columns
              crossAxisSpacing: 8.0, // Spacing between columns
              mainAxisSpacing: 8.0, // Spacing between rows
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (index == 0) {
                    Navigator.pushNamed(context, WomenPage.id);
                  } else if (index == 1) {
                    Navigator.pushNamed(context, MenPage.id);
                  } else if (index == 2) {
                    Navigator.pushNamed(context, JeweleryPage.id);
                  } else if (index == 3) {
                    Navigator.pushNamed(context, ElectronicsPage.id);
                  }
                },
                child: CategoryCard(
                  category: categories[index],
                  image: images[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

List<String> categories = [
  "Women's Clothing",
  "Men's Clothing",
  "Jewelery",
  "Electronics",
];

List<String> images = [
  "assets/images/woman.jpg",
  "assets/images/men.jpeg",
  "assets/images/jwelery.jpeg",
  "assets/images/electro.jpeg",
];
