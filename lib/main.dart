import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late MapController controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = MapController(
  //     initMapWithUserPosition: const UserTrackingOption(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LocaPick'),
        centerTitle: true,
      ),
      body: Container(
          // child: OSMFlutter(
          //   controller: controller,
          //   osmOption: OSMOption(
          //     isPicker: true,
          //     // userLocationMarker: UserLocationMaker(personMarker: personMarker, directionArrowMarker: directionArrowMarker),
          //     markerOption: MarkerOption(
          //       advancedPickerMarker: const MarkerIcon(
          //         icon: Icon(
          //           Icons.pin_drop,
          //           color: Colors.black,
          //           size: 300,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var point = await showSimplePickerLocation(
              context: context,
              isDismissible: true,
              title: 'Pcik Location',
              textConfirmPicker: 'Pick',
              textCancelPicker: 'Cancel',
              // initCurrentUserPosition: UserTrackingOption(),
              initPosition: GeoPoint(latitude: 47.43, longitude: 8.47));

          if (point != null) {
            print('${point.latitude} , ${point.longitude}');
          }
        },
        child: const Icon(Icons.pin_drop),
      ),
    );
  }
}
