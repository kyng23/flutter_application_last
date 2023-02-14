import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_last/city.dart';

import 'package:flutter_application_last/search.dart';

import 'package:flutter_application_last/weather_forecast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  _MyHomePageState stateClass = _MyHomePageState();

  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String apiKey = "XlukLS7rAatrfSQcFty3Ow==PMzAAYiGLEDMbQN5";

  String result =
      "Lat ve Lon u buraya yazdırmak istiyorum ama Set state çalışmıyor";

  /* Future<WeatherForecast> forecastApiCall() async {
    var response =
        await http.get(Uri.http('www.7timer.info', '/bin/astro.php', {
      'lon': ,
      'lat': latTEC.text,
      'ac': '0',
      'unit': 'metric',
      'output': 'json',
      'tzshift': '0'
    }));

    Map<String, dynamic> json = jsonDecode(response.body);
    var data = WeatherForecast.fromJson(json);
    setState(() {
      result = data.product.toString();
    });

    return data;
  }*/

  Future<City> cityApi(String cityName) async {
    var uri = Uri.https("api.api-ninjas.com", "/v1/city", {
      "name": cityName,
    });

    var response = await http.get(uri, headers: {'X-Api-Key': apiKey});

    final jsonCity = jsonDecode(response.body);
    var dataCity = City.fromJson(jsonCity[0]);
    setState(() {
      result = "Lat: ${dataCity.lat}Lon: ${dataCity.lon}";
      //Buradaki set State çalışmıyor 
    });

    return dataCity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Forecast"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: Column(children: [
          Container(
            color: Colors.amber,
            width: 365.0,
            height: 55.0,
            child: Text(result),
          )
        ]),
      ),
    );
  }
}
