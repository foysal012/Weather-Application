import 'package:flutter/material.dart';

class CityDetails{

  String? city;
  String? lat;
  String? long;

  CityDetails({this.city, this.lat, this.long});

  // static List<CityDetails>  cityListData = [
  //
  // ];

static List<CityDetails> cityListData(){
  return [
    CityDetails(
      city: "Dhaka",
      lat: "23.7639",
      long: "90.3889",
    ),
    CityDetails(
      city: "New Delhi",
      lat: "28.6139",
      long: "77.209",
    ),
    CityDetails(
      city: "London Colney",
      lat: "51.726",
      long: "-0.3",
    ),
    CityDetails(
      city: "Ankara",
      lat: "39.9334",
      long: "32.8597",
    ),
    CityDetails(
      city: "Munich",
      lat: "48.1351",
      long: "11.5820",
    ),
    CityDetails(
      city: "Rome",
      lat: "41.9028",
      long: "12.4964",
    ),
    CityDetails(
      city: "Riyadh",
      lat: "24.7136",
      long: "46.6753",
    ),
  ];
}
}