// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // ← for SystemChrome
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart'; // <-- Importera Mapbox
import 'core/app.dart';
import 'shared/services/logger.dart';
import 'shared/services/error_handler.dart';

// Försök läsa testvariabeln från --dart-define
// Om TEST_VAR inte skickas med blir värdet 'TEST_VAR NOT FOUND'
const String testVar = String.fromEnvironment('TEST_VAR', defaultValue: 'TEST_VAR NOT FOUND');

// Hämta Mapbox-token från --dart-define.
// Returnerar en tom sträng om ACCESS_TOKEN inte är definierad.
const String mapboxAccessToken = String.fromEnvironment('ACCESS_TOKEN');


Future<void> main() async {
  // Ensure binding is initialized before any platform calls
  WidgetsFlutterBinding.ensureInitialized();

  // ---- FELSÖKNING ----
  // Skriv ut värdet av testvariabeln FÖRST för att se om --dart-define fungerar alls via launch.json
  print('>>>>>> DEBUG: TEST_VAR value from environment: $testVar');
  // --------------------

  // Validera att Mapbox-token faktiskt finns (inte är en tom sträng)
  if (mapboxAccessToken.isEmpty) {
    // Skriv ut ett tydligt felmeddelande om token saknas
    print(
        'FATAL ERROR: Mapbox Access Token (ACCESS_TOKEN) was empty or not provided via --dart-define.');
    // Kasta ett undantag för att stoppa appen, eftersom kartan inte kan fungera utan token.
    throw Exception('Mapbox Access Token not found. Ensure it is passed via --dart-define.');
  } else {
      // ---- FELSÖKNING ----
      // Skriv ut den hittade token om den inte är tom (ta bort detta i produktion)
      print('>>>>>> DEBUG: Mapbox Access Token found: $mapboxAccessToken');
      // --------------------
  }


  // Ställ in Mapbox Access Token globalt *innan* runApp och innan någon MapWidget används
  MapboxOptions.setAccessToken(mapboxAccessToken);

  // Lås appen till landskapsläge
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // Initialisera andra tjänster
  Logger.init();
  ErrorHandler.init();

  // Starta appen
  runApp(const MyApp());
}

/// Tunn wrapper så att tester som refererar till MyApp fungerar.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // App() är din huvudsakliga MaterialApp med routes, tema, etc.
    return const App();
  }
}