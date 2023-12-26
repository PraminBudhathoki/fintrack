import 'package:flutter/material.dart';

class Asset extends StatelessWidget {
  const Asset({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Aicon(),
    );
  }
}

class Aicon extends StatefulWidget {
  const Aicon({super.key});

  @override
  State<Aicon> createState() => _AiconState();
}

class _AiconState extends State<Aicon> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();

    // here, Scaffold.of(context) returns null
    return Scaffold(
        //appBar: AppBar(title: const Text('Demo')),
        body: Builder(
      builder: (BuildContext context) {
        return ListView(
          padding: const EdgeInsets.all(6),
          children: [
            const Padding(
              padding: EdgeInsets.all(6),
              child: ListTile(
                tileColor: Colors.black26,
                title: Text("Asset Details"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text("Select Category", style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Select Category',
                  suffixIcon: DropdownButton(
                    items: const [
                      DropdownMenuItem<String>(
                        value: "One",
                        child: Text("Real State"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Two",
                        child: Text("Vehicles"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Three",
                        child: Text("Cash"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Four",
                        child: Text("Gadgets"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Five",
                        child: Text("Investment"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Six",
                        child: Text("Unpaid amount"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Seven",
                        child: Text("Others"),
                      ),
                    ],
                    onChanged: (String? value) {},
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Text(
                    "Add category",
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text("Amount", style: TextStyle(fontSize: 20)),
            ),
            const Padding(
              padding: EdgeInsets.all(6.0),
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter amount',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(6.0),
              child: Text("Note", style: TextStyle(fontSize: 20)),
            ),
            const Padding(
              padding: EdgeInsets.all(6.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Notes or Remarks',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                child: const Text("Select Date"),
              ),
            ),
          ],
        );
      },
    ));
  }
}
