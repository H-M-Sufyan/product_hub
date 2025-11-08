import 'package:flutter/material.dart';
import 'package:product_hub/utils/colors.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber; // Pass phone/email if needed
  const VerificationScreen({super.key, required this.phoneNumber});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  // Controllers for 4-digit code
  final TextEditingController digit1 = TextEditingController();
  final TextEditingController digit2 = TextEditingController();
  final TextEditingController digit3 = TextEditingController();
  final TextEditingController digit4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "Verification",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Verification code sent to ${widget.phoneNumber}",
              style: TextStyle(color: AppColors.fontSecondaryColor),
            ),
            SizedBox(height: 100),

            // Row for heading and resend
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Verification Code",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Implement resend code logic
                    print("Resend Code tapped");
                  },
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                      color: AppColors.buttonColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            // 4-digit input boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDigitTextField(digit1),
                _buildDigitTextField(digit2),
                _buildDigitTextField(digit3),
                _buildDigitTextField(digit4),
              ],
            ),

            SizedBox(height: 200),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  String code =
                      "${digit1.text}${digit2.text}${digit3.text}${digit4.text}";
                  print("Entered Code: $code");
                  // TODO: Implement verification logic
                },
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
    );
  }

  // Helper function for 1-digit text field
  Widget _buildDigitTextField(TextEditingController controller) {
    return Container(
      width: 60,
      height: 60,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
