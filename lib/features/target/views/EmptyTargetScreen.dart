import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../homepage/views/drawer.dart';
import 'target_item_screen.dart';
import 'package:http/http.dart' as http;

class Ltarget {
  final int id1;
  final int user_id;
  final String target_name;
  final double current_amount;
  final double targetAmount;
  final String startDate;
  final String endDate;
  final String target_status;
  final String priority;

  const Ltarget({
    required this.id1,
    required this.user_id,
    required this.target_name,
    required this.current_amount,
    required this.targetAmount,
    required this.startDate,
    required this.endDate,
    required this.target_status,
    required this.priority,
  });

  factory Ltarget.fromJson(Map<String, dynamic> json) {
    return Ltarget(
      id1: json['id'],
      user_id: json['user_id'],
      target_name: json['target_name'],
      current_amount: json['current_amount'],
      targetAmount: json['target_amount'],
      startDate: json['target_deadline'],
      endDate: json['target_deadline'],
      target_status: json['target_status'],
      priority: json['target_priority'],
    );
  }
}

class WalletData {
  final int id;
  final double amount;
  final int user_id;

  WalletData({required this.id, required this.amount, required this.user_id});

  factory WalletData.fromJson(Map<String, dynamic> json) {
    return WalletData(
        id: json['id'],
        amount: json['amount'] ?? 0.0,
        user_id: json['user_id']);
  }
}

class EmptyTargetScreen extends StatefulWidget {
  const EmptyTargetScreen({super.key});

  @override
  State<EmptyTargetScreen> createState() => _EmptyTargetScreenState();
}

class _EmptyTargetScreenState extends State<EmptyTargetScreen> {
  double? _walletAmount;
  //late Future<List<Ltarget>> futureAlbum;
  //late double _walletAmount;
  late List<Ltarget> _targets = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Call the functions to fetch data from both APIs concurrently
    final walletAmountFuture = fetchWalletAmount();
    final targetsFuture = fetchtarget();

    // Wait for both futures to complete
    final List<dynamic>? results =
        await Future.wait([walletAmountFuture, targetsFuture]);

    if (results != null && results.length == 2) {
      // Once both futures are complete, you can proceed with your logic here
      setState(() {
        _walletAmount = (results[0] as double?) ?? 0.0;
        _targets = (results[1] as List<Ltarget>);
      });
    } else {
      // Handle the case where one or both futures return null
      print('One or both futures returned null');
    }

