import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class Game1Screen extends StatelessWidget {
  // Declare a final variable to hold the Mapbox style URL
  final String mapboxStyleUrl;

  // Update the constructor to require the mapboxStyleUrl
  const Game1Screen({
    Key? key,
    required this.mapboxStyleUrl, // Make it a required parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // You might want to make the title dynamic too, or keep it generic
        title: const Text('Game 1'),
      ),
      // Full-screen Mapbox map
      body: MapWidget(
        // Use the passed-in style URL
        styleUri: mapboxStyleUrl,
        // Remove the default camera options to let the style define the initial view,
        // or set different options if needed.
        // cameraOptions: CameraOptions(
        //   center: Point(coordinates: Position(-0.1276, 51.5074)),
        //   zoom: 4.0,
        // ),
        // You might need to handle map creation callbacks if you need
        // to interact with the map controller later.
        // onMapCreated: (MapboxMap mapboxMap) {
        //   // Map controller is ready
        // },
      ),
    );
  }
}
