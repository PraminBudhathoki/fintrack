import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'drawer.dart';

class One extends StatelessWidget {
  const One({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const value = 100;

    return Scaffold(
      drawer: const Cdrawer(),
      appBar: AppBar(
        title: const Text(
          "Accounts",
          style: TextStyle(color: Colors.white),
        ),
        titleSpacing: 00.0,
        backgroundColor: Colors.purple,
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
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          // Handle button tap for "Total portfolio"
                          print("Total portfolio tapped");
                        },
                        child: Container(
                          color: Colors.blueGrey,
                          width: 150,
                          height: 140,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.attach_money,
                                  size: 50, color: Colors.white),
                              SizedBox(height: 8),
                              Text(
                                "Income : ",
                                textScaleFactor: 1.3,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Rs$value",
                                textScaleFactor: 1.3,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          // Handle button tap for "Cash available"
                          print("Cash available tapped");
                        },
                        child: Container(
                          color: Colors.blueGrey,
                          width: 150,
                          height: 140,
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
                                "Expenses :",
                                textScaleFactor: 1.3,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Rs$value",
                                textScaleFactor: 1.3,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          // Handle button tap for "Total portfolio"
                          print("Total portfolio tapped");
                        },
                        child: Container(
                          color: Colors.blueGrey,
                          width: 150,
                          height: 140,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.attach_money,
                                  size: 50, color: Colors.white),
                              SizedBox(height: 8),
                              Text(
                                "Balance : ",
                                textScaleFactor: 1.3,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Rs$value",
                                textScaleFactor: 1.3,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          // Handle button tap for "Cash available"
                          print("Cash available tapped");
                        },
                        child: Container(
                          color: Colors.blueGrey,
                          width: 150,
                          height: 140,
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
                                "Total balance :",
                                textScaleFactor: 1.3,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Rs$value",
                                textScaleFactor: 1.3,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
