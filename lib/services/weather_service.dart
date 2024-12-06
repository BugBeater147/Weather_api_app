import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  // Replace this with your actual API key
  final String _apiKey = "1d356a9aca76e802e12839db3e08faba";

  // Fetch current weather
  Future<Map<String, dynamic>> fetchCurrentWeather(String city) async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return {
        'description': data['weather'][0]['description'],
        'temperature': data['main']['temp'],
        'humidity': data['main']['humidity'],
        'wind_speed': data['wind']['speed'],
      };
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  // Fetch 7-day forecast
  Future<List<Map<String, dynamic>>> fetch7DayForecast(String city) async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$_apiKey&units=metric");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(
        data['list'].map((item) => {
              'date': item['dt_txt'],
              'description': item['weather'][0]['description'],
              'temperature': item['main']['temp'],
            }),
      ).take(7).toList(); // Take the first 7 forecast entries
    } else {
      throw Exception('Failed to fetch forecast');
    }
  }
}
