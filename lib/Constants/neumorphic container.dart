// import 'package:flutter/material.dart';
//
// class NeuromorphicContainer extends StatelessWidget {
//   final Widget child;
//
//   const NeuromorphicContainer({required this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(4),
//       child: Container(
//         padding: EdgeInsets.all(5),
//         child: Container(
//           padding: EdgeInsets.all(20),
//           decoration: BoxDecoration(
//               color: Colors.black54,
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.white,
//                     offset: Offset(4.0, 4.0),
//                     blurRadius: 15.0,
//                     spreadRadius: 1.0),
//                 BoxShadow(
//                     color: Colors.grey[600]!,
//                     offset: Offset(-4.0, -4.0),
//                     blurRadius: 15.0,
//                     spreadRadius: 1.0),
//               ],
//               gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Colors.grey[700]!,
//                     Colors.grey[600]!,
//                     Colors.grey[500]!,
//                     Colors.grey[200]!,
//                   ],
//                   stops: [
//                     0,
//                     0.1,
//                     0.3,
//                     1
//                   ]
//               )
//           ),
//
//         ),
//
//         decoration: BoxDecoration(
//
//             color: Colors.grey[300],
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.grey[600]!,
//                   offset: Offset(4.0, 4.0),
//                   blurRadius: 15.0,
//                   spreadRadius: 1.0),
//               BoxShadow(
//                   color: Colors.white,
//                   offset: Offset(-4.0, -4.0),
//                   blurRadius: 15.0,
//                   spreadRadius: 1.0),
//             ],
//             gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Colors.grey[200]!,
//                   Colors.grey[300]!,
//                   Colors.grey[400]!,
//                   Colors.grey[500]!,
//                 ],
//                 stops: [
//                   0.1,
//                   0.3,
//                   0.8,
//                   1
//                 ]
//             )
//         ),
//
//       ),
//     );
//   }
// }
