import 'package:flutter/material.dart';
// Assuming PrimaryButton is in shared/widgets now, adjust if needed
import 'package:geography_game/shared/widgets/primary_button.dart';
import 'package:geography_game/features/games/game1_screen.dart';

class GameSelectorScreen extends StatefulWidget {
  static const routeName = '/selector';

  const GameSelectorScreen({Key? key}) : super(key: key);

  @override
  State<GameSelectorScreen> createState() => _GameSelectorScreenState();
}

class _GameSelectorScreenState extends State<GameSelectorScreen> {
  // State for the toggle buttons (index 0: Flat, index 1: Globe)
  List<bool> _isSelected = [true, false];
  // Define the height for the toggle buttons and images
  final double toggleHeight = 36.0;
  // Define a fixed width for the space the images will occupy
  // Adjust this value based on your actual image widths + desired padding
  final double imagePlaceholderWidth = 40.0;
  // Define horizontal padding between elements
  final double horizontalPadding = 8.0;


  void _onTogglePressed(int index) {
    // Only update state if a different button is pressed
    if (!_isSelected[index]) {
      setState(() {
        for (int i = 0; i < _isSelected.length; i++) {
          _isSelected[i] = (i == index);
        }
      });
    }
  }

  // Helper widget to display the image with opacity for visibility control
  Widget _buildImagePlaceholder(bool isVisible, String imagePath) {
    return Opacity(
      // Set opacity to 1.0 (visible) or 0.0 (invisible)
      opacity: isVisible ? 1.0 : 0.0,
      child: Image.asset(
        imagePath,
        height: toggleHeight,
        // Fit the image within the placeholder bounds if needed
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.error, size: toggleHeight), // Placeholder on error
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Use a Row centered in the title
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center items horizontally
            mainAxisSize: MainAxisSize.min, // Row takes minimum horizontal space
            children: <Widget>[

              // --- Left Image Placeholder ---
              SizedBox(
                width: imagePlaceholderWidth, // Fixed width
                height: toggleHeight, // Match height
                // Use helper to build the potentially visible image inside
                child: _buildImagePlaceholder(
                    _isSelected[0], 'assets/images/flatmap-Day.png'),
              ),

              // --- Spacing ---
              SizedBox(width: horizontalPadding),

              // --- Toggle Buttons (Centerpiece) ---
              ToggleButtons(
                isSelected: _isSelected,
                onPressed: _onTogglePressed,
                borderRadius: BorderRadius.circular(8.0),
                constraints: BoxConstraints(
                  minHeight: toggleHeight, // Use the defined height
                ),
                selectedColor: Colors.white,
                fillColor: Theme.of(context).colorScheme.primary,
                color: Theme.of(context).colorScheme.primary,
                selectedBorderColor: Theme.of(context).colorScheme.primary,
                borderColor: Theme.of(context).colorScheme.primary,
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
              ),

              // --- Spacing ---
              SizedBox(width: horizontalPadding),

              // --- Right Image Placeholder ---
              SizedBox(
                width: imagePlaceholderWidth, // Fixed width (same as left)
                height: toggleHeight, // Match height
                // Use helper to build the potentially visible image inside
                child: _buildImagePlaceholder(
                    _isSelected[1], 'assets/images/Day.png'),
              ),
            ],
          ),
        ),
      ),
      // --- Body remains the same ---
      body: Column(
        children: <Widget>[
          const Spacer(),
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
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
