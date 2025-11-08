import 'package:flutter/material.dart';
import 'package:product_hub/utils/colors.dart';
import 'package:product_hub/widgets/banner.dart';
import 'package:product_hub/widgets/categories-section.dart';
import 'package:product_hub/widgets/search-bar.dart';

import '../../models/category-model.dart';

class UserMainScreen extends StatelessWidget {
  const UserMainScreen({super.key});

  @override
  Widget build(BuildContext context) {


    // categories List
    final categories = [
      CategoryModel(name: "Foods", icon: Icons.fastfood, color: Colors.orange),
      CategoryModel(
        name: "Gifts",
        icon: Icons.card_giftcard,
        color: Colors.purple,
      ),
      CategoryModel(name: "Furniture", icon: Icons.chair, color: Colors.green),
      CategoryModel(
        name: "Fashion",
        icon: Icons.shopping_bag,
        color: Colors.pink,
      ),
      CategoryModel(
        name: "Electronics",
        icon: Icons.electrical_services_rounded,
        color: Colors.orange,
      ),
    ];
    // categories List


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Hub",
          style: TextStyle(
            color: AppColors.buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              CustomSearchBar(),
              BannerSection(),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ),
                      // );
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              CategoriesSection(categories: categories),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Product",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ),
                      // );
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: AppColors.buttonColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
