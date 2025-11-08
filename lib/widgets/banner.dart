import 'package:flutter/material.dart';
import 'package:product_hub/models/banner-model.dart';
import 'package:product_hub/utils/colors.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = [
      BannerModel(
        title: "Big News\nSales On",
        subtitle: "Available until - 11 December",
        color: AppColors.buttonColor,
        imageUrl: "assets/images/bannerImg1.jpg",
      ),
      BannerModel(
        title: "Hot Offer\nNew Arrival",
        subtitle: "Available until - 20 December",
        color: AppColors.buttonColor,
        imageUrl: "assets/images/bannerImg2.jpg",
      ),
    ];

    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16, right: 8), 
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          return BannerItem(
            title: banner.title,
            subtitle: banner.subtitle,
            color: banner.color,
            imageUrl: banner.imageUrl,
          );
        },
      ),
    );
  }
}

class BannerItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final String imageUrl;

  const BannerItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageUrl,
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(80),
                bottomRight: Radius.circular(80),
              ),
              child: Container(
                width: 180,
                height: 150,
                padding: const EdgeInsets.all(16),
                color: color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
