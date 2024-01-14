import 'package:flutter/material.dart';
import '../homepage/views/drawer.dart';
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
          drawer: const Cdrawer(),
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                    icon: Text(
                  "Asset",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
                Tab(
                    icon: Text(
                  "Liabialiaties",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ],
            ),
            title: const Center(
                child: Text(
              "Add       ",
              style: TextStyle(fontSize: 25, color: Colors.white),
            )),
            backgroundColor: Colors.purple,
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
