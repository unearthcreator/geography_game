import 'package:flutter/material.dart';
import 'package:geography_game/shared/services/widgets/primary_button.dart';
import 'package:geography_game/features/games/game1_screen.dart';

class GameSelectorScreen extends StatefulWidget {
  static const routeName = '/selector';

  const GameSelectorScreen({Key? key}) : super(key: key);

  @override
  State<GameSelectorScreen> createState() => _GameSelectorScreenState();
}

class _GameSelectorScreenState extends State<GameSelectorScreen> {
  List<bool> _isSelected = [true, false];

  void _onTogglePressed(int index) {
    setState(() {
      for (int i = 0; i < _isSelected.length; i++) {
        _isSelected[i] = (i == index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: ToggleButtons(
            isSelected: _isSelected,
            onPressed: _onTogglePressed,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Flat'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Globe'),
              ),
            ],
            borderRadius: BorderRadius.circular(8.0),
            constraints: const BoxConstraints(
              minHeight: 36.0,
            ),
            selectedColor: Colors.white,
            fillColor: Theme.of(context).colorScheme.primary,
            color: Theme.of(context).colorScheme.primary,
            selectedBorderColor: Theme.of(context).colorScheme.primary,
            borderColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      // --- MODIFICATION START ---
      body: Column( // Use Column instead of Center
        children: <Widget>[
          const Spacer(), // Takes up all available space above the Row
          Row(
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
          // Add some padding at the bottom so buttons aren't stuck to the edge
          const SizedBox(height: 40), // Adjust height for desired spacing
          // Alternatively, you could use another Spacer() here if you
          // want the buttons centered in the *lower half* of the screen.
          // const Spacer(),
        ],
      ),
      // --- MODIFICATION END ---
    );
  }
}