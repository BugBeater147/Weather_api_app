import 'package:flutter/material.dart';

class WeatherIconsScreen extends StatelessWidget {
  final String weatherCondition;

  WeatherIconsScreen(
      {required this.weatherCondition}); // Pass the weather condition dynamically

  @override
  Widget build(BuildContext context) {
    String imagePath = "";

    // Map weather conditions to images
    switch (weatherCondition) {
      case "Sunny":
        imagePath = "assets/Sunny.png";
        break;
      case "Cloudy":
        imagePath = "assets/Cloudy.png";
        break;
      case "Rainy":
        imagePath = "assets/Rainy.png";
        break;
      case "Snowy":
        imagePath = "assets/Snowy.png";
        break;
      case "Lightning":
        imagePath = "assets/Lightning.png";
        break;
      default:
        imagePath = "assets/Sunny.png"; // Default fallback
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Icon: $weatherCondition'),
      ),
      body: Center(
        child: Image.asset(
          imagePath,
          width: 150,
          height: 150,
        ), // Display the weather icon
      ),
    );
  }
}
