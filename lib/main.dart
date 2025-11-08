import 'package:flutter/material.dart';
import 'package:product_hub/screens/auth-ui/profile-password.dart';
import 'package:product_hub/screens/auth-ui/sign-in.dart';
import 'package:product_hub/screens/auth-ui/update-password.dart';
import 'package:product_hub/screens/auth-ui/verification.dart';
import 'package:product_hub/screens/user-panel/main-screen.dart';
import 'package:product_hub/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Hub',
      home: UserMainScreen(),
    );
  }
}
