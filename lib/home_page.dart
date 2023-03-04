
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

const LatLng currentLocation = LatLng(25.1193, 55.3773); 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController mapController;
  Map<String, Marker> _marker = {};
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target:currentLocation, //LatLng(0, 10),
          zoom: 14,
        ),
        onMapCreated: (controller) {
          mapController = controller;
          addMarker('test', currentLocation);          
        },
        markers: _marker.values.toSet(),
      ),
    );
  }
   addMarker(String id, LatLng location) async{

    var markerIcon = await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(),
             'assets/images/shop.jpg');
             

      var marker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: const InfoWindow(
          title: 'Title of place',
          snippet: 'Some description of the place',
        )
      );

      _marker[id] = marker;
      setState(() {
        
      });
   }
}