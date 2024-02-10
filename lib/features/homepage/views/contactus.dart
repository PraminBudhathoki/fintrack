// // // import 'package:flutter/material.dart';
// // // import 'drawer.dart';

// // // class Contact extends StatelessWidget {
// // //   const Contact({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       drawer: const Cdrawer(),
// // //       backgroundColor: Colors.white,
// // //       body: const Aaaa(),
// // //       appBar: AppBar(
// // //         toolbarHeight: 50,
// // //         title: const Text("             Contact us",
// // //             style: TextStyle(color: Colors.white)),
// // //         backgroundColor: Colors.purple,
// // //         elevation: 10,
// // //         actions: const [],
// // //       ),
// // //     );
// // //   }
// // // }

// // // class Aaaa extends StatelessWidget {
// // //   const Aaaa({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return const Text(
// // //       "Contact of the developers of this application are:\nAabiskar Bhattarai   : 9869670818\nNikesh Bhattarai      : 9860740289\nNirajan Dhital           : 9866296208\nPramin Budhathoki : 9864370517",
// // //       style: TextStyle(
// // //         fontSize: 20,
// // //         fontStyle: FontStyle.italic,
// // //       ),
// // //     );
// // //   }
// // // }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Contact extends StatelessWidget {
//   const Contact({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Iicon(),
//     );
//   }
// }

// class Iicon extends StatefulWidget {
//   const Iicon({Key? key}) : super(key: key);

//   @override
//   State<Iicon> createState() => _IiconState();
// }

// class _IiconState extends State<Iicon> {
//   TextEditingController amountController = TextEditingController();
//   TextEditingController noteController = TextEditingController();
//   DateTime selectedDate = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       mainAxisSpacing: 18,
//       crossAxisSpacing: 18,
//       crossAxisCount: 4,
//       padding: const EdgeInsets.all(15),
//       children: [
//         PhysicalModel(
//           color: Colors.white,
//           elevation: 6,
//           shadowColor: Colors.black,
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//           child: InkWell(
//             child: const Column(
//               children: [
//                 Icon(Icons.wallet, size: 55, color: Colors.blueGrey),
//                 Text("Salary",
//                     style: TextStyle(
//                         color: Colors.black87,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w700,
//                         decoration: TextDecoration.none)),
//               ],
//             ),
//             onTap: () {
//               _showBottomSheet(context);
//             },
//           ),
//         ),
//         // Other icons...
//       ],
//     );
//   }

//   void _showBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: amountController,
//                   autofocus: true,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     suffixIcon: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.add_box_rounded),
//                     ),
//                     hintStyle: const TextStyle(fontSize: 20),
//                     border: const OutlineInputBorder(),
//                     hintText: 'Enter amount.',
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: noteController,
//                   keyboardType: TextInputType.text,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: 'Enter note',
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all<Color>(Colors.purple),
//                 ),
//                 onPressed: () async {
//                   DateTime? pickedDate = await showDatePicker(
//                     context: context,
//                     initialDate: selectedDate,
//                     firstDate: DateTime(2000),
//                     lastDate: DateTime(2121),
//                   );
//                   if (pickedDate != null && pickedDate != selectedDate) {
//                     setState(() {
//                       selectedDate = pickedDate;
//                     });
//                   }
//                 },
//                 child: const Text(
//                   "Select Date",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   _sendDataToBackend();
//                 },
//                 child: const Text('Save Data'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Future<void> _sendDataToBackend() async {
//     final url =
//         'https://your-backend-url.com/api/save-data'; // Replace with your backend URL
//     final data = {
//       'amount': amountController.text,
//       'note': noteController.text,
//       'date': selectedDate.toIso8601String(),
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(data),
//       );

//       if (response.statusCode == 200) {
//         // Data sent successfully
//         Navigator.pop(context); // Close the bottom sheet
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Data saved successfully')),
//         );
//       } else {
//         // Failed to send data
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Failed to save data')),
//         );
//       }
//     } catch (e) {
//       print('Error sending data: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Error occurred while saving data')),
//       );
//     }
//   }
// }

// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<Album> createAlbum(String title) async {
//   final response = await http.post(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': title,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }

// class Album {
//   final int id;
//   final String title;

//   const Album({required this.id, required this.title});

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return switch (json) {
//       {
//         'id': int id,
//         'title': String title,
//       } =>
//         Album(
//           id: id,
//           title: title,
//         ),
//       _ => throw const FormatException('Failed to load album.'),
//     };
//   }
// }

// // void main() {
// //   runApp(const MyApp());
// // }

// class Contact extends StatefulWidget {
//   const Contact({super.key});

//   @override
//   State<Contact> createState() {
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<Contact> {
//   final TextEditingController _controller = TextEditingController();
//   Future<Album>? _futureAlbum;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Create Data Example',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Create Data Example'),
//         ),
//         body: Container(
//           alignment: Alignment.center,
//           padding: const EdgeInsets.all(8),
//           child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
//         ),
//       ),
//     );
//   }

//   Column buildColumn() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         TextField(
//           controller: _controller,
//           decoration: const InputDecoration(hintText: 'Enter Title'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               _futureAlbum = createAlbum(_controller.text);
//             });
//           },
//           child: const Text('Create Data'),
//         ),
//       ],
//     );
//   }

//   FutureBuilder<Album> buildFutureBuilder() {
//     return FutureBuilder<Album>(
//       future: _futureAlbum,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Text(snapshot.data!.title);
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }

//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }
