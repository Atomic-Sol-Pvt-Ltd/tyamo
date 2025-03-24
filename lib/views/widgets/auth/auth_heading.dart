import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeading extends StatelessWidget {
  const AuthHeading({
    super.key,
    required this.mainText,
    required this.subText,
    required this.logo,
    required this.fontSize,
    required this.logoSize,
  });
  final String mainText;
  final String subText;
  final String logo;
  final double fontSize;
  final double logoSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),

        //! -- Heading with Symbol
        Row(
          children: [
            Text(
              mainText,
              style: GoogleFonts.poppins(
                fontSize: fontSize,
                color: Color(0xff00205C),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: logoSize,
              height: logoSize,
              child: Image.asset(
                logo,
                filterQuality: FilterQuality.high,
              ),
            ),
          ],
        ),
        Text(
          subText,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            color: Color(0xff00205C),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
