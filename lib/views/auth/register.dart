import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import '../widgets/auth/auth_heading.dart';
import '../widgets/auth/auth_text_field.dart';

class Register extends StatelessWidget {
   Register({super.key});
    final RoundedLoadingButtonController _registerbtnController =
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
              mainText: "Sign up to Tyamo",
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

            //? -- Confirm Password TextField
            SizedBox(height: 20),
            AuthTextField(
              keyboardType: TextInputType.text,
              lableText: "Confirm Password",
              obscureText: true,
              icon: Icons.lock_reset,
              size: 15,
            ),

            //? -- register Button
            SizedBox(height: 30),
            RoundedLoadingButton(
              width: 2000,
              borderRadius: 10,
              controller: _registerbtnController,
              color: Color(0xff00c1AA),
              onPressed: () {},
              child: Text(
                "Register",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ),

            //? -- Forgot Password?
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "By registering, you agree to our terms and conditions",
                style: GoogleFonts.poppins(
                  fontSize: 8,
                  color: Color(0xff808080),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),

            //? -- Dont have account? Sign Up
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already register? ",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xff5A5858),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Sign In",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color(0xff2F76EA),
                    fontWeight: FontWeight.w700,
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