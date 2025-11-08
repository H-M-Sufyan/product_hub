import 'package:flutter/material.dart';

class BannerModel {
  final String title;
  final String subtitle;
  final Color color;
  final String imageUrl;

  const BannerModel({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.imageUrl,
  });
}
