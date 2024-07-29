import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/screens/auth_screens/signup_screen.dart';
import 'package:travel_app/screens/welcome_screen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/forgot_password_image.png",
                height: 35.h,
                width: 80.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w, top: 2.h),
              child: Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.only(left: 8.w, top: 2.h, right: 2.w),
              child: Text(
                "Don't worry! Please enter your e-mail address below. We will send you a link to change your password.",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 126, 126, 126),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 180, 180, 180),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: GestureDetector(
                onTap: () {
                  // Burada geçiş yapmak istediğiniz sayfayı belirtmelisiniz
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (WelcomeScreen())),
                  );
                },
                child: Container(
                  height: 8.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Color.fromARGB(255, 5, 190, 146),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: "Do you have an account? ",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color.fromARGB(255, 5, 190, 146),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Burada yönlendirme işlemi yapılacak
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
