import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:tyamo/views/widgets/auth/auth_heading.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final RoundedLoadingButtonController _btnController =
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
            TextField(
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.none,
              obscureText: false,
              autofocus: false,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                fillColor: Color(0xffE7E7F2),
                filled: true,
                prefixIcon: Icon(Icons.alternate_email, size: 15),
                prefixIconColor: Color(0xff00205C),
                label: Text("Email"),
                labelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            //? -- Password TextField
            SizedBox(height: 20),
            TextField(
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.none,
              obscureText: true,
              autofocus: false,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
              keyboardType: TextInputType.text,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                fillColor: Color(0xffE7E7F2),
                filled: true,
                prefixIcon: Icon(Icons.password, size: 15),
                prefixIconColor: Color(0xff00205C),
                label: Text("Password"),
                labelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            //? -- Login Button
            SizedBox(height: 30),
            RoundedLoadingButton(
              width: 2000,
              borderRadius: 10,
              controller: _btnController,
              color: Color(0xff00c1AA),
              onPressed: () {},
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

            //? -- Forgot Password?
            SizedBox(height: 20),
            Container(
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
                Text(
                  "Sign Up",
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
