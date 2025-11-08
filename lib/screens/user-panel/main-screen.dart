import 'package:flutter/material.dart';
import 'package:product_hub/utils/colors.dart';
import 'package:product_hub/widgets/banner.dart';
import 'package:product_hub/widgets/search-bar.dart';

class UserMainScreen extends StatelessWidget {
  const UserMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              BannerSection()
              
            ],
          ),
        ),
      ),
    );
  }
}
