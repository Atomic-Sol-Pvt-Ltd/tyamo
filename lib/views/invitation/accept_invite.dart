import 'package:flutter/material.dart';
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
          leading: Icon(Icons.arrow_back, color: Colors.black),
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
