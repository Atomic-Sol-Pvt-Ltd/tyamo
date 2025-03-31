import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/views/widgets/homepage/drawer_list_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  //! -- make key to enable the bottom nev to change pages
  final GlobalKey<ScaffoldState> _homepageKey = GlobalKey();
  //! -- list of icons for bottom nav
  List<IconData> iconList = [
    FontAwesomeIcons.circleUser,
    FontAwesomeIcons.house,
    FontAwesomeIcons.bell,
  ];

  int page = 1;
  int pageView = 1;
  PageController pageController = PageController(initialPage: 1);

  Widget pageViewSection() {
    return PageView(
      controller: pageController,
      onPageChanged: (value) {
        setState(() {
          page = value;
        });
      },
      children: [
        //! -- currently these are the things we using as screens
        Container(color: Colors.amber),
        Container(color: Colors.green),
        Container(color: Colors.red),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homepageKey,
      backgroundColor: Colors.white,

      //! -- Appbar
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
        leading: GestureDetector(
          onTap: () {
            _homepageKey.currentState!.openDrawer();
          },
          child: Icon(Icons.menu, color: Colors.black),
        ),
        actions: [
          Container(
            width: 60,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Image.asset(
              "assets/dashboard/message.png",
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),


      //! -- Drawer
      drawer: GFDrawer(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Column(
                children: [
                  //! -- Drawer Header
                  Row(
                    children: [
                      //? -- For Profile Avatar
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 25,
                        ),
                        child: CircularProfileAvatar(
                          "",
                          backgroundColor: Colors.cyan,
                          borderWidth: 1,
                          borderColor: Colors.deepPurpleAccent,
                          elevation: 20,
                          radius: 40,
                          cacheImage: true,
                          errorWidget: (context, url, error) {
                            return Icon(Icons.face, size: 50);
                          },
                          onTap: () {
                            pageController.animateToPage(
                              0,
                              duration: Duration(microseconds: 300),
                              curve: Curves.linear,
                            );
                            Navigator.of(context).pop();
                          },
                          animateFromOldImageOnUrlChange: true,
                          placeHolder: (context, url) {
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),

                      //? -- For Name & e-mail
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jayen Blake",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              "JB.1@tyamo.com",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                color: Colors.cyan,
                                fontSize: 13,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //? -- For Button (Premium)
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Text(
                        "Premium",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),


            //! -- Divider
            Expanded(flex: 0, child: Divider()),

            //! -- Drawer Body
            SizedBox(height: 20,),
            Column(
              children: [
                DrawerListTile(iconName: FontAwesomeIcons.solidCreditCard, tileTitle: "Subscription"),
                DrawerListTile(iconName: Icons.settings,                   tileTitle: "Settings"),
                DrawerListTile(iconName: FontAwesomeIcons.circleQuestion,  tileTitle: "Help"),
                DrawerListTile(iconName: FontAwesomeIcons.message,         tileTitle: "Feedback"),
                DrawerListTile(iconName: FontAwesomeIcons.share,           tileTitle: "Tell others"),
                DrawerListTile(iconName: FontAwesomeIcons.starHalfStroke,  tileTitle: "Rate the app"),
              ],
            ),

            //! -- Drawer Bottom
            Expanded(child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(),
                  DrawerListTile(iconName: FontAwesomeIcons.rightFromBracket, tileTitle: "Sign Out")
                ],
              ),
            ))
          ],
        ),
      ),

      //! -- Bottom navigation
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: page,
        activeColor: Colors.purple,
        inactiveColor: Colors.black,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.none,
        onTap: (p0) {
          setState(() {
            pageView = p0;
            pageController.animateToPage(
              p0,
              duration: Duration(milliseconds: 200),
              curve: Curves.linear,
            );
          });
        },
      ),
      body: pageViewSection(),
    );
  }
}
