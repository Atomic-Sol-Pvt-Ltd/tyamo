import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:tyamo/views/auth/forgot_password.dart';
import 'package:tyamo/views/auth/register.dart';
import 'package:tyamo/views/profile/profile_setup.dart';
import 'package:tyamo/views/widgets/auth/auth_heading.dart';
import 'package:tyamo/views/widgets/auth/auth_text_field.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final RoundedLoadingButtonController _loginbtnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Tyamo",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff000221),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            //! -- Heading
            AuthHeading(
              mainText: "Sign in to Tyamo",
              subText: "To connect with \nyour partner",
              logo: "assets/images/symbol.png",
              logoSize: 30,
              fontSize: 18,
            ),

            //? -- Email TextField
            SizedBox(height: 50),
            AuthTextField(
              keyboardType: TextInputType.emailAddress,
              lableText: "Email",
              obscureText: false,
              icon: Icons.alternate_email,
              size: 15,
            ),

            //? -- Password TextField
            SizedBox(height: 20),
            AuthTextField(
              keyboardType: TextInputType.text,
              lableText: "Password",
              obscureText: true,
              icon: Icons.password,
              size: 15,
            ),

            //? -- Login Button
            SizedBox(height: 30),
            Hero(
              tag: "Auth",
              child: RoundedLoadingButton(
                width: 2000,
                borderRadius: 10,
                controller: _loginbtnController,
                color: Color(0xff00c1AA),
                onPressed: () {
                  Timer(Duration(seconds: 3), () {
                    _loginbtnController.success();
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: ProfileSetup(),
                      ),
                    );
                  });
                },
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            //? -- Forgot Password?
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: ForgotPassword(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xffC12720),
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            //? -- Dont have account? Sign Up
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xff5A5858),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: Register(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Color(0xff2F76EA),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
