// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String? source;
//   String? destination;

//   List<dynamic>? sourceData;
//   List<dynamic>? destinationData;

//   final sourceController = TextEditingController();
//   final destinationController = TextEditingController();

//   @override
//   void dispose() {
//     sourceController.dispose();
//     destinationController.dispose();
//     super.dispose();
//   }

//   Future<String> getSourceData() async {
//     var url =
//         'https://nominatim.openstreetmap.org/search?q=$source&format=json';
//     var response = await http.get(Uri.parse(url));
//     setState(() {
//       var extractData = jsonDecode(response.body);
//       sourceData = extractData;
//     });
//     return "Success";
//   }

//   Future<String> getDestinationData() async {
//     String url =
//         'https://nominatim.openstreetmap.org/search?q=$destination&format=json';
//     var response = await http.get(Uri.parse(url));
//     setState(() {
//       var extractData = jsonDecode(response.body);
//       destinationData = extractData;
//     });
//     return "Success";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Open Street Map"),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextField(
//                 controller: sourceController,
//                 decoration: InputDecoration(
//                   hintText: "Enter the source name",
//                 ),
//                 onChanged: (value) {
//                   source = value;
//                 },
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 controller: destinationController,
//                 decoration: InputDecoration(
//                   hintText: "Enter the destination name",
//                 ),
//                 onChanged: (value) {
//                   destination = value;
//                 },
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton(
//                 child: Text(
//                   "Search",
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//                 onPressed: () {
//                   getSourceData();
//                   getDestinationData();
//                 },
//               ),
//               sourceData != null
//                   ? Expanded(
//                       child: ListView.builder(
//                         itemCount: sourceData?.length,
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             title: Text(sourceData![index]['display_name']),
//                             subtitle: Text(
//                                 "Latitude: ${sourceData![index]['lat']}, Longitude: ${sourceData![index]['lon']}"),
//                             onTap: () {
//                               setSourceCoordinates(sourceData![index]['lat'],
//                                   sourceData![index]['lon']);
//                             },
//                           );
//                         },
//                       ),
//                     )
//                   : Text(""),
//               destinationData != null
//                   ? Expanded(
//                       child: ListView.builder(
//                         itemCount: destinationData?.length,
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             title:
//                                 Text(destinationData![index]['display_name']),
//                             subtitle: Text(
//                                 "Latitude: ${destinationData![index]['lat']}, Longitude: ${destinationData![index]['lon']}"),
//                             onTap: () {
//                               setDestinationCoordinates(
//                                   destinationData![index]['lat'],
//                                   destinationData![index]['lon']);
//                             },
//                           );
//                         },
//                       ),
//                     )
//                   : Text(""),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> setSourceCoordinates(String lat, String lon) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString("sourceLat", lat);
//     prefs.setString("sourceLon", lon);
//     sourceController.text = "";
//     setState(() {
//       sourceData = null;
//     });
//   }

//   Future<void> setDestinationCoordinates(String lat, String lon) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString("destinationLat", lat);
//     prefs.setString("destinationLon", lon);
//     destinationController.text = "";
//     setState(() {
//       destinationData = null;
//     });
//   }
// }
