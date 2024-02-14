import 'dart:io';
import 'package:fintrack/features/homepage/views/drawer.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'), headers: {
    HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
  });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Iterable list = json.decode(response.body);
    return List<Album>.from(list.map((model) => Album.fromJson(model)));
    // return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String type; //Income or expenses or asset or liabialiaties.
  // final String category;
  final int userId;
  final int amount;
  final String note;
  //final DateTime date;

  const Album({
    required this.type,
    //required this.category,
    required this.userId,
    required this.amount,
    required this.note,
    //required this.date
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      type: json['title'],
      userId: json['userId'],
      amount: json['id'],
      note: json['body'],
      //category: json['body'],
      // date: DateTime.parse(json['date']),
    );

    // return switch (json) {
    //   {
    //     'userId': int userId,
    //     'id': int id,
    //     'title': String title,
    //   } =>
    //     Album(
    //       userId: userId,
    //       id: id,
    //       title: title,
    //     ),
    //   _ => throw const FormatException('Failed to load album.'),
    // };
  }
}

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _MyAppState();
}

class _MyAppState extends State<History> {
  late Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        drawer:  Cdrawer(),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('History', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: FutureBuilder<List<Album>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Album album = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PhysicalModel(
                        color: Colors.blueGrey,
                        elevation: 10,
                        borderRadius: BorderRadius.circular(15),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Income Details'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        const Text("Category: Salary"),
                                        const Text("Amount: 5000"),
                                        const Text("Date:2080-10-25"),
                                        const Text("Note: This is note."),
                                        //Text('Type: ${album.type}'),
                                        //Text('Amount: ${album.amount}'),
                                        //Text('Note: ${album.note}'),
                                        Text('User ID: ${album.userId}'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () async {
                                        await deleteAlbum(album.userId);
                                        setState(() {
                                          snapshot.data!.removeAt(index);
                                        });
                                        //Navigator.of(context).pop();
                                      },
                                      child: const Text('Delete'),
                                    ),
                                    // TextButton(
                                    //   onPressed: () {
                                    //     Navigator.of(context).pop();
                                    //   },
                                    //   child: const Text('Delete'),
                                    // ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: ListTile(
                            title: const Row(
                              children: [
                                Text("Income:"),
                                //Text(album.type),
                              ],
                            ),
                            subtitle: const Row(
                              children: [
                                Text("Food:::"),
                                //Text(album.note),
                              ],
                            ),
                            trailing: Text('Amount: ${album.amount}',
                                style: const TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Future<void> deleteAlbum(int id) async {
  final response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
    headers: {
      HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
    },
  );

  if (response.statusCode == 200) {
    print('Deleted');
  } else {
    throw Exception('Failed to delete album');
  }
}
