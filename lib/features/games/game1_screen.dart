import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class Game1Screen extends StatelessWidget {
  const Game1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game 1 – Map Test'),
      ),
      // Full-screen Mapbox map centered on London
      body: MapWidget(
        cameraOptions: CameraOptions(
          center: Point(coordinates: Position(-0.1276, 51.5074)),
          zoom: 4.0,
        ),
        // styleUri: 'mapbox://styles/your_username/yourStyleId', // optional
      ),
    );
  }
}