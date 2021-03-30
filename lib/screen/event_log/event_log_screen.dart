import 'package:date_format/date_format.dart';
import 'package:eld_pinpoint_driver/constants.dart';
import 'package:eld_pinpoint_driver/screen/home/home_screen.dart';
import 'package:eld_pinpoint_driver/widget/custom_appbar.dart';
import 'package:eld_pinpoint_driver/widget/custom_button.dart';
import 'package:eld_pinpoint_driver/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class EventLogScreen extends StatefulWidget {
  static const routeName = '/event_log';

  @override
  _EventLogScreenState createState() => _EventLogScreenState();
}

class _EventLogScreenState extends State<EventLogScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _timeController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = new DateTime.now();

  List<String> statusList = ["Driving"];
  String status = "Driving";

  Future _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030));
    if (picked != null)
      setState(() => {_dateController.text = picked.toString()});
  }

  Future<Null> _selectTime(BuildContext context) async {
    TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    print('value for selected time $picked');
    if (picked != null) {
      print('picker hour and minute ${picked.hour} ${picked.minute}');
      setState(() {
        selectedTime = picked;
        print('setting text field ${selectedTime.hour} ${selectedTime.minute}');
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      selectedItem: 1,
                    )));
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: CustomAppBar(
                  icon: Icons.arrow_back,
                  onIconTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      selectedItem: 1,
                                    )))
                      },
                  title: 'Event Logs')),
          bottomNavigationBar: Container(
            margin: EdgeInsets.all(screenMargin),
            child: CustomButton(
              onTap: () {},
              label: 'SAVE',
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(screenMargin),
            child: Form(
              child: Column(
                children: [
                  InkWell(
                    // onTap: () {
                    //   _selectDate(context);
                    // },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Enter Date',
                              suffixIcon: Icon(Icons.date_range)),
                          controller: _dateController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Required field';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    // onTap: () {
                    //   _selectTime(context);
                    // },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Enter Time',
                              suffixIcon: Icon(Icons.timelapse_rounded)),
                          controller: _timeController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Required field';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: DropdownButtonFormField(
                      items: (statusList).map((String ppt) {
                        return new DropdownMenuItem(
                            value: ppt,
                            child: Row(
                              children: <Widget>[
                                Text(ppt.toUpperCase()),
                              ],
                            ));
                      }).toList(),
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.drive_eta_outlined)),
                      value: status,
                      onChanged: (value) {
                        setState(() {
                          status = value;
                        });
                      },
                      hint: Text('Select Participate Type'),
                      validator: (value) {
                        if (value == null) {
                          return 'Required field';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: CustomTextField(
                      keyboardType: TextInputType.phone,
                      hintText: 'Location',
                      initialValue: '',
                      enabled: false,
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Required field';
                      //   }
                      //   if (value.length != 10) {
                      //     return 'Invalid phone number';
                      //   }
                      // },
                      textfieldIcon: Icon(Icons.place_rounded),
                      onSaved: (value) {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: CustomTextField(
                      keyboardType: TextInputType.phone,
                      hintText: 'Odometer',
                      initialValue: '',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                        if (value.length != 10) {
                          return 'Invalid phone number';
                        }
                      },
                      textfieldIcon: Icon(Icons.av_timer_sharp),
                      onSaved: (value) {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: CustomTextField(
                      keyboardType: TextInputType.phone,
                      hintText: 'Duration',
                      initialValue: '',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Required field';
                        }
                        if (value.length != 10) {
                          return 'Invalid phone number';
                        }
                      },
                      textfieldIcon: Icon(Icons.timelapse_rounded),
                      onSaved: (value) {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (getScreenWidth(context) - 32) / 2,
                          child: Row(
                            children: [
                              Container(
                                height: 23,
                                width: 23,
                                margin: EdgeInsets.only(right: 7),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 2),
                                    // color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 7),
                                child: Text(
                                  'PERSONAL USE',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                            width: (getScreenWidth(context) - 32) / 2,
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 23,
                                  width: 23,
                                  margin: EdgeInsets.only(right: 7),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                          width: 2),
                                      // color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 7),
                                  child: Text(
                                    'YARD MOVES',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ))
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
