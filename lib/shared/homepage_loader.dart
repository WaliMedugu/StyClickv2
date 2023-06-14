// import 'package:flutter/material.dart';


// class HomepageLoader extends StatefulWidget {
//   final String? fName;
//   const HomepageLoader({super.key, this.fName});

//   @override
//   State<HomepageLoader> createState() => _HomepageLoaderState();
// }

// class _HomepageLoaderState extends State<HomepageLoader> {
//   int timer = 1000;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ListView.builder(
//             itemCount: 4,
//             itemBuilder: (BuildContext ctx, index) {
//               int timer = 1000;
//               return Shimmer.fromColors(
//                 baseColor: Colors.grey.shade300,
//                 highlightColor: Colors.white,
//                 period: Duration(milliseconds: timer),
//                 child: box(),
//               );
//             }),
//       ),
//     );
//   }

//   Widget box() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: double.infinity,
//           height: 48.h,
//           decoration: BoxDecoration(
//               // borderRadius: BorderRadius.circular(50),
//               color: Colors.grey),
//         ),
//         16.height,
//         Container(
//           height: 24.h,
//           width: 100.w,
//           decoration: BoxDecoration(
//               // borderRadius: BorderRadius.circular(50),
//               color: Colors.grey),
//         ),
//         Container(
//           // height: 100,
//           margin: EdgeInsets.only(bottom: 20),
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
//           child: Row(
//             children: [
//               Container(
//                 width: 80,
//                 height: 50,
//                 decoration:
//                     BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
//               ),
//               SizedBox(width: 20),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     16.height,
//                     Container(
//                       width: double.infinity,
//                       height: 10,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.grey),
//                     ),
//                     10.height,
//                     Container(
//                       width: double.infinity,
//                       height: 10,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.grey),
//                     ),
//                     10.height,
//                     Container(
//                       width: 150,
//                       height: 10,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.grey),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
