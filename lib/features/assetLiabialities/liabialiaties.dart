import 'package:flutter/material.dart';

class Liabialiaties extends StatelessWidget {
  const Liabialiaties({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Licon(),
    );
  }
}

class Licon extends StatefulWidget {
  const Licon({super.key});

  @override
  State<Licon> createState() => _LiconState();
}

class _LiconState extends State<Licon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: const Text('Demo')),
        body: Builder(
      builder: (BuildContext context) {
        DateTime selectedDate = DateTime.now();
        return ListView(
          padding: const EdgeInsets.all(6),
          children: [
            const Padding(
              padding: EdgeInsets.all(6),
              child: ListTile(
                tileColor: Colors.black26,
                title: Text("Liabialiaties Details"),
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
                        child: Text("Loan"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Two",
                        child: Text("Advance income"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Three",
                        child: Text("Unpaid expenses"),
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
                    style: TextStyle(color: Colors.purple),
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
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.purple)),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                child: const Text(
                  "Select Date",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    ));
  }
}
