
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {

  late List<charts.Series> seriesList;

  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();

    final desktopSalesData = [
      Sales('2019', random.nextInt(100)),
      Sales('2020', random.nextInt(100)),
      Sales('2021', random.nextInt(100)),
      Sales('2022', random.nextInt(100)),
      Sales('2023', random.nextInt(100)),
    ];

    final tabletSalesData = [
      Sales('2019', random.nextInt(100)),
      Sales('2020', random.nextInt(100)),
      Sales('2021', random.nextInt(100)),
      Sales('2022', random.nextInt(100)),
      Sales('2023', random.nextInt(100)),
    ];

    final mobileSalesData = [
      Sales('2019', random.nextInt(100)),
      Sales('2020', random.nextInt(100)),
      Sales('2021', random.nextInt(100)),
      Sales('2022', random.nextInt(100)),
      Sales('2023', random.nextInt(100)),
    ];

    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: desktopSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
      ),
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: tabletSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.green.shadeDefault;
        },
      ),
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: mobileSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.teal.shadeDefault;
        },
      )
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: false,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
      // domainAxis: charts.OrdinalAxisSpec(
      //   renderSpec: charts.NoneRenderSpec(),
      // ),
    );
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chart Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: barChart(),
      ),
    );
  }
}


class Sales {
  final String year;
  final int sales;

  Sales(this.year, this.sales);
}