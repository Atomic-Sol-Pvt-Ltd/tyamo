import 'dart:async';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:tyamo/views/invitation/invite_friends.dart';
import 'package:tyamo/views/widgets/auth/auth_text_field.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final RoundedLoadingButtonController _profileSetupBtnController =
      RoundedLoadingButtonController();

  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            "assets/images/logo.png",
            filterQuality: FilterQuality.high,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/profile_setup_bg.jpg"),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover
          ), 
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 25.sp,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xff000221)),
              child: Text(
                "Profile Setup",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 16.sp,
                  letterSpacing: 2,
                ),
              ),
            ),
      
            //? -- Circular add profile
            SizedBox(height: 60),
            CircularProfileAvatar(
              "",
              backgroundColor: Colors.cyan,
              initialsText: Text(
                "+",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
            ),
      
            //? --  Your name TextField
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AuthTextField(
                lableText: "Your Name",
                icon: Icons.face,
                size: 16.sp,
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
            ),
      
            //? -- Your username TextField
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AuthTextField(
                lableText: "Your username",
                icon: Icons.alternate_email,
                size: 16.sp,
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
            ),
      
            //? -- Gender Buttons
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //* -- Male
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Container(
                    height: 28.sp,
                    width: 28.sp,
                    decoration: BoxDecoration(
                      color: isMale ? Colors.cyan : Colors.grey,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1.0, 9.0),
                          blurRadius: 30,
                        ),
                      ],
                    ),
                    child: Icon(Icons.male, color: Colors.white, size: 18.sp,),
                  ),
                ),
                //* -- Female
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Container(
                    height: 28.sp,
                    width: 28.sp,
                    decoration: BoxDecoration(
                      color: !isMale ? Colors.purple : Colors.grey,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1.0, 9.0),
                          blurRadius: 30,
                        ),
                      ],
                    ),
                    child: Icon(Icons.female, color: Colors.white, size: 18.sp,),
                  ),
                ),
              ],
            ),
      
            //? -- Next Button
            SizedBox(height: 40),
            SizedBox(
              width: 250,
              child: Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                  width: 2000,
                  borderRadius: 10,
                  controller: _profileSetupBtnController,
                  color: Color(0xff00c1AA),
                  onPressed: () {
                    Timer(Duration(seconds: 3), () {
                    _profileSetupBtnController.success();
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: InviteFriends(),
                      ),
                    );
                  },
                  );
                  },
                  child: Text(
                    "Next",
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
