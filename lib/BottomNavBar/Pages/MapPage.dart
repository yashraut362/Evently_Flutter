import 'dart:async';
import 'package:evently/CategoryPages/info.dart';
import 'package:permission/permission.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(19.103378, 72.836391),
    zoom: 16,
  );

  @override
  void initState() {
    // TODO: implement initState
    getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,
        markers: {
          Marker1,
          Marker2,
          Marker3,
          Marker4,
          Marker5,
          Marker6,
          Marker7,
          Marker8,
          Marker08,
          Marker9,
          Marker10,
          Marker11
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Information()),
          );
        },
        label: Text('Information'),
        icon: Icon(Icons.info),
      ),
    );
  }

  Marker Marker1 = Marker(
    markerId: MarkerId('gramercy'),
    position: LatLng(19.124665, 72.822413),
    infoWindow: InfoWindow(title: 'Washroom ', snippet: "Public "),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );
  Marker Marker2 = Marker(
    markerId: MarkerId('gramercy2'),
    position: LatLng(19.104498, 72.836024),
    infoWindow: InfoWindow(title: 'Washroom', snippet: "public"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );
  Marker Marker3 = Marker(
    markerId: MarkerId('gramercy3'),
    position: LatLng(19.099618, 72.843952),
    infoWindow: InfoWindow(title: 'Washroom ', snippet: "Public"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );

  Marker Marker4 = Marker(
    markerId: MarkerId('gramercy4'),
    position: LatLng(19.082799, 72.841491),
    infoWindow: InfoWindow(title: 'Tea Stalls', snippet: "yewale"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );
  Marker Marker5 = Marker(
    markerId: MarkerId('gramercy5'),
    position: LatLng(19.103892, 72.835930),
    infoWindow: InfoWindow(title: 'Tea Stalls', snippet: "Saiba"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );

  Marker Marker6 = Marker(
    markerId: MarkerId('gramercy6'),
    position: LatLng(19.103110, 72.835924),
    infoWindow: InfoWindow(title: 'Tea Stalls', snippet: "Chai Nation"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );

  Marker Marker7 = Marker(
    markerId: MarkerId('gramercy7'),
    position: LatLng(19.103634, 72.834369),
    infoWindow: InfoWindow(title: 'Cobblers', snippet: "Devipada"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );

  Marker Marker8 = Marker(
    markerId: MarkerId('gramercy6'),
    position: LatLng(19.104257, 72.832325),
    infoWindow: InfoWindow(title: 'Cobblers', snippet: "Ashokvan"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );

  Marker Marker08 = Marker(
    markerId: MarkerId('gramercy8'),
    position: LatLng(19.100777, 72.827496),
    infoWindow: InfoWindow(title: 'Cobblers', snippet: "Bhagatnagar"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );
  Marker Marker9 = Marker(
    markerId: MarkerId('gramercy9'),
    position: LatLng(19.108171, 72.833516),
    infoWindow: InfoWindow(title: 'Medical', snippet: "corona"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ),
  );

  Marker Marker10 = Marker(
    markerId: MarkerId('gramercy10'),
    position: LatLng(19.100411, 72.840746),
    infoWindow: InfoWindow(title: 'Medical', snippet: "HIV"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ),
  );
  Marker Marker11 = Marker(
    markerId: MarkerId('gramercy11'),
    position: LatLng(19.109941, 72.837501),
    infoWindow: InfoWindow(title: 'Medical', snippet: "TB"),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ),
  );

  getPermission() async {
    var permissions =
        await Permission.getPermissionsStatus([PermissionName.Location]);
    var permissionNames =
        await Permission.requestPermissions([PermissionName.Location]);
    Permission.openSettings;
  }
}
