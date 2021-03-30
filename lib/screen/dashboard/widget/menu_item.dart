// import 'package:flutter/material.dart';

// class MenuItem extends StatelessWidget {
//   final double width, height;
//   final String title, subtitle;
//   final IconData icon;

//   MenuItem({this.height, this.width, this.title, this.subtitle, this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: height,
//         width: width,
//         child: Row(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//                 margin: EdgeInsets.only(right: 20),
//                 child: Icon(
//                   icon,
//                   color: Colors.black54,
//                   // size: 30,
//                 )),
//             Column(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(bottom: 4),
//                   child: Text(
//                     title,
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 Text(subtitle,
//                     style: TextStyle(
//                         fontSize: 13,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.w500))
//               ],
//             )
//           ],
//         ));
//   }
// }

import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final double width, height;
  final String title, subtitle;
  final IconData icon;

  MenuItem({this.height, this.width, this.title, this.subtitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        // width: width,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(right: 20),
                child: Icon(
                  icon,
                  color: Colors.black54,
                  // size: 30,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(subtitle,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500))
              ],
            )
          ],
        ));
  }
}
