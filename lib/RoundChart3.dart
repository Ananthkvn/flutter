import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RoundChart3 extends StatefulWidget {
  const RoundChart3({Key? key}) : super(key: key);

  @override
  State<RoundChart3> createState() => _RoundChart3State();
}

class _RoundChart3State extends State<RoundChart3> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehaviour;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehaviour = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCircularChart(
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehaviour,
        series: <CircularSeries>[
          //pieSeries
          DoughnutSeries<GDPData, String>(
              dataSource: _chartData,
              xValueMapper: (GDPData data, _) => data.continent,
              yValueMapper: (GDPData data, _) => data.gdp,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true)
        ],
      ),
    ));
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Oceania', 1600),
      GDPData('Africa', 2490),
      GDPData('S America', 2400),
      GDPData('Europe', 24690),
      GDPData('N America', 24880),
      GDPData('Asia', 34390),
    ];

    return chartData;
  }
}

class GDPData {
  final String continent;
  final int gdp;

  GDPData(this.continent, this.gdp);
}
