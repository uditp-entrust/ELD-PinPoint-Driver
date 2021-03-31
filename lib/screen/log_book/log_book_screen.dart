import 'package:eld_pinpoint_driver/constants.dart';
import 'package:eld_pinpoint_driver/screen/event_log/event_log_screen.dart';
import 'package:eld_pinpoint_driver/screen/home/home_screen.dart';
import 'package:eld_pinpoint_driver/screen/log_book/widget/log_chart.dart';
import 'package:eld_pinpoint_driver/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class LogBookScreen extends StatelessWidget {
  static const routeName = '/log_book';

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
                  title: 'Logs')),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 170,
                    child: LogChart(
                      height: 170,
                      width: getScreenWidth(context) - 20,
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(top: 40),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Driver Log',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 2),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(EventLogScreen.routeName);
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              Text(
                                'Edit',
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 2),
                                child: Icon(
                                  Icons.speed,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                'Miles',
                                style: TextStyle(color: Colors.black54),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          margin: EdgeInsets.only(right: 20),
                          child: CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage('assets/images/profile.jpg')),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Leo Mango',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            Text('New Strum, Brazil',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54))
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.black45),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        Container(
                            height: 90,
                            width: 60,
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.timelapse,
                              size: 40,
                              color: Theme.of(context).primaryColor,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Time Remaining',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text('23-02-2020',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black45))
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.black45),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        Container(
                            height: 90,
                            width: 60,
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.timer,
                              size: 40,
                              color: Theme.of(context).primaryColor,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Odometer',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 85,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('Begin',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black45)),
                                              Text('06:22:07AM',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black45))
                                            ]),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 85,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('End',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black45)),
                                              Text('10:47:10PM',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black45))
                                            ]),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 80,
                                        child: Column(children: [
                                          Text('Distance',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black45)),
                                          Text('500mi',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black45))
                                        ]),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                            // Text('23-02-2020',
                            //     style: TextStyle(
                            //         fontSize: 14,
                            //         fontWeight: FontWeight.w600,
                            //         color: Colors.black54))
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.black45),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        Container(
                            height: 90,
                            width: 60,
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.timelapse,
                              size: 40,
                              color: Theme.of(context).primaryColor,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Vehicle ID',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text('D112345',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black45))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
