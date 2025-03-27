import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:google_fonts/google_fonts.dart';

class AcceptInvite extends StatelessWidget {
  const AcceptInvite({super.key});

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

          //* -- back arrow
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
      ),

      body: Column(
        children: [
          //! -- Heading
          Container(
            alignment: Alignment.center,
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xff8C47FB)),
            child: Text(
              "See Received Invitations",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: Colors.white,
                fontSize: 15,
              ),
              textScaler: TextScaler.linear(1),
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

          //? -- Image
          SizedBox(height: 100),
          Container(
            height: 400,
            width: 400,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/empty.png",
              filterQuality: FilterQuality.high,
            ),
          ),

          //? -- Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //* -- Cyan
              Text(
                "Your received invitations are currently ",
                style: GoogleFonts.nunito(
                  color: Colors.cyan,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //* -- Purple
              Text(
                "Empty",
                style: GoogleFonts.nunito(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
