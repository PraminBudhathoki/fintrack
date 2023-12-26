import 'package:fintrack/features/homepage/views/homepage.dart';
import 'package:fintrack/main.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class One extends StatelessWidget {
  const One({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: "Accounts",
        theme: ThemeData(primarySwatch: Colors.brown),
        debugShowCheckedModeBanner: false,
        home: const Abs());
  }
}

class Abs extends StatelessWidget {
  const Abs({super.key,});

  @override
  Widget build(BuildContext context) {
    //TextEditingController _dataToPass = TextEditingController(text: dataToPass);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Accounts",
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add functionality to perform when the back button is pressed
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(
                    //title: title
                    ), // Pass data to the new screen if needed
              ),
            ); // Example: navigate back to the previous screen
          },
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    // Handle button tap for "Total portfolio"
                    print("Total portfolio tapped");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.blueGrey,
                      width: 160,
                      height: 150,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.attach_money,
                              size: 50, color: Colors.white),
                          SizedBox(height: 8),
                          Text(
                            "Total portfolio",
                            textScaleFactor: 1.3,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Handle button tap for "Cash available"
                    print("Cash available tapped");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.blueGrey,
                      width: 160,
                      height: 150,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.money,
                            size: 50,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Cash available",
                            textScaleFactor: 1.3,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Handle button tap for "Cash available"
                    print("Adjust balance tapped");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.blueGrey,
                      width: 160,
                      height: 150,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.adjust,
                            size: 50,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Adjust balance",
                            textScaleFactor: 1.3,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const PieChart(
                  dataMap: {
                    "Asset": 12,
                    "Liabialiaties": 23,
                  },
                ),
                const PieChart(
                  dataMap: {
                    "Income": 20,
                    "Expenditure": 45,
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
