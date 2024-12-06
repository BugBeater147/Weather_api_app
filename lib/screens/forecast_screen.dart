import 'package:flutter/material.dart';
import 'package:weather_api_app/services/weather_service.dart';

class ForecastScreen extends StatelessWidget {
  final String city = "London"; // Replace with user input or selected city

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$city: 7-Day Forecast'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: WeatherService().fetch7DayForecast(city),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final forecast = snapshot.data!;
            return ListView.builder(
              itemCount: forecast.length,
              itemBuilder: (context, index) {
                final day = forecast[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(day['date']),
                    subtitle: Text(day['description']),
                    trailing: Text('${day['temperature']}°C'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
