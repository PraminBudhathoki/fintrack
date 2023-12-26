import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Chart(),
    );
  }
}

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  Map<String, double> dataMap = {
    "Asset": 0,
    "Liabialiaties": 0,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PieChart(
          dataMap: dataMap,
          chartRadius: MediaQuery.of(context).size.width / 3,
          legendOptions: const LegendOptions(
            legendPosition: LegendPosition.bottom,
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValuesInPercentage: true,
          ),
        ),
        // PieChart(
        //   dataMap: dataMap,
        //   chartRadius: MediaQuery.of(context).size.width / 3,
        //   legendOptions: const LegendOptions(
        //     legendPosition: LegendPosition.bottom,
        //   ),
        //   chartValuesOptions: const ChartValuesOptions(
        //     showChartValuesInPercentage: true,
        //   ),
        // ),
      ],
    );
  }
}
