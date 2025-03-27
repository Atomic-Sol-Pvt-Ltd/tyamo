import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:tyamo/views/widgets/auth/auth_heading.dart';
import 'package:tyamo/views/widgets/auth/auth_text_field.dart';

class ForgotPassword extends StatelessWidget {
   ForgotPassword({super.key});
      final RoundedLoadingButtonController _forgotpasswordbtnController =
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
        
              //? -- Heading
              SizedBox(height: 60),
              AuthHeading(
                fontSize: 16.sp,
                logo: "assets/images/symbol.png",
                logoSize: 20.sp,
                mainText: "Forgot Your Password ? ",
                subText: "",
              ),
        
              //? -- icon
              SizedBox(
                height: 20.h,
                width: 40.w,
                child: Image.asset(
                  "assets/images/forgotpassword.png",
                  filterQuality: FilterQuality.high,
                ),
              ),
        
              //? -- Description
               SizedBox(height: 40),
               Text(
                "To request for a new one, type your email address below. A link to reset the password will be sent to that email",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp
                ),
               ),
        
               //? -- Email TextField
               SizedBox(height: 40),
              AuthTextField(
                keyboardType: TextInputType.emailAddress,
                lableText: "Email",
                obscureText: false,
                icon: Icons.alternate_email,
                size: 14.sp,
              ),
        
              //? -- Login Button
              SizedBox(height: 30),
              Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                  width: 2000,
                  borderRadius: 10,
                  controller: _forgotpasswordbtnController,
                  color: Color(0xff00c1AA),
                  onPressed: () {},
                  child: Text(
                    "Send",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}