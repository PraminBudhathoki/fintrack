import 'package:flutter/material.dart';

import '../../assetLiabialities/assetliabialiaties.dart';
import '../../authentication/views/login/login.dart';
import '../../incomeExpenses/incomeexpenses.dart';
import '../../target/views/targetPlanner.dart';
import 'accounts1.dart';
import 'calculator.dart';
import 'contactus.dart';
import 'history.dart';
import 'info.dart';

class Cdrawer extends StatelessWidget {
  const Cdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      //surfaceTintColor: Colors.white,
      child: ListView(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                height: 80,
                image: AssetImage("assets/logos/F.png"),
              ),
              Text(
                "  Aabiskar Bhattarai",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: PhysicalModel(
              color: Colors.blueGrey,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: InkWell(
                onTap: () {
                  // Navigate to a new screen when the section is tapped
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const One(),
                    ),
                  );
                },
                child: const SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_balance,
                        color: Colors.white,
                        size: 45,
                      ),
                      Text("   Accounts",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: PhysicalModel(
              color: Colors.blueGrey,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: InkWell(
                onTap: () {
                  // Navigate to a new screen when the section is tapped
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Two(),
                    ),
                  );
                },
                child: const SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Colors.white,
                        size: 45,
                      ),
                      Text(
                        "   Asset and Liabilities",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: PhysicalModel(
              color: Colors.blueGrey,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: InkWell(
                onTap: () {
                  // Navigate to a new screen when the section is tapped
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Three(),
                    ),
                  );
                },
                child: const SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Colors.white,
                        size: 45,
                      ),
                      Text("   Income/Expenses",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: PhysicalModel(
              color: Colors.blueGrey,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: InkWell(
                onTap: () {
                  // Navigate to a new screen when the section is tapped
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Four(),
                    ),
                  );
                },
                child: const SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.calculate,
                        color: Colors.white,
                        size: 45,
                      ),
                      Text('   Loan Calculator',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: PhysicalModel(
              color: Colors.blueGrey,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: InkWell(
                onTap: () {
                  // Navigate to a new screen when the section is tapped
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TargetPlanner(),
                    ),
                  );
                },
                child: const SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.flag,
                        color: Colors.white,
                        size: 45,
                      ),
                      Text('   Target',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: PhysicalModel(
              color: Colors.blueGrey,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: InkWell(
                onTap: () {
                  // Navigate to a new screen when the section is tapped
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => History(),
                    ),
                  );
                },
                child: const SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: Colors.white,
                        size: 45,
                      ),
                      Text('   History',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: PhysicalModel(
              elevation: 10,
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: InkWell(
                onTap: () {
                  // Navigate to a new screen when the section is tapped
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Contact(),
                    ),
                  );
                },
                child: const SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.black54,
                        size: 45,
                      ),
                      Text('   Contact us',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black87)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: PhysicalModel(
              elevation: 10,
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: InkWell(
                onTap: () {
                  // Navigate to a new screen when the section is tapped
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Info(),
                    ),
                  );
                },
                child: const SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.black54,
                        size: 45,
                      ),
                      Text('   Information',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black87)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: PhysicalModel(
              elevation: 10,
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: InkWell(
                onTap: () {
                  // Navigate to a new screen when the section is tapped
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.black54,
                        size: 45,
                      ),
                      Text('   Logout',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black87)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
