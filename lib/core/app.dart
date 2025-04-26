import 'package:flutter/material.dart';
import '../features/welcome/screens/welcome_screen.dart';
import '../features/game_selector/screens/game_selector_screen.dart';  // <-- import

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country Painter',
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
        GameSelectorScreen.routeName: (ctx) => const GameSelectorScreen(), // <-- register
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}