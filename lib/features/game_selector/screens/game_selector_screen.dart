import 'package:flutter/material.dart';
import 'package:geography_game/shared/services/widgets/primary_button.dart';
import 'package:geography_game/features/games/game1_screen.dart';

class GameSelectorScreen extends StatelessWidget {
  static const routeName = '/selector';

  const GameSelectorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Game'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PrimaryButton(
              label: 'Game1',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Game1Screen(),
                  ),
                );
              },
            ),
            PrimaryButton(
              label: 'Game2',
              onPressed: () {}, // no-op for now
            ),
            PrimaryButton(
              label: 'Game3',
              onPressed: () {},
            ),
            PrimaryButton(
              label: 'Game4',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}