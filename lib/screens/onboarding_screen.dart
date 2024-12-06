import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnboardingScreen extends StatelessWidget {
  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome to Weatherly',
      'description': 'Your personalized weather sidekick.',
      'image': 'assets/images/sunny.png',
    },
    {
      'title': 'Interactive Maps',
      'description': 'Track storms and explore global weather phenomena.',
      'image': 'assets/images/map.png',
    },
    {
      'title': 'Community Insights',
      'description': 'Share and view weather reports with others.',
      'image': 'assets/images/community.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: onboardingData.map((data) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(data['image']!, height: 200),
              SizedBox(height: 20),
              Text(
                data['title']!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                data['description']!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
