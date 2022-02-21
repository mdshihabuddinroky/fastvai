// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:fastvai/screens/Store/store.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fastvai/controller/location_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({Key? key}) : super(key: key);

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  var finallat = (0.0).obs;
  var finallng = (0.0).obs;
  Set<Marker> _markers = {};
  final Locationget Getlocation = Get.put(Locationget());
  final Locationget Googlelogin = Get.put(Locationget());
  late BitmapDescriptor mapMarker;
  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/destination_marker.png',
    );
  }

  @override
  void initState() {
    Getlocation.checkLocation();
    setCustomMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> GetAddressFromLatLong() async {
      // List<Placemark> placemarks =
      //     await placemarkFromCoordinates(finallat.value, finallng.value);
      // print(placemarks);
      // Placemark place = placemarks[0];
      // var Address =
      //     '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      SharedPreferences pref = await SharedPreferences.getInstance();
      // print('storing final lat: $finallat');
      pref.setStringList("userlocation",
          [finallat.value.toString(), finallng.value.toString()]);
      Get.to(() => const StoreScreen(), transition: Transition.cupertino);
    }

    googlemapcontroller(GoogleMapController) {
      setState(() {
        finallat(Getlocation.lat.value);
        finallng(Getlocation.lng.value);
        print('storing final lat: $finallat');

        _markers.add(Marker(
            markerId: MarkerId("1"),
            position: LatLng(Getlocation.lat.value, Getlocation.lng.value),
            //  icon: mapMarker,
            draggable: true,
            // icon: ,
            infoWindow: const InfoWindow(
                title: 'set location',
                snippet: 'We will deliver here your products')));
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            'fi fi-rr-arrow-small-left',
            style: TextStyle(
                fontFamily: 'uicons', color: Colors.black87, fontSize: 25),
          ),
        ),
        title: Text(
          'Set Location',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Obx(() {
        return (Getlocation.locationget.value)
            ? Stack(children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target:
                          LatLng(Getlocation.lat.value, Getlocation.lng.value),
                      zoom: 16),
                  mapType: MapType.normal,
                  onMapCreated: googlemapcontroller,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  markers: _markers,
                  onTap: (latlng) {
                    setState(() {
                      _markers.removeAll;
                      setState(() {
                        finallat(latlng.latitude);
                        finallng(latlng.longitude);

                        print('storing final lat: $finallat');
                        _markers.add(Marker(
                            markerId: MarkerId("1"),
                            position: LatLng(latlng.latitude, latlng.longitude),
                            draggable: true,
                            //   icon: mapMarker,
                            infoWindow: const InfoWindow(
                                title: 'set location',
                                snippet:
                                    'We will deliver here your products')));
                      });

                      Getlocation.lat(latlng.latitude);
                      Getlocation.lng(latlng.longitude);
                    });
                  },
                ),
                Positioned(
                    bottom: 5.h,
                    left: 10.w,
                    right: 10.w,
                    child: Center(
                      child: ElevatedButton(
                          onPressed: () {
                            GetAddressFromLatLong();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                              shape: const StadiumBorder(),
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.h, horizontal: 10.h)),
                          child: Text(
                            'Set Location',
                            style: GoogleFonts.poppins(fontSize: 14.sp),
                          )),
                    ))
              ])
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
