
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class MorePageScreen extends StatefulWidget {
   MorePageScreen({Key? key, this.myWeatherMap, this.myForecastMap}) : super(key: key);

  Map<String, dynamic>? myWeatherMap;
  Map<String, dynamic>? myForecastMap;

  @override
  State<MorePageScreen> createState() => _MorePageScreenState();
}

class _MorePageScreenState extends State<MorePageScreen> {

  final df = new DateFormat('hh:mm a');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
      padding: EdgeInsets.only(
        top: 50,
      ),
      height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/w1.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [

            Container(
              child: Column(
                children: [
                  Text("${widget.myWeatherMap!["name"]}",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${widget.myWeatherMap!["main"]["temp"].toStringAsFixed(0)}°",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),

                      SizedBox(width: 10,),

                      Container(
                        height: 20,
                        width: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(width: 10,),

                      Text("${widget.myWeatherMap!["weather"][0]["description"]}",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),


                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 50,),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                color: Colors.lightBlue.withOpacity(0.5),),
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

                    SizedBox(height: 8,),

                    Container(
                      padding: EdgeInsets.only(
                        top: 4,
                        left: 8,
                        right: 8,
                      ),
                      height: 130,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Air Quality",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.6),
                          ),
                          ),

                          SizedBox(height: 10,),

                          Text("3-Low Health Risk",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(height: 5,),

                          Stack(
                            children:[
                              Container(
                                height: 2,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.deepPurple,
                                          Colors.deepPurpleAccent,
                                          Colors.purple,
                                          Colors.purpleAccent,
                                          Colors.pink
                                        ]
                                    )
                                ),
                              ),
                              Positioned(
                                  left: 40,
                                  bottom: 0,
                                  child: Container(
                                height: 2,
                                width: 2,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ))
                            ]
                          ),

                          SizedBox(height: 15,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("See more",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),

                              Icon(Icons.arrow_forward_ios,color: Colors.white38,)
                            ],
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 5,),

                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 130,
                              width: 160,
                              padding: EdgeInsets.only(
                                top: 4,
                                right: 8,
                                left: 8,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.sunny,color: Colors.white.withOpacity(0.6),),
                                      SizedBox(width: 2,),
                                      Text("UV INDEX",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 5,
                                  ),

                                  Text("4",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text("Moderate",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 5,
                                  ),
                                  
                                  Stack(
                                      children:[
                                        Container(
                                          height: 2,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Colors.deepPurple,
                                                    Colors.deepPurpleAccent,
                                                    Colors.purple,
                                                    Colors.purpleAccent,
                                                    Colors.pink
                                                  ]
                                              )
                                          ),
                                        ),
                                        Positioned(
                                            left: 0,
                                            bottom: 0,
                                            child: Container(
                                              height: 2,
                                              width: 2,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ]
                                  ),


                                ],
                              ),
                            ),

                            SizedBox(width: 8,),

                            Container(
                              height: 130,
                              width: 160,
                              padding: EdgeInsets.only(
                                top: 4,
                                right: 8,
                                left: 8,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.sunny,color: Colors.white.withOpacity(0.6),),
                                     SizedBox(width: 2,),
                                      Text("SUNRISE",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 2,),

                                  //Text("${jsify(widget.myWeatherMap!["sys"]["sunrise"]*1000).}"),
                                  Text("${df.format(DateTime.fromMicrosecondsSinceEpoch(widget.myWeatherMap!["sys"]["sunrise"]*1000))}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                  ),

                                  SizedBox(height: 10,),

                                  Stack(
                                      children:[
                                        Container(
                                          height: 2,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Colors.deepPurple,
                                                    Colors.deepPurpleAccent,
                                                    Colors.purple,
                                                    Colors.purpleAccent,
                                                    Colors.pink
                                                  ]
                                              )
                                          ),
                                        ),
                                        Positioned(
                                            left: 0,
                                            bottom: 0,
                                            child: Container(
                                              height: 2,
                                              width: 2,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ]
                                  ),

                                  SizedBox(height: 10,),

                                  Text("Sunset:${df.format(DateTime.fromMicrosecondsSinceEpoch(widget.myWeatherMap!["sys"]["sunset"]*1000))}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 130,
                              width: 160,
                              padding: EdgeInsets.only(
                                top: 4,
                                left: 8,
                                right: 8
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(15)
                              ),

                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.wind_power,color: Colors.white.withOpacity(0.6),),
                                      SizedBox(width: 2,),
                                      Text("WIND",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10,),

                                  Text("${widget.myWeatherMap!["wind"]["speed"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            SizedBox(width: 8,),

                            Container(
                              height: 130,
                              width: 160,
                              padding: EdgeInsets.only(
                                top: 4,
                                left: 8,
                                right: 8,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(15)
                              ),


                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.water_drop_outlined,color: Colors.white.withOpacity(0.6),),
                                      SizedBox(width: 2,),
                                      Text("RAINFALL",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 1,),

                                  Text("1.8 mm\nin last hour",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),

                                  SizedBox(height: 1,),

                                  Text("1.2 mm expected in\nnext 24h.",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(0.6),
                                    ),
                                  ),

                                ],
                              ),

                            ),
                          ],
                        ),

                        SizedBox(height: 5,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 130,
                              width: 160,
                              padding: EdgeInsets.only(
                                top: 4,
                                left: 8,
                                right: 8,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(15)
                              ),

                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.edit_attributes,color: Colors.white.withOpacity(0.6),),
                                      SizedBox(width: 2,),
                                      Text("FEELS LIKE",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10,),

                                  Text("${widget.myWeatherMap!["main"]["feels_like"].toStringAsFixed(0)}°",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            SizedBox(width: 8,),

                            Container(
                              height: 130,
                              width: 160,
                              padding: EdgeInsets.only(
                                top: 4,
                                left: 8,
                                right: 8,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(15)
                              ),

                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.hub,color: Colors.white.withOpacity(0.6),),
                                      SizedBox(width: 2,),
                                      Text("HUMIDITY",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10,),

                                  Text("${widget.myWeatherMap!["main"]["humidity"]}%",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),


                      ],
                    )

                  ],
                ),
              ),
            )
          ],
        ),
    )
    );
  }
}
