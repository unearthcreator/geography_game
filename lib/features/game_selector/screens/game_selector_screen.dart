import 'package:flutter/material.dart';
// Assuming PrimaryButton is in shared/widgets now, adjust if needed
import 'package:geography_game/shared/widgets/primary_button.dart';
// Import Game1Screen
import 'package:geography_game/features/games/game1_screen.dart';

class GameSelectorScreen extends StatefulWidget {
  static const routeName = '/selector';

  const GameSelectorScreen({Key? key}) : super(key: key);

  @override
  State<GameSelectorScreen> createState() => _GameSelectorScreenState();
}

class _GameSelectorScreenState extends State<GameSelectorScreen> {
  // State for the toggle buttons (index 0: Flat, index 1: Globe)
  List<bool> _isSelected = [true, false]; // true means Flat is selected by default
  // Define the height for the toggle buttons and images
  final double toggleHeight = 36.0;
  // Define a fixed width for the space the images will occupy
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
      opacity: isVisible ? 1.0 : 0.0,
      child: Image.asset(
        imagePath,
        height: toggleHeight,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.error, size: toggleHeight),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: imagePlaceholderWidth,
                height: toggleHeight,
                child: _buildImagePlaceholder(
                    _isSelected[0], 'assets/images/flatmap-Day.png'),
              ),
              SizedBox(width: horizontalPadding),
              ToggleButtons(
                isSelected: _isSelected,
                onPressed: _onTogglePressed,
                borderRadius: BorderRadius.circular(8.0),
                constraints: BoxConstraints(
                  minHeight: toggleHeight,
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
              SizedBox(width: horizontalPadding),
              SizedBox(
                width: imagePlaceholderWidth,
                height: toggleHeight,
                child: _buildImagePlaceholder(
                    _isSelected[1], 'assets/images/Day.png'),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PrimaryButton(
                label: 'Game1',
                onPressed: () {
                  // --- Determine the style URL based on the toggle ---
                  bool isFlatSelected = _isSelected[0];
                  String mapboxStyleUrl = isFlatSelected
                      ? 'mapbox://styles/unearthcreator/cm8kkp3s801ab01qzdi4c8x1y' // Flat Style
                      : 'mapbox://styles/unearthcreator/cm8kk457f018c01se2j7mfnlf'; // Globe Style

                  // --- Navigate to Game1Screen, passing the style URL ---
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // Pass the selected style URL to the Game1Screen constructor
                      // *** REMOVED const from here ***
                      builder: (_) => Game1Screen(mapboxStyleUrl: mapboxStyleUrl),
                    ),
                  );
                },
              ),
              PrimaryButton(
                label: 'Game2',
                onPressed: () {
                  // TODO: Implement navigation for Game2 if needed
                },
              ),
              PrimaryButton(
                label: 'Game3',
                onPressed: () {
                   // TODO: Implement navigation for Game3 if needed
                },
              ),
              PrimaryButton(
                label: 'Game4',
                onPressed: () {
                   // TODO: Implement navigation for Game4 if needed
                },
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
