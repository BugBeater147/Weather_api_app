import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String weatherData = "Fetching weather...";

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final apiKey = "your_openweather_api_key";
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=London&appid=$apiKey");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          weatherData = data['weather'][0]['description'];
        });
      } else {
        setState(() {
          weatherData = "Failed to fetch weather data.";
        });
      }
    } catch (e) {
      setState(() {
        weatherData = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weatherly"),
      ),
      body: Center(
        child: Text(weatherData, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
