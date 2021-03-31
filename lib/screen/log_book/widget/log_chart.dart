import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:number_display/number_display.dart';

final display = createDisplay(decimal: 2);

class LogChart extends StatefulWidget {
  final double height, width;

  LogChart({this.height, this.width});

  @override
  _LogChartState createState() => _LogChartState();
}

class _LogChartState extends State<LogChart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Map<String, Object>> _data1 = [
    {'name': 'Please wait', 'value': 0}
  ];

  getData1() async {
    await Future.delayed(Duration(seconds: 4));

    const dataObj = [
      {
        'name': 'Jan',
        'value': 8726.2453,
      },
      {
        'name': 'Feb',
        'value': 2445.2453,
      },
      {
        'name': 'Mar',
        'value': 6636.2400,
      },
      {
        'name': 'Apr',
        'value': 4774.2453,
      },
      {
        'name': 'May',
        'value': 1066.2453,
      },
      {
        'name': 'Jun',
        'value': 4576.9932,
      },
      {
        'name': 'Jul',
        'value': 8926.9823,
      }
    ];

    this.setState(() {
      this._data1 = dataObj;
    });
  }

  @override
  void initState() {
    super.initState();

    this.getData1();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: widget.height,
          width: widget.width,
          child: Echarts(
            option: '''
                 {
    grid: {
        left: '1%',
        right: '1%',
        bottom: '1%',
        top: '4%',
        containLabel: true
    },
    xAxis: {
        type: 'category',
        splitLine: {
                          show: true,
                        },
        data: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23']
    },
    yAxis: {
        type: 'category',
        splitLine: {
                          show: true,
                        },
          data: ["ON DUTY", "DRIVING", "SLEEPING", "OFF DUTY"]
    },
    series: [
        {
          name: 'Step Start',
          type: 'line',
          step: 'start',
          symbol: 'none',
          data: ["OFF DUTY", 
          "OFF DUTY", 
          "OFF DUTY", 
          "OFF DUTY", 
          "OFF DUTY", 
          "OFF DUTY", 
          "OFF DUTY", 
          "OFF DUTY", 
          "OFF DUTY", 
          "OFF DUTY", 
          "ON DUTY", 
          "ON DUTY", 
          "ON DUTY",
          "ON DUTY","ON DUTY", "ON DUTY", "ON DUTY","DRIVING", "DRIVING", "DRIVING", 
          "DRIVING", "SLEEPING", "SLEEPING", "SLEEPING", "SLEEPING"]
        },
    ]
}                  ''',
            extraScript: '''
                  chart.on('click', (params) => {
                    if(params.componentType === 'series') {
                      Messager.postMessage(JSON.stringify({
                        type: 'select',
                        payload: params.dataIndex,
                      }));
                    }
                  });
                ''',
            onMessage: (String message) {
              Map<String, Object> messageAction = jsonDecode(message);
              print(messageAction);
              if (messageAction['type'] == 'select') {
                final item = _data1[messageAction['payload']];
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text(
                      item['name'].toString() + ': ' + display(item['value'])),
                  duration: Duration(seconds: 2),
                ));
              }
            },
          ),
        ),
      ],
    );
  }
}
