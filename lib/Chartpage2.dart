import 'package:flutter/material.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';

class Chartpage2 extends StatefulWidget {
  const Chartpage2({Key? key}) : super(key: key);

  @override
  State<Chartpage2> createState() => _Chartpage2State();
}

class _Chartpage2State extends State<Chartpage2> {
  List<SalesDetails> sales = [];
  List<String> months = ['April', 'May', 'June', 'July', 'Aug'];
  List<int> salesCounts = [15, 30, 75, 10, 25, 27];
  void loadSalesData() {
    for (int i = 0; i < months.length; i++) {
      sales.add(SalesDetails(months[i], salesCounts[i]));
    }
    // sales = [
    //   SalesDetails('January', 120),
    //   SalesDetails('Feb', 10),
    //   SalesDetails('March', 120),
    //   SalesDetails('april', 200),
    //   SalesDetails('May', 100),
    //   SalesDetails('June', 150),
    //   SalesDetails('July', 20),
    //   SalesDetails('August', 40),
    //   SalesDetails('September', 100),
    // ];
  }

  @override
  void initState() {
    loadSalesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          //primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 30),
          series: <ChartSeries>[
            ColumnSeries<SalesDetails, String>(
              dataSource: sales,
              xValueMapper: (SalesDetails details, _) => details.month,
              yValueMapper: (SalesDetails details, _) => details.salesCount,
              color: Colors.green,
              isTrackVisible: true,
              borderRadius: BorderRadius.circular(10),
            ),

            // LineSeries<SalesDetails, String>(
            //   dataSource: sales,
            //   xValueMapper: (SalesDetails details, _) => details.month,
            //   yValueMapper: (SalesDetails details, _) => details.salesCount,
            // )
            LineSeries(
                dataSource: sales,
                xValueMapper: (details, _) => details.month,
                yValueMapper: (details, _) => details.salesCount)
          ],
        ),
      ),
    );
  }
}

class SalesDetails {
  final String month;
  final int salesCount;

  SalesDetails(this.month, this.salesCount);
}
