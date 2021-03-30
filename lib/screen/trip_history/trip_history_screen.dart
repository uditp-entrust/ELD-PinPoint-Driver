import 'dart:async';

import 'package:eld_pinpoint_driver/constants.dart';
import 'package:eld_pinpoint_driver/screen/home/home_screen.dart';
import 'package:eld_pinpoint_driver/screen/trip_history/widget/table_body.dart';
import 'package:eld_pinpoint_driver/widget/custom_appbar.dart';
import 'package:eld_pinpoint_driver/widget/google_map_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripHistoryScreen extends StatefulWidget {
  static const routeName = '/trip_history';

  @override
  _TripHistoryScreenState createState() => _TripHistoryScreenState();
}

class _TripHistoryScreenState extends State<TripHistoryScreen> {
  Completer<GoogleMapController> _controller = Completer();
  String location;

  double _lat = 23.112650;
  double _long = 72.583618;

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void onMapTap(LatLng latLng) {
    setState(() {
      _lat = latLng.latitude;
      _long = latLng.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
        return true;
      },
      child: SafeArea(
          child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: CustomAppBar(
                icon: Icons.arrow_back,
                onIconTap: () =>
                    {Navigator.of(context).pushNamed(HomeScreen.routeName)},
                title: 'Trip History')),
        body: SingleChildScrollView(
          child: Container(
            // margin: EdgeInsets.all(screenMargin),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Text(
                            '23-02-2020',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.calendar_today,
                          size: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: getScreenHeight(context) * 0.4,
                  child: GoogleMapLocation(
                    lat: _lat,
                    long: _long,
                    onMapTap: onMapTap,
                    onMapCreated: onMapCreated,
                  ),
                ),
                Container(
                  width: getScreenWidth(context),
                  child: Table(children: [
                    TableRow(children: [
                      Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              border: Border(
                                  right: BorderSide(
                                      color: Colors.white, width: 1))),
                          width: getScreenWidth(context) / 0.33,
                          child: Text(
                            'Time',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )),
                      Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              border: Border(
                                  right: BorderSide(
                                      color: Colors.white, width: 1))),
                          width: getScreenWidth(context) / 0.33,
                          child: Text(
                            'Location',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )),
                      Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor),
                          width: getScreenWidth(context) / 0.33,
                          child: Text(
                            'Speed',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )),
                    ]),
                    TableRow(children: [
                      TableBody(
                          label: '23:30PM',
                          width: getScreenWidth(context) / 0.33),
                      TableBody(
                          label: 'Greenwood Heights',
                          width: getScreenWidth(context) / 0.33),
                      TableBody(
                          label: '0.075mph',
                          width: getScreenWidth(context) / 0.33),
                    ]),
                    TableRow(children: [
                      TableBody(
                          label: '21:50PM',
                          width: getScreenWidth(context) / 0.33),
                      TableBody(
                          label: 'Park Slope',
                          width: getScreenWidth(context) / 0.33),
                      TableBody(
                          label: '0.085mph',
                          width: getScreenWidth(context) / 0.33),
                    ]),
                    TableRow(children: [
                      TableBody(
                          label: '23:30PM',
                          width: getScreenWidth(context) / 0.33),
                      TableBody(
                          label: 'Greenwood Heights',
                          width: getScreenWidth(context) / 0.33),
                      TableBody(
                          label: '0.075mph',
                          width: getScreenWidth(context) / 0.33),
                    ]),
                    TableRow(children: [
                      TableBody(
                          label: '21:50PM',
                          width: getScreenWidth(context) / 0.33),
                      TableBody(
                          label: 'Park Slope',
                          width: getScreenWidth(context) / 0.33),
                      TableBody(
                          label: '0.085mph',
                          width: getScreenWidth(context) / 0.33),
                    ]),
                  ]),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
