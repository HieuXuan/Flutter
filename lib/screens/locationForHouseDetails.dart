import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationForHouseDetails extends StatefulWidget {
  @override
  _LocationForHouseDetailsState createState() =>
      _LocationForHouseDetailsState();
}

class _LocationForHouseDetailsState extends State<LocationForHouseDetails> {
  final Set<Marker> _markers = {};
  static const LatLng _center =
      const LatLng(21.0468981065856, 105.78542383913674);
  LatLng _lastMapPosition = _center;

  GoogleMapController _controller;

  @override
  void initState() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          icon: BitmapDescriptor.defaultMarker));
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: LatLng(21.0468981065856, 105.78542383913674),
          icon: BitmapDescriptor.defaultMarker));
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: LatLng(21.043043806625505, 105.78156462614497),
          icon: BitmapDescriptor.defaultMarker));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                  zoomGesturesEnabled: true,
                  markers: _markers,
                  initialCameraPosition:
                      CameraPosition(target: _center, zoom: 11.0),
                  mapType: MapType.normal,
                  onMapCreated: (controller) {
                    setState(() {
                      _controller = controller;
                    });
                  },
                  onTap: (coordinates) => _controller
                      .animateCamera(CameraUpdate.newLatLng(coordinates))),
            ),
          ],
        ),
      ),
    );
  }
}
