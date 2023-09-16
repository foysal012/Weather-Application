import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:jiffy/jiffy.dart';
import 'package:weatherapp/screen/location_page_screen.dart';
import 'package:weatherapp/screen/more_page_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {


  determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    position =  await Geolocator.getCurrentPosition();

    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });

    fetchData();


  }

  Map<String, dynamic>? weatherMap;
  Map<String, dynamic>? forecastMap;
  late Position position;
  var latitude;
  var longitude;

  fetchData() async{

    String weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=37.4219983&lon=-122.084&units=metric&appid=f92bf340ade13c087f6334ed434f9761";
    String forecastUrl = "https://api.openweathermap.org/data/2.5/forecast?lat=37.4219983&lon=-122.084&units=metric&appid=f92bf340ade13c087f6334ed434f9761";

    var weatherResponse = await http.get(Uri.parse(weatherUrl));
    var forecastResponse = await http.get(Uri.parse(forecastUrl));

    weatherMap = Map<String, dynamic>.from(jsonDecode(weatherResponse.body));

    forecastMap = Map<String, dynamic>.from(jsonDecode(forecastResponse.body));

    setState(() {

    });

    print("Our weather response satstus code is: ${weatherResponse.statusCode}");
    print("Our forecast response satstus code is: ${forecastResponse.statusCode}");
  }

  @override
  void initState() {
    // TODO: implement initState
    determinePosition();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          //color: Colors.red,
          image: DecorationImage(image: AssetImage("images/w1.jpeg"),
          fit: BoxFit.cover,
          ),
        ),

        child: Column(
          children: [

            Container(
              padding: EdgeInsets.only(
                top: 50,
                left: 40,
                right: 40,
              ),
              child: Column(
                children: [

                  Text("${weatherMap!["name"]}",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),
                  ),
                  Text("${weatherMap!["main"]["temp"]}°",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  Text("${weatherMap!["weather"][0]["description"]}",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("H: ${weatherMap!["main"]["temp_max"].toStringAsFixed(0)}°",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(width: 20,),

                      Text("L: ${weatherMap!["main"]["temp_min"].toStringAsFixed(0)}°",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),

            SizedBox(height: 230,),

            Expanded(
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                  color: Colors.lightBlue.withOpacity(0.5),
                ),

                child: Column(
                  children: [

                    Container(
                      margin: EdgeInsets.only(
                        top: 7
                      ),
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Hourly Forecast",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        ),

                        SizedBox(width: 10,),

                        Text("Weekly Forecast",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                      ]
                    ),

                    SizedBox(height: 10,),

                    Divider(
                      height: 5,
                      thickness: 2,
                      color: Colors.white38,
                      indent: 5,
                      endIndent: 5,
                    ),

                    SizedBox(height: 10,),

                    Container(
                      margin: EdgeInsets.only(
                        left: 20
                      ),
                      height: 180,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                          itemBuilder: (contex, index){
                            return Container(
                              height: 150,
                              width: 115,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${Jiffy.parse(forecastMap!["list"][index]["dt_txt"]).format(pattern: "MMM do yy, h:mm a")}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  ),

                                  SizedBox(height: 3,),

                                  Text("${forecastMap!["list"][index]["weather"][0]["description"]}",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                  ),

                                  SizedBox(height: 3,),
                                  
                                  Text("${forecastMap!["list"][index]["main"]["temp"]}°",

                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                ],
                              ),
                            );
                          },
                          separatorBuilder: (_, index){
                            return SizedBox(
                              width: 10,
                            );
                          },
                          itemCount: 38,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(
                          left: 20,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         InkWell(
                             onTap: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LocationPageScreen(
                                 myForecastMap: forecastMap,
                                 myWeatherMap: weatherMap,
                               )));

                             },
                             child: Icon(Icons.location_on, color: Colors.white,),
                         ),

                          InkWell(
                            onTap: (){

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MorePageScreen(
                                myForecastMap: forecastMap,
                                myWeatherMap: weatherMap,
                              )));
                            },
                            child: Icon(Icons.more_horiz, color: Colors.white,size: 40,),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            )


          ],
        ),
      ),

    );
  }
}
