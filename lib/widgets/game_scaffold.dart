// import 'package:flutter/material.dart';
// import 'package:project_2/breakpoints.dart';

// class GameScaffold extends StatelessWidget {
//   final List<Widget> content;
//   const GameScaffold({required this.content});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//         Container(
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color(0xffa9d6e5),
//                   Color(0xfff2e8cf),
//                 ],
//               ),
//             ),
//           child: 
//             Center(
//               child: 
//                 LayoutBuilder(
//                   builder: (BuildContext context, BoxConstraints constraints) {
//                     if(constraints.maxWidth < Breakpoints.lg) {
//                       return Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: content,
//                       );
//                     } else {
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: content,
//                       );
//                     }
//                   }
//                 )
//             ),
//         )
//     );
//   }
// }