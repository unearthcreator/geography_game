import 'package:flutter/material.dart';
// Assuming these imports point to your actual files
import 'package:geography_game/shared/services/widgets/primary_button.dart';
import 'package:geography_game/features/games/game1_screen.dart';

// Convert to StatefulWidget
class GameSelectorScreen extends StatefulWidget {
  static const routeName = '/selector';

  const GameSelectorScreen({Key? key}) : super(key: key);

  @override
  State<GameSelectorScreen> createState() => _GameSelectorScreenState();
}

class _GameSelectorScreenState extends State<GameSelectorScreen> {
  // State variable to track which toggle button is selected.
  // Initialize with the first button selected (index 0).
  // Example: Two modes, Mode A and Mode B.
  List<bool> _isSelected = [true, false];

  // Function called when a toggle button is pressed.
  void _onTogglePressed(int index) {
    // Use setState to update the state and trigger a UI rebuild.
    setState(() {
      // Logic to ensure only one button is selected at a time.
      for (int i = 0; i < _isSelected.length; i++) {
        _isSelected[i] = (i == index);
      }
      // Currently, the toggle doesn't need to trigger further actions,
      // but you could add logic here later based on the selected index.
      // print('Selected toggle index: $index'); // Optional: for debugging
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Remove the default title text.
        // Use the title property to hold the ToggleButtons, wrapped in Center.
        title: Center(
          child: ToggleButtons(
            isSelected: _isSelected, // Bind to the state variable
            onPressed: _onTogglePressed, // Call the handler on press
            // Define the appearance of the buttons
            children: const <Widget>[
              // Simple text buttons with padding
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Mode A'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Mode B'),
              ),
              // Add more children here for more toggle options
            ],
            // Basic styling (optional, adjust as needed)
            borderRadius: BorderRadius.circular(8.0),
            constraints: const BoxConstraints(
              minHeight: 36.0, // Ensure buttons have a reasonable height
            ),
            // Use theme colors for better consistency
            selectedColor: Colors.white,
            fillColor: Theme.of(context).colorScheme.primary,
            color: Theme.of(context).colorScheme.primary,
            selectedBorderColor: Theme.of(context).colorScheme.primary,
            borderColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        // centerTitle: true, // Not needed when title widget is explicitly Center
      ),
      // The body remains the same as your original code
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