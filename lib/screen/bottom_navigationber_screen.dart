import 'package:flutter/material.dart';
import 'package:weatherapp/screen/homepage_screen.dart';
import 'package:weatherapp/screen/location_page_screen.dart';
import 'package:weatherapp/screen/more_page_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {

  //Bottom navigation bar
  List<Widget> pages = [
    LocationPageScreen(),
    HomePageScreen(),
    MorePageScreen()
  ];
  int currentIndex = 0;

  //Api Calling



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: BottomNavigationBar(
            onTap: (value){
              setState(() {
                currentIndex = value;
              });
            },

          selectedLabelStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20
          ),
          selectedItemColor: Colors.black,

          unselectedFontSize: 10,
          currentIndex: currentIndex,
          showUnselectedLabels: false,

            items: [

              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                  backgroundColor: Color(0xff528265)
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on),
                  label: "Location",
                  backgroundColor: Color(0xff528265)
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  label: "More",
                  backgroundColor: Color(0xff528265)
              ),
            ],

        )

    );
  }
}
