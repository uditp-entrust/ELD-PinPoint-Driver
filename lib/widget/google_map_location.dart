import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class GoogleMapLocation extends StatefulWidget {
  final double lat;
  final double long;
  final void Function(GoogleMapController) onMapCreated;
  final void Function(LatLng) onMapTap;

  GoogleMapLocation({this.lat, this.long, this.onMapCreated, this.onMapTap});

  @override
  _GoogleMapLocationState createState() => _GoogleMapLocationState();
}

class _GoogleMapLocationState extends State<GoogleMapLocation> {
  BitmapDescriptor customIcon;
  double pinPillPosition = -170;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    setCustomIcon();
  }

  void setMapPins() {
    setState(() {
      _markers = {
        Marker(
            markerId: MarkerId('m1'),
            draggable: true,
            position: LatLng(
              widget.lat,
              widget.long,
            ),
            onTap: () {
              setState(() {
                pinPillPosition = 0;
              });
            },
            icon: customIcon),
      };
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  void setCustomIcon() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/marker.png', 150);
    customIcon = BitmapDescriptor.fromBytes(markerIcon);
    // customIcon = await BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(size: Size(100, 100)), 'assets/images/marker.png');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                widget.lat,
                widget.long,
              ),
              zoom: 16,
            ),
            // onMapCreated: widget.onMapCreated,
            onMapCreated: (GoogleMapController controller) {
              widget.onMapCreated(controller);
              setMapPins();
            },
            // onTap: widget.onMapTap,
            onTap: (LatLng latlong) {
              setState(() {
                pinPillPosition = -170;
              });
            },
            markers: _markers),
        AnimatedPositioned(
          top: pinPillPosition,
          // top: 0,
          right: 0,
          left: 0,
          duration: Duration(milliseconds: 300),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.all(50),
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          blurRadius: 20,
                          offset: Offset.zero,
                          color: Colors.grey.withOpacity(0.5))
                    ]),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 1),
                                    child: Icon(
                                      Icons.date_range,
                                      color: Colors.black54,
                                      size: 24,
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 1),
                                    child: Text(
                                      DateFormat.yMd()
                                          .add_jm()
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 2),
                                    child: Icon(
                                      Icons.place,
                                      color: Colors.black54,
                                      size: 24,
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: Text(
                                      "SG Road",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 2),
                                  child: Icon(
                                    Icons.speed,
                                    color: Colors.black54,
                                    size: 24,
                                  )),
                              Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: Text(
                                    "40mpl",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 2),
                                  child: Icon(
                                    Icons.motorcycle_outlined,
                                    color: Colors.black54,
                                    size: 24,
                                  )),
                              Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: Text(
                                    "D112345",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        )
      ],
    );
  }
}
