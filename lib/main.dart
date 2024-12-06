import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'screens/maps_screen.dart';
import 'screens/community_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/weather_icons_screen.dart'; // Add this import
import 'screens/weather_background_screen.dart'; // Add this import
import 'services/notification_service.dart';
import 'package:weather_api_app/services/theme_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize notification service
  NotificationService().initialize();

  runApp(const WeatherlyApp());
}

class WeatherlyApp extends StatelessWidget {
  const WeatherlyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeService(),
      child: Consumer<ThemeService>(
        builder: (context, themeService, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weatherly',
            theme: themeService.currentTheme,
            initialRoute: '/onboarding',
            routes: {
              '/onboarding': (context) => OnboardingScreen(),
              '/home': (context) => HomeScreen(),
              '/maps': (context) => MapsScreen(),
              '/community': (context) => CommunityScreen(),
              '/weatherIcons': (context) => WeatherIconsScreen(
                    weatherCondition: "Sunny", // Default weather condition
                  ), // Add weather icon screen
              '/weatherBackground': (context) => WeatherBackgroundScreen(
                    weatherCondition: "Rainy", // Default weather condition
                  ), // Add weather background screen
            },
          );
        },
      ),
    );
  }
}
