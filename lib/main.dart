// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/services.dart';
// import 'package:idealtype/ranking.dart';
// import 'package:idealtype/view/ranking.dart';
// import 'package:idealtype/view/winner.dart';
//
// // void main() async {
// //
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatefulWidget {
// //   @override
// //   _MyAppState createState() => _MyAppState();
// // }
// // class _MyAppState extends State<MyApp> {
// //   @override
// //   Widget build(BuildContext context) {
// //     SystemChrome.setEnabledSystemUIOverlays([]);
// //
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: "ideal type world cup",
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
//       initialRoute: '/',
//       routes: {
//         '/':(context)=>Winner(),
//         '/ranking':(context)=>Ranking(),
// //       },
// //     );
// //   }
// // }
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
// class _MyAppState extends State<MyApp> {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("hello world"),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             ElevatedButton(
//
//               child: Text("create button",style: TextStyle(color : Colors.white)),
//               onPressed: (){
//                 //클릭시 데이터를 추가해준다.
//                 String book = "천년의_질문";
//                 firestore.collection('books').doc(book).set({ 'page': 433, 'purchase?': false, 'title':'천년의_질문'});
//               },
//             ),
//             ElevatedButton(
//
//               child: Text("read button", style: TextStyle(color : Colors.white)),
//               onPressed: (){
//                 //클릭시 데이터를 읽어준다
//               },
//             ),
//             ElevatedButton(
//               child: Text("update button", style: TextStyle(color : Colors.white)),
//               onPressed: (){
//                 //클릭시 데이터를 갱신해준다.
//               },
//             ),
//             ElevatedButton(
//               child: Text("delete button", style: TextStyle(color : Colors.white)),
//               onPressed: (){
//                 //클릭시 데이터를 삭제해 준다.
//                 firestore.collection("books").doc("천년의_질문").delete();
//                 //특정 document 의 field 하나를 삭제
//                 firestore.collection('books').doc('on_intelligence').update({'page': FieldValue.delete()});
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }