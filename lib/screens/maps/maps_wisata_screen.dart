import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Destination {
  String? name;
  String? location;
  LatLng? coordinates;
  String? image;
  double? rating;

  Destination.setDestination({
    required String this.name,
    required String this.location,
    required LatLng? this.coordinates,
    required String this.image,
    required double this.rating,
  });
}

class MapsWisataScreen extends StatefulWidget {
  final Destination itemDestination;

  const MapsWisataScreen({super.key, required this.itemDestination});

  @override
  State<MapsWisataScreen> createState() => _MapsWisataScreenState();
}

class _MapsWisataScreenState extends State<MapsWisataScreen> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  CameraPosition? lokasiDestinasi;

  @override
  void initState() {
    lokasiDestinasi = CameraPosition(
      target: widget.itemDestination.coordinates!,
      zoom: 17,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            // buat nampilkan map menjadi full layar
            child: GoogleMap(
              mapType: MapType.satellite,
              initialCameraPosition: lokasiDestinasi!,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: {
                Marker(
                  markerId: MarkerId("lokasi-destinasi"),
                  position: widget.itemDestination.coordinates!,
                  infoWindow: InfoWindow(
                    title: widget.itemDestination.name,
                  ),
                ),
              },
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ListTile(
                  title: Text(widget.itemDestination.name!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.itemDestination.location!),
                      RatingBar.builder(
                        initialRating: widget.itemDestination.rating ?? 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 30.0,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        unratedColor: Colors.grey,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 14,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("100000"), Text("Sudah Berkunjung")],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
