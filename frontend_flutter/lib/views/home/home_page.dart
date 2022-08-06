import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../events/events_page.dart';
import '../funds/funds_page.dart';
import '../news/news_page.dart';
import 'components/personalized_component.dart';

const imageName = "assets/images/backgroundImage.png";

const lists = [
  {"name": "Events", "iconData": Icons.event, "route": EventsScreen()},
  {"name": "News", "iconData": Icons.newspaper, "route": NewsScreen()},
  {
    "name": "Funds",
    "iconData": Icons.attach_money_rounded,
    "route": FundsScreen()
  }
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: size.width * 0.05),
              child: Stack(
                children: [
                  const Icon(Icons.notifications),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        centerTitle: true,
        title: const Text(
          "Frida",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 67, 108, 49)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Dashboard
                  //this components shows the recommendation for the user
                  //according to their skin condition

                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    child: SizedBox(
                      height: size.height * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome,",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            "DashBoard",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.04),
                    child: Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(imageName), fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white),
                      height: size.height * 0.3,
                      width: size.width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hi! Bishal Fatis.",
                            style: TextStyle(
                                fontSize: size.height * 0.035,
                                color: const Color.fromARGB(255, 67, 108, 49),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Today is Sunny Day",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                color: const Color.fromARGB(255, 67, 108, 49),
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.02),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.thermostat,
                                  color: Colors.deepOrange,
                                ),
                                Text(
                                  "25 °C, 180mm of hg",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 67, 108, 49),
                                      fontSize: size.height * 0.03,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //! Today Component
                  //! Personalized message
                  const PersonalizedComponent(),

                  /* 
                    events,
                    news,
                    funds component
                  */

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: lists.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> list = lists[index];

                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02),
                            child: Material(
                              borderRadius: BorderRadius.circular(12.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12.0),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EventsScreen()));
                                },
                                child: Ink(
                                  height: size.height * 0.15,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        list["iconData"],
                                        size: size.height * 0.05,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.06),
                                        child: Text(
                                          list["name"],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  color: const Color.fromARGB(
                                                      255, 67, 108, 49),
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: sideDrawer(context),
    );
  }
}

//!Drawer Page

Widget sideDrawer(context) {
  Size size = MediaQuery.of(context).size;
  return Drawer(
    backgroundColor: const Color.fromARGB(255, 67, 108, 49),
    child: Column(
      children: [
        Container(
          height: size.height * 0.2,
          width: size.width,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.air,
                  size: size.height * 0.04,
                  color: Colors.white,
                ),
                Text(
                  "Frida",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        drawerItem(size, context, Icons.home, "Home"),
        drawerItem(size, context, Icons.newspaper, "News"),
        drawerItem(size, context, Icons.event, "Events"),
        drawerItem(size, context, Icons.attach_money_rounded, "Fundraise"),
        drawerItem(size, context, Icons.flood, "Flood Near me"),
        drawerItem(size, context, Icons.landslide, "Landslide Near me"),
      ],
    ),
  );
}

Widget drawerItem(
    Size size, BuildContext context, IconData iconData, String text) {
  return Padding(
    padding: EdgeInsets.only(top: size.height * 0.03),
    child: InkWell(
      onTap: () {
        // Navigator.pop(context);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: ((context) => page)));
      },
      child: ListTile(
        leading: Icon(
          iconData,
          size: size.height * 0.04,
          color: Colors.white,
        ),
        title: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
              fontFamily: GoogleFonts.aBeeZee().fontFamily),
        ),
      ),
    ),
  );
}
