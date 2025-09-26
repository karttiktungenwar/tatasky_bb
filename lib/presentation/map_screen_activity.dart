import 'package:flutter/material.dart';

import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

const kGoogleApiKey = "AIzaSyBYBGzhinjqPmuI5LnHDfax5D9_4eqv6Mc";
final homeScaffoldKey = GlobalKey<ScaffoldState>();
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class MapScreenActivity extends StatefulWidget {
  const MapScreenActivity({super.key});

  @override
  State<MapScreenActivity> createState() => _MapScreenActivityState();
}

class _MapScreenActivityState extends State<MapScreenActivity> {
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController _searchController = TextEditingController();

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(18.5204, 73.8567), // Pune lat long
    zoom: 12,
  );

  LatLng? searchedLocation;
  bool _showClear = false;


  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _showClear = _searchController.text.isNotEmpty;
      });
    });
  }

  Future<void> _searchByText(String query) async {
    PlacesSearchResponse response = await _places.searchByText(query);

    if (response.status == "OK" && response.results.isNotEmpty) {
      final result = response.results.first;
      final lat = result.geometry!.location.lat;
      final lng = result.geometry!.location.lng;

      setState(() {
        searchedLocation = LatLng(lat, lng);
      });
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: searchedLocation!, zoom: 14.0),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No results found")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
      appBar: AppBar(
        title: Text("Select Location"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _initialPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: searchedLocation == null
                ? {}
                : {
                    Marker(
                      markerId: const MarkerId("searched"),
                      position: searchedLocation!,
                      infoWindow:
                          const InfoWindow(title: "Searched Location"),
                    ),
                  },
          ),

          // search
          SafeArea(
            child: Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      readOnly: false,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          _searchByText(value);
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Search location",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  IconButton(
                    icon: Icon(_showClear ? Icons.close : Icons.search),
                    onPressed: () {
                      if (_showClear) {
                        _searchController.clear();
                        setState(() {
                          searchedLocation = null;
                        });
                      } else {
                        if (_searchController.text.isNotEmpty) {
                          _searchByText(_searchController.text);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
