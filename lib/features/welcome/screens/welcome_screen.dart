import 'package:flutter/material.dart';
import '../../game_selector/screens/game_selector_screen.dart';  // <-- import
import 'package:geography_game/shared/services/widgets/primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unearth'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // "Go to Games" button
            PrimaryButton(
              label: 'Go to Games',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  GameSelectorScreen.routeName,
                );
              },
            ),

            const SizedBox(height: 16),

            // "Exit" button
            PrimaryButton(
              label: 'Exit',
              onPressed: () {
                // TODO: call SystemNavigator.pop() or similar
              },
            ),
          ],
        ),
      ),
    );
  }
}