    // Once both futures are complete, you can proceed with your logic here
    // For example, update the UI based on the fetched data
  }

  Future<double?> fetchWalletAmount() async {
    final storage = const FlutterSecureStorage();
    final accessToken = await storage.read(key: 'access_token');

    final response = await http.get(
      Uri.parse('http://192.168.1.71:8000/targetwalletcreate/?format=json'),
      headers: {
        'Authorization': 'JWT $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final responseBody = response.body;
      print('Response body: $responseBody');

      // Attempt to parse the response body as JSON
      try {
        final jsonDataList = jsonDecode(responseBody) as List;
        if (jsonDataList.isEmpty) {
          throw Exception('Response body is empty');
        }
        final jsonData = jsonDataList[0] as Map<String, dynamic>;
        // Assuming the wallet amount is stored under the key 'amount'
        final walletAmountString = jsonData['amount'].toString();
        // Check if the wallet amount string is null or empty
        if (walletAmountString.isEmpty) {
          throw Exception('Wallet amount is null or empty');
        }
        // Convert the wallet amount string to a double
        final walletAmount = double.tryParse(walletAmountString);
        if (walletAmount == null) {
          throw Exception('Failed to parse wallet amount');
        }
        // Return the wallet amount
        return walletAmount;
      } catch (e) {
        // Handle JSON parsing errors
        print('Error parsing JSON: $e');
        throw Exception('Failed to parse wallet amount');
      }
    } else {
      // Handle HTTP errors
      print('Failed to load wallet amount: ${response.statusCode}');
      return null;
    }
  }

  Future<List<Ltarget>> fetchtarget() async {
    final storage = const FlutterSecureStorage();
    final accessToken = await storage.read(key: 'access_token');
    print('JWT $accessToken');

    final response = await http.get(
        Uri.parse('http://192.168.1.71:8000/targets/?format=json'),
        headers: {
          HttpHeaders.authorizationHeader: 'JWT $accessToken',
        });

    if (response.statusCode == 200) {
      final responseBody = response.body;
      //print('Response body: $responseBody');
      if (responseBody != null) {
        Iterable list = json.decode(responseBody);
        if (list != null) {
          return List<Ltarget>.from(
              list.map((model) => Ltarget.fromJson(model)));
        } else {
          throw Exception('Failed to parse target data');
        }
      } else {
        throw Exception('Response body is null');
      }
    } else {
      throw Exception('Failed to load album ${response.statusCode}');
    }
  }

  void _showalertdilog1(context, double targetWallet) {
    final TextEditingController controller1 = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add amount in target wallet'),
          content: TextField(
            controller: controller1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter amount',
            ),
          ),
          //content: const Text('You pressed the "Add" button.'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                double addedamount = double.parse(controller1.text);
                targetWallet = targetWallet + addedamount;
                await editTargetWallet(targetWallet);

                Navigator.of(context).pop();
                _refreshData(); // Close the dialog
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showalertdilog2(context, double targetWallet) {
    final TextEditingController controller1 = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter total amount in target wallet'),
          content: TextField(
            controller: controller1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter amount',
            ),
          ),
          //content: const Text('You pressed the "Add" button.'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                double addedamount = double.parse(controller1.text);

                await editTargetWallet(addedamount);

                Navigator.of(context).pop();
                _refreshData();
                // Close the dialog
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _refreshData() async {
    setState(() {
      fetchData();
    });
  }

  // Function to show the add/update/delete options dialog
  Future<void> _showOptionsDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add/Delete/Update'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the options dialog
                  _showAddDialog(); // Show the add dialog
                },
                child: Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the options dialog
                  _showUpdateDialog(); // Show the update dialog
                },
                child: Text('Update'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the options dialog
                  _removeAmount(); // Remove the amount
                },
                child: Text('Delete'),
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to show the add dialog
  Future<void> _showAddDialog() async {
    double newAmount = 0.0;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Amount'),
          content: TextField(
            onChanged: (value) {
              newAmount = double.tryParse(value) ?? 0.0;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter Amount'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the add dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  targetWallet = newAmount;
                });
                Navigator.pop(context); // Close the add dialog
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Function to show the update dialog
  Future<void> _showUpdateDialog() async {
    double newAmount = targetWallet;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Amount'),
          content: TextField(
            onChanged: (value) {
              newAmount = double.tryParse(value) ?? targetWallet;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter New Amount'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the update dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  targetWallet = newAmount;
                });
                Navigator.pop(context); // Close the update dialog
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  // Function to remove the amount
  void _removeAmount() {
    setState(() {
      targetWallet = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Replace and add layout widgets
    // 1
<<<<<<< HEAD
    if (_walletAmount == null || _targets == null) {
      // Show loading indicator while data is being fetched
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
=======
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add functionality for the floating button
          Navigator.push(context, MaterialPageRoute(builder: (context) => TargetItemScreen()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue, // Customize the color as needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        // 2
        child: Center(
          // 3
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              
              MaterialButton(
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.green,
                onPressed: () {
                  // TODO: Open a field to add target amount
                  // Show options dialog on button click
                  _showOptionsDialog();

                },
                child: const Text('Add or update or delete amount to the wallet'),
              ),
              // TODO: Add empty image
              Flexible(
                // 2
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.asset('assets/no_goals.jpg'),
                ),
              ),
              // TODO: Add empty screen title
              Text(
                'No Targets',
                style: Theme.of(context).textTheme.headline6,
              ),
              // TODO: Add empty screen subtitle
              const SizedBox(height: 16.0),
              const Text(
                'Want to add target?\n'
                'Tap the + button to write them down!',
                textAlign: TextAlign.center,
              ),

            ],
          ),
>>>>>>> 9e7c4a3f195476875119300b52c18235ef4e9ee8
        ),
      );
    } else {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              drawer: Cdrawer(),
              appBar: AppBar(
                backgroundColor: Colors.purple,
                title: const Text('Target page',
                    style: TextStyle(color: Colors.white)),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // TODO: Add functionality for the floating button
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TargetItemScreen(amount: _walletAmount ?? 0.0)));
                },
                child: const Icon(Icons.add),
                backgroundColor: Colors.blue, // Customize the color as needed
              ),
              body: RefreshIndicator(
                onRefresh: _refreshData,
                child: FutureBuilder(
                  future: Future.wait([fetchWalletAmount(), fetchtarget()]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Show a loading indicator while fetching data
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error: ${snapshot.error}'); // Show an error message if fetching data fails
                    } else if (snapshot.hasData) {
                      if (_targets.isNotEmpty) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 100,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.green),
                                    child: Column(
                                      children: [
                                        const Text('Target Wallet Amount',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        Text('$_walletAmount',
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18)),
                                        Row(
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,

                                          children: [
                                            TextButton(
                                              child: const Text('    Add',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15)),
                                              onPressed: () {
                                                _showalertdilog1(
                                                    context, _walletAmount!);
                                              },
                                            ),
                                            const Spacer(),
                                            TextButton(
                                              child: const Text('Update',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15)),
                                              onPressed: () {
                                                _showalertdilog2(
                                                    context, _walletAmount!);
                                              },
                                            ),
                                            const Spacer(),
                                            TextButton(
                                              child: const Text('Delete    ',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15)),
                                              onPressed: () async {
                                                _walletAmount = 0.0;
                                                await editTargetWallet(
                                                    _walletAmount!);
                                                _refreshData();
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Expanded(
                              child: ListView.builder(
                                itemCount: _targets.length,
                                itemBuilder: (context, index) {
                                  Ltarget target = _targets[index];
                                  double completionPercentage =
                                      (target.current_amount /
                                                  target.targetAmount)
                                              .clamp(0.0, 1.0) *
                                          100;
                                  String formattedNumber =
                                      completionPercentage.toStringAsFixed(2);

                                  return Card(
                                    elevation: 2.0,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 16.0),
                                    color: Colors.green,
                                    child: ListTile(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                  '${target.target_name} Details'),
                                              content: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                      'Amount: ${target.targetAmount}'),
                                                  Text(
                                                      'Money Allocated: ${target.current_amount}'),
                                                  Text(
                                                      'Priority: ${target.priority}'),
                                                  Text(
                                                      'Start Date: ${target.startDate}'),
                                                  Text(
                                                      'End Date: ${target.endDate}'),
                                                  Text(
                                                      'Status: ${target.target_status}'),
                                                  Text(
                                                      'Progress: ${formattedNumber} %')
                                                ],
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    // Close the AlertDialog
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    // Delete the tapped item and close the AlertDialog
                                                    // _deleteTarget(target);
                                                    int ids = target.id1;
                                                    await deleteData(ids);
                                                    double numbers =
                                                        target.current_amount;
                                                    await editTargetWallet(
                                                        numbers);

                                                    setState(() {
                                                      //futureAlbum = fetchData();
                                                    });
                                                    _refreshData();
                                                    Navigator.of(context).pop();
                                                    // Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Delete'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      title: Text(target.target_name),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  'Amount: ${target.targetAmount}'),
                                              Text(
                                                  'Priority: ${target.priority}'),
                                              Text(
                                                  'Status: ${target.target_status}'),
                                            ],
                                          ),
                                          const SizedBox(width: 20.0),
                                          // Adjust the space between text and indicator
                                          CircularPercentIndicator(
                                            radius: 35,
                                            lineWidth: 8,
                                            percent: completionPercentage / 100,

                                            progressColor: Colors.deepPurple,
                                            backgroundColor:
                                                Colors.deepPurple.shade100,
                                            circularStrokeCap:
                                                CircularStrokeCap.round,
                                            center:
                                                Text('${formattedNumber} %'),
                                            // value: completionPercentage / 100,
                                            // backgroundColor: Colors.grey,
                                            // valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                            // strokeWidth: 20.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            // TODO: Add empty image
                          ],
                        );
                      } else {
                        return Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.green),
                                  child: Column(
                                    children: [
                                      const Text('Target Wallet Amount',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                      Text('$_walletAmount',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                      Row(
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,

                                        children: [
                                          TextButton(
                                            child: const Text('    Add',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15)),
                                            onPressed: () {
                                              _showalertdilog1(
                                                  context, _walletAmount!);
                                            },
                                          ),
                                          const Spacer(),
                                          TextButton(
                                            child: const Text('Update',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15)),
                                            onPressed: () {
                                              _showalertdilog2(
                                                  context, _walletAmount!);
                                            },
                                          ),
                                          const Spacer(),
                                          TextButton(
                                            child: const Text('Delete    ',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15)),
                                            onPressed: () async {
                                              _walletAmount = 0.0;
                                              await editTargetWallet(
                                                  _walletAmount!);
                                              _refreshData();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            // 2
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.asset('assets/no_goals.jpg'),
                            ),
                          ),

                          // TODO: Add empty screen title
                          Text(
                            'No Targets',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          // TODO: Add empty screen subtitle
                          const SizedBox(height: 16.0),
                          const Text(
                            'Want to add target?\n'
                            'Tap the + button to write them down!',
                            textAlign: TextAlign.center,
                          ),
                        ]);
                      }
                    } else {
                      return const Scaffold(
                        body: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )));
    }
  }
}

