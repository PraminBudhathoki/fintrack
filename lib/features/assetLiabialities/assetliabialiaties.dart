import 'package:flutter/material.dart';
import 'package:fintrack/features/homepage/views/homepage.dart';
import 'Assets.dart';
import 'liabialiaties.dart';

class Two extends StatelessWidget {
  const Two({Key? key}) : super(key: key);

// build the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                    icon: Text(
                  "Asset",
                  style: TextStyle(fontSize: 20),
                )),
                Tab(
                    icon: Text(
                  "Liabialiaties",
                  style: TextStyle(fontSize: 20),
                )),
              ],
            ),
            title: const Center(
                child: Text(
              "Add       ",
              style: TextStyle(fontSize: 25),
            )),
            backgroundColor: Colors.green,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
          ),
          body: const TabBarView(
            children: [
              Asset(),
              Liabialiaties(),
            ],
          ),
        ),
      ),
    );
  }
}
