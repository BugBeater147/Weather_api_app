import 'package:flutter/material.dart';

class WeatherBackgroundScreen extends StatelessWidget {
  final String weatherCondition;

  WeatherBackgroundScreen({required this.weatherCondition}); // Pass the weather condition dynamically

  @override
  Widget build(BuildContext context) {
    String backgroundImage = "";

    // Map weather conditions to background images
    switch (weatherCondition) {
      case "Sunny":
        backgroundImage = "assets/Sunny.png";
        break;
      case "Cloudy":
        backgroundImage = "assets/Cloudy.png";
        break;
      case "Rainy":
        backgroundImage = "assets/Rainy.png";
        break;
      case "Snowy":
        backgroundImage = "assets/Snowy.png";
        break;
      case "Lightning":
        backgroundImage = "assets/Lightning.png";
        break;
      default:
        backgroundImage = "assets/Sunny.png"; // Default fallback
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Today’s Weather: $weatherCondition',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              backgroundColor: Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}
