// import 'dart:async';

// import 'package:eld_pinpoint_driver/screen/dashboard/widget/menu_item.dart';
// import 'package:eld_pinpoint_driver/widget/google_map_location.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../../constants.dart';

// class DashboardScreen extends StatefulWidget {
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   Completer<GoogleMapController> _controller = Completer();
//   String location;

//   double _lat = 23.112650;
//   double _long = 72.583618;

//   void onMapCreated(GoogleMapController controller) {
//     _controller.complete(controller);
//   }

//   void onMapTap(LatLng latLng) {
//     setState(() {
//       _lat = latLng.latitude;
//       _long = latLng.longitude;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: getScreenHeight(context),
//         child: Stack(
//           children: [
//             Container(
//               height: getScreenHeight(context),
//               child: GoogleMapLocation(
//                 lat: _lat,
//                 long: _long,
//                 onMapTap: onMapTap,
//                 onMapCreated: onMapCreated,
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               child: Container(
//                 // margin: EdgeInsets.all(5),
//                 height: getScreenHeight(context) * 0.2,
//                 width: getScreenWidth(context),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(40),
//                         topRight: Radius.circular(40))),
//                 child: Container(
//                   margin: EdgeInsets.all(5),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           MenuItem(
//                             height: ((getScreenHeight(context) * 0.2) - 10) / 2,
//                             width: (getScreenWidth(context) - 10) / 2,
//                             icon: Icons.calendar_today,
//                             subtitle: '21-01-2020',
//                             title: 'Today Date',
//                           ),
//                           MenuItem(
//                             height: ((getScreenHeight(context) * 0.2) - 10) / 2,
//                             width: (getScreenWidth(context) - 10) / 2,
//                             icon: Icons.car_repair,
//                             subtitle: 'D112345',
//                             title: 'Vehicle Id',
//                           )
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           MenuItem(
//                             height: ((getScreenHeight(context) * 0.2) - 10) / 2,
//                             width: (getScreenWidth(context) - 10) / 2,
//                             icon: Icons.speed,
//                             subtitle: '20mph',
//                             title: 'Average Speed',
//                           ),
//                           MenuItem(
//                             height: ((getScreenHeight(context) * 0.2) - 10) / 2,
//                             width: (getScreenWidth(context) - 10) / 2,
//                             icon: Icons.av_timer_sharp,
//                             subtitle: '75mph',
//                             title: 'Max Speed',
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';

// import 'package:eld_pinpoint_driver/screen/dashboard/widget/menu_item.dart';
// import 'package:eld_pinpoint_driver/widget/google_map_location.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../../constants.dart';

// class DashboardScreen extends StatefulWidget {
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   Completer<GoogleMapController> _controller = Completer();
//   String location;

//   double _lat = 23.112650;
//   double _long = 72.583618;

//   void onMapCreated(GoogleMapController controller) {
//     _controller.complete(controller);
//   }

//   void onMapTap(LatLng latLng) {
//     setState(() {
//       _lat = latLng.latitude;
//       _long = latLng.longitude;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//       child: Scaffold(
//         body: Container(
//           height: getScreenHeight(context),
//           child: Stack(
//             children: [
//               Container(
//                 height: getScreenHeight(context),
//                 child: GoogleMapLocation(
//                   lat: _lat,
//                   long: _long,
//                   onMapTap: onMapTap,
//                   onMapCreated: onMapCreated,
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 child: Container(
//                   // margin: EdgeInsets.all(5),
//                   height: getScreenHeight(context) * 0.25,
//                   width: getScreenWidth(context),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(35),
//                           topRight: Radius.circular(35))),
//                   child: Container(
//                     child: Column(
//                       children: [
//                         Container(
//                           width: getScreenWidth(context),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               MenuItem(
//                                 height:
//                                     ((getScreenHeight(context) * 0.2) - 10) / 2,
//                                 width: (getScreenWidth(context) - 10) / 2,
//                                 icon: Icons.calendar_today,
//                                 subtitle: '21-01-2020',
//                                 title: 'Today Date',
//                               ),
//                               MenuItem(
//                                 height:
//                                     ((getScreenHeight(context) * 0.2) - 10) / 2,
//                                 width: (getScreenWidth(context) - 10) / 2,
//                                 icon: Icons.motorcycle_outlined,
//                                 subtitle: 'D112345',
//                                 title: 'Vehicle Id',
//                               )
//                             ],
//                           ),
//                         ),
//                         Divider(color: Colors.black45),
//                         Row(
//                           children: [
//                             MenuItem(
//                               height:
//                                   ((getScreenHeight(context) * 0.2) - 10) / 2,
//                               width: (getScreenWidth(context) - 10) / 2,
//                               icon: Icons.speed,
//                               subtitle: '20mph',
//                               title: 'Average Speed',
//                             ),
//                             MenuItem(
//                               height:
//                                   ((getScreenHeight(context) * 0.2) - 10) / 2,
//                               width: (getScreenWidth(context) - 10) / 2,
//                               icon: Icons.av_timer_sharp,
//                               subtitle: '75mph',
//                               title: 'Max Speed',
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:eld_pinpoint_driver/screen/dashboard/widget/menu_item.dart';
import 'package:eld_pinpoint_driver/widget/google_map_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constants.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
        return false;
      },
      child: Scaffold(
        body: Container(
          height: getScreenHeight(context),
          child: Stack(
            children: [
              Container(
                height: getScreenHeight(context) * 0.8,
                child: GoogleMapLocation(
                  lat: _lat,
                  long: _long,
                  onMapTap: onMapTap,
                  onMapCreated: onMapCreated,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  // margin: EdgeInsets.all(5),
                  height: getScreenHeight(context) * 0.30,
                  width: getScreenWidth(context),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MenuItem(
                              height:
                                  ((getScreenHeight(context) * 0.25) - 40) / 2,
                              // width: (getScreenWidth(context) - 10) / 2,
                              icon: Icons.calendar_today,
                              subtitle: '21-01-2020',
                              title: 'Today Date',
                            ),
                            MenuItem(
                              height:
                                  ((getScreenHeight(context) * 0.25) - 40) / 2,
                              // width: (getScreenWidth(context) - 10) / 2,
                              icon: Icons.motorcycle_outlined,
                              subtitle: 'D112345',
                              title: 'Vehicle Id',
                            )
                            // Container(
                            //     alignment: Alignment.center,
                            //     height:
                            //         ((getScreenHeight(context) * 0.25) - 40) /
                            //             2,
                            //     child: Text('1')),
                            // Container(
                            //     alignment: Alignment.center,
                            //     height:
                            //         ((getScreenHeight(context) * 0.25) - 40) /
                            //             2,
                            //     child: Text('2')),
                          ],
                        ),
                        Divider(color: Colors.black45),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MenuItem(
                              height:
                                  ((getScreenHeight(context) * 0.25) - 40) / 2,
                              icon: Icons.speed,
                              subtitle: '20mph',
                              title: 'Average Speed',
                            ),
                            MenuItem(
                              height:
                                  ((getScreenHeight(context) * 0.25) - 40) / 2,
                              icon: Icons.av_timer_sharp,
                              subtitle: '75mph',
                              title: 'Max Speed',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