// Column(children: [
//                         Flexible(
//                           // 2
//                           child: AspectRatio(
//                             aspectRatio: 1 / 1,
//                             child: Image.asset('assets/no_goals.jpg'),
//                           ),
//                         ),

//                         // TODO: Add empty screen title
//                         Text(
//                           'No Targets',
//                           style: Theme.of(context).textTheme.headline6,
//                         ),
//                         // TODO: Add empty screen subtitle
//                         const SizedBox(height: 16.0),
//                         const Text(
//                           'Want to add target?\n'
//                           'Tap the + button to write them down!',
//                           textAlign: TextAlign.center,
//                         ),
//                       ]);

// return Container(color: Colors.purple);

Future<void> editTargetWallet(double editedamount) async {
  final storage = const FlutterSecureStorage();

  print("\n$editedamount");

  Map<String, dynamic> requestBody = {
    'amount': editedamount,
    // You might need to include other fields if required by your backend
  };
  final accessToken = await storage.read(key: 'access_token');
  print('JWT $accessToken');
  await http.put(
    Uri.parse('http://192.168.1.71:8000/targetwallet/update/'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'JWT $accessToken',
    },
    body: jsonEncode(requestBody),
  );
}

Future<void> addassetc(String category_name) async {
  final storage = const FlutterSecureStorage();

  print("\n$category_name");

  Map<String, dynamic> requestBody = {
    'category_name': category_name,
  };
  final accessToken = await storage.read(key: 'access_token');
  print('JWT $accessToken');
  await http.post(Uri.parse('http://192.168.1.71:8000/assetcategories/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        //'Content-Type': 'application/json',
        'Authorization': 'JWT $accessToken'
      },
      body: jsonEncode(requestBody));
}

Future<void> deleteData(int id) async {
  //print(type);
  print(id);
  final storage = const FlutterSecureStorage();
  final accessToken = await storage.read(key: 'access_token');
  final response = await http.delete(
    Uri.parse('http://192.168.1.71:8000/targets/$id'),
    headers: {
      HttpHeaders.authorizationHeader: 'JWT $accessToken',
    },
  );

  if (response.statusCode == 204) {
    print('Data with ID $id deleted successfully');
  } else {
    throw Exception('Failed to delete data: ${response.statusCode}');
  }
}
