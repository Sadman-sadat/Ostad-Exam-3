import 'dart:convert';

import 'package:exam/weather.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String jsonString = '''
    [
      {"city": "New York", "temperature": 20, "condition": "Clear", "humidity": 60, "windSpeed": 5.5 },
      {"city": "Los Angeles", "temperature": 25, "condition": "Sunny", "humidity": 50, "windSpeed": 6.8 },
      {"city": "London", "temperature": 15, "condition": "Partly Cloudy", "humidity": 70, "windSpeed": 4.2 },
      {"city": "Tokyo", "temperature": 28, "condition": "Rainy", "humidity": 75, "windSpeed": 8.0 },
      {"city": "Sydney", "temperature": 22, "condition": "Cloudy", "humidity": 55, "windSpeed": 7.3 }
    ]
  ''';

  List<Weather> parseJson(String jsonStr) {
    final List<dynamic> data = json.decode(jsonStr);
    return data.map((item) => Weather.fromJson(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Weather> weatherList = parseJson(jsonString);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Info App'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: weatherList.length,
          itemBuilder: (context, index) {
            Weather weather = weatherList[index];
            return ListTile(
              title: Text('City: ${weather.city}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Temperature: ${weather.temperature}°C'),
                  Text('Condition: ${weather.condition}'),
                  Text('Humidity: ${weather.humidity}%'),
                  Text('Wind Speed: ${weather.windSpeed} m/s'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
