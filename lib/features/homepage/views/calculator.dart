import 'package:flutter/material.dart';
import 'package:fintrack/features/homepage/views/homepage.dart';

class Four extends StatefulWidget {
  final String title;

  const Four({super.key, required this.title});

  @override
  State<Four> createState() => _CalculatorState();
}

class _CalculatorState extends State<Four> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  late double interest = 0;
  late double total = 0;

  void calculation() {
    final calinterest = (double.parse(_controller1.text) *
            double.parse(_controller2.text) *
            double.parse(_controller3.text)) /
        100;
    setState(() {
      interest = calinterest;
      total = int.parse(_controller1.text) + interest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.blue,
        elevation: 10,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
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
      ),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[100],
        child: Column(children: [
          Container(
            height: 170,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Loan",
                        style: TextStyle(fontSize: 35, color: Colors.white),
                        //style: GoogleFonts.robotoMono(fontSize: 35, color: Colors.white),
                      ),
                      Text(
                        "Calculator",
                        style: TextStyle(fontSize: 35, color: Colors.white),
                        //style: GoogleFonts.robotoMono(fontSize: 35, color: Colors.white),
                      ),
                    ]),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                inputForm(
                    title: "Loan Amount:",
                    controller: _controller1,
                    hinttest: "e.g 2000"),
                inputForm(
                    title: "Annual Interest Rate(%) :",
                    controller: _controller2,
                    hinttest: "e.g 3"),
                inputForm(
                    title: "Period(in year):",
                    controller: _controller3,
                    hinttest: "e.g 3"),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    calculation();
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        "CALCULATE",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Result:",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Interest: RS ${interest.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Total: RS ${total.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget inputForm(
      {required String title,
      required TextEditingController controller,
      required String hinttest}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hinttest),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
