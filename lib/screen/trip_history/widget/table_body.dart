import 'package:flutter/material.dart';

class TableBody extends StatelessWidget {
  final double width;
  final String label;

  TableBody({this.label, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xFFF2F3F4),
            border: Border.all(color: Colors.white, width: 1)),
        width: width,
        child: Text(
          label,
          style: TextStyle(
              color: Colors.black45, fontWeight: FontWeight.w600, fontSize: 16),
        ));
  }
}
