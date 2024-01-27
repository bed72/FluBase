import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_maps/maps.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late MapZoomPanBehavior _zoom;
  late MapTileLayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = MapTileLayerController();
    _zoom = MapZoomPanBehavior(
      minZoomLevel: 12,
      maxZoomLevel: 18,
      enableDoubleTapZooming: true,
      focalLatLng: const MapLatLng(
        -27.7925692,
        -50.2859257,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfMaps(
        layers: [
          MapTileLayer(
            zoomPanBehavior: _zoom,
            controller: _controller,
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
        ],
      ),
    );
  }
}
