import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId = "";

  // Send OTP
  Future<void> sendOTP({
    required String phoneNumber,
    required Function onCodeSent,
    required Function(String) onError,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (verificationId, resendToken) {
        this.verificationId = verificationId;
        onCodeSent();
      },
      verificationFailed: (error) {
        onError(error.message ?? "Verification failed");
      },
      codeAutoRetrievalTimeout: (_) {},
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
    );
  }

  // Verify OTP
  Future<String?> verifyOTP(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
      return null; // success
    } catch (e) {
      return e.toString();
    }
  }
}
