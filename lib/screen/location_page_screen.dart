import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class LocationPageScreen extends StatefulWidget {
   LocationPageScreen({Key? key, this.myWeatherMap, this.myForecastMap}) : super(key: key);

  Map<String, dynamic>? myWeatherMap;
  Map<String, dynamic>? myForecastMap;

  @override
  State<LocationPageScreen> createState() => _LocationPageScreenState();
}

class _LocationPageScreenState extends State<LocationPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("images/w1.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index){
                        return Container(
                          height: 200,
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: 50,
                            left: 30,
                            right: 30,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [



                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${widget.myForecastMap!["list"][index]["main"]["temp"]}°",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),



                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("H: ${widget.myForecastMap!["list"][index]["main"]["temp_max"].toStringAsFixed(0)}°",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white70,
                                        ),
                                      ),

                                      SizedBox(width: 20,),

                                      Text("L: ${widget.myForecastMap!["list"][index]["main"]["temp_min"].toStringAsFixed(0)}°",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Text("W.speed: ${widget.myForecastMap!["list"][index]["wind"]["speed"]}km/h",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white70,
                                    ),
                                  ),

                                  Text("Visibility: ${widget.myForecastMap!["list"][index]["visibility"]}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white70,
                                    ),
                                  ),

                                ],
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${Jiffy.parse(widget.myForecastMap!["list"][index]["dt_txt"]).format(pattern: "h:mm a")}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  Text("${widget.myForecastMap!["list"][index]["weather"][0]["description"]}",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                  ),

                                  Text("Feels like: ${widget.myForecastMap!["list"][index]["main"]["feels_like"].toStringAsFixed(0)}°",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                  ),

                                  Text("Humilidity: ${widget.myForecastMap!["list"][index]["main"]["humidity"]}%",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                  ),

                                  Text("Pressure: ${widget.myForecastMap!["list"][index]["main"]["pressure"]}",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (_,index){
                        return SizedBox(height: 8,);
                      },
                      //itemCount: widget.myForecastMap!.length,
                      itemCount: 38,
                  )
              ),
            ],
          ),
        )
    );
  }
}
