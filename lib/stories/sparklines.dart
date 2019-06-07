import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/periodline.dart';
import 'package:flutter_ui_kit/widgets/sparkline.dart';

class SparkLines extends StatefulWidget {

  @override
  _SparkLinesWidgetState createState() => _SparkLinesWidgetState();

}

class _SparkLinesWidgetState extends State<SparkLines> {
  final GlobalKey<SparkLineWidgetState> _keySpark = GlobalKey();

  void onChangeTextField(String value) {
    _keySpark.currentState.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width ,
        child: SingleChildScrollView(
            child: ExpandableStory(
                title: 'Spark Line 1',
                child: PropsExplorer(
                    initialProps: const <String, dynamic>{
                    },
                    formBuilder: (context, props, updateProp) {
                      return ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: <Widget>[]
                      );
                    },
                    widgetBuilder: (context, props) {
                      return Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                            height:180.0,
                            child: Center(
                                child: SparkLine(key: _keySpark)
                            )
                        ),
                        Container(
                            height:35.0,
                            child: Center(
                              child: PeriodLine(onChange: onChangeTextField),
                            )
                        ),
                      ]);
                    }
                )
            )
        )
    );
  }
}
