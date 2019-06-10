import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class SparkLine extends StatefulWidget {

  final bool enableMaxMin;
  final String labelPrefix;
  final List<double> initData;
  SparkLine({@required this.initData, Key key, this.enableMaxMin = false, this.labelPrefix = '€'}) : super(key: key);

  @override
  SparkLineWidgetState createState() => SparkLineWidgetState();
}

class SparkLineWidgetState extends State<SparkLine> {

  List<double> _data;

  void onRefresh(List<double> data) {
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        child: new Sparkline(
        data: (_data == null)?widget.initData:_data,
        lineColor: const Color.fromRGBO(62, 219, 181, 1),
        lineWidth: 1.0,
        pointsMode: PointsMode.none,
        fillMode: FillMode.below,
        enableMaxMin: widget.enableMaxMin,
        labelPrefix: widget.labelPrefix,
        fillGradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Color.fromRGBO(114, 239, 219, 0.13),
            Color.fromRGBO(62, 219, 181, 0)
          ],
        ),
    )));
  }
}
