import 'package:flutter/material.dart';
import 'package:product_hub/utils/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text(
                "Register Account",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 16),
              Text(
                "Please enter your active email",
                style: TextStyle(color: AppColors.fontSecondaryColor),
              ),

              SizedBox(height: 50),
              Text("Email/Phone"),

              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Email/phone",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 200),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(color: AppColors.fontColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Have an account? "),
            GestureDetector(
              onTap: () {
                Navigator.pop(context); 
              },
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
