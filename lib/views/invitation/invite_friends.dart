import 'dart:async';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tyamo/views/invitation/accept_invite.dart';

class InviteFriends extends StatelessWidget {
  const InviteFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //? -- AppBar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,

          //* -- image
          title: SizedBox(
            height: 40,
            child: Image.asset(
              "assets/images/logo.png",
              filterQuality: FilterQuality.high,
            ),
          ),
          leading: null,

          //* -- icon
          actions: [
            GestureDetector(
              onTap: () {
                Timer(Duration(seconds: 0), () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: AcceptInvite(),
                    ),
                  );
                },
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.person_outline, color: Colors.purple, size: 35),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          //! -- Heading
          Container(
            alignment: Alignment.center,
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xff00D7CC)),
            child: Text(
              "Find your friend",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: Colors.white,
                fontSize: 15,
              ),
              textScaler: TextScaler.linear(1),
            ),
          ),

          //? -- Search Field & Button
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                //* -- Search TextField
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.3),
                          spreadRadius: 3,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 20,
                        ),
                        hintText: "Hi Hamza, Type an exact username..",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                //* -- Search Button
                SizedBox(width: 15),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.3),
                        spreadRadius: 3,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
          ),

          //? -- Accept & Decline Request Card
          SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              //* -- Card
              child: Card(
                color: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          //* -- Circular avatar
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 5, 15),
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: CircularProfileAvatar(
                                "",
                                backgroundColor: Colors.blue,
                                radius: 35,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //* -- Text @username
                              Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  "@hamzeedv",
                                  style: GoogleFonts.poppins(fontSize: 17),
                                ),
                              ),
                              //* -- Text name
                              Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: Text(
                                  "Hamza",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Spacer(),

                          //* Row for Buttons
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                GFButton(
                                  color: Color(0xff00D7CC),
                                  shape: GFButtonShape.pills,
                                  child: Text("Accept"),
                                  onPressed: () {},
                                ),
                                SizedBox(width: 4),
                                GFButton(
                                  color: Color.fromARGB(255, 215, 0, 18),
                                  shape: GFButtonShape.pills,
                                  child: Text("Decline"),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //? -- image
          SizedBox(height: 40),
          SizedBox(
            height: 300,
            width: 300,
            child: Image.asset(
              "assets/images/invite.png",
              filterQuality: FilterQuality.high,
            ),
          ),

          //? -- Text
          Text(
            "Search for your friends on Tyamo or \ninvite your friend to Tyamo",
            style: GoogleFonts.nunito(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          //? -- Button
          SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.purple),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Invite a friend",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
