import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Iicon(),
    );
  }
}

class Iicon extends StatefulWidget {
  const Iicon({super.key});

  @override
  State<Iicon> createState() => _IiconState();
}

class _IiconState extends State<Iicon> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 18,
      crossAxisSpacing: 18,
      crossAxisCount: 4,
      padding: const EdgeInsets.all(15),
      children: [
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.wallet, size: 55, color: Colors.blueGrey),
                Text("Salary",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              _showBottomSheet(context);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black87,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                FaIcon(FontAwesomeIcons.moneyCheckDollar,
                    size: 55, color: Colors.blueGrey),
                Text("Refunds",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              _showBottomSheet(context);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.card_giftcard, size: 55, color: Colors.blueGrey),
                Text("Grants",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              _showBottomSheet(context);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black87,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                FaIcon(FontAwesomeIcons.piggyBank,
                    size: 50, color: Colors.blueGrey),
                //Icon(Icons., size: 75, color: Colors.blueGrey),
                Text("Investment",
                    style: TextStyle(
                        fontFamily: AutofillHints.addressCity,
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              _showBottomSheet(context);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.home_work_outlined,
                    size: 55, color: Colors.blueGrey),
                Text("Rental",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              _showBottomSheet(context);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black87,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.more_rounded, size: 55, color: Colors.blueGrey),
                Text("Lottery",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              _showBottomSheet(context);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                FaIcon(FontAwesomeIcons.award,
                    size: 55, color: Colors.blueGrey),
                Text("Awards",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              _showBottomSheet(context);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black87,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                // FaIcon(FontAwesomeIcons.monero,
                //     size: 75, color: Colors.blueGrey),
                Icon(
                  Icons.moving_sharp,
                  size: 55,
                  color: Colors.blueGrey,
                ),
                Text("Dividends",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              _showBottomSheet(context);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                FaIcon(FontAwesomeIcons.tags, size: 55, color: Colors.blueGrey),
                //Icon(Icons.fmd_good_sharp, size: 75),
                Text("Sale",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              _showBottomSheet(context);
            },
          ),
        ),
        PhysicalModel(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.black87,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: InkWell(
            child: const Column(
              children: [
                Icon(Icons.add, size: 55, color: Colors.blueGrey),
                Text("Others",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none)),
              ],
            ),
            onTap: () {
              _showBottomSheet(context);
            },
          ),
        ),
      ],
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      //use this controller to get what the user typed.
      final dataToPass = TextEditingController();
      final textController2 = TextEditingController();
      //DateTime selectedDeadline = DateTime.now();
      DateTime selectedDate = DateTime.now();

      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: dataToPass,
                autofocus: true,
                keyboardType: TextInputType.number,

                //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_box_rounded),
                  ),
                  hintStyle: const TextStyle(fontSize: 20),
                  border: const OutlineInputBorder(),
                  hintText: 'Enter amount.',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textController2,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter note',
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
              ),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2121),
                );
                if (pickedDate != null && pickedDate != selectedDate) {
                  selectedDate = pickedDate;
                }
              },
              child: const Text(
                "Select Date",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    },
  );
}
