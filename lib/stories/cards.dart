import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/story_book/expandable_story.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/double_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/int_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/prop_updater/string_prop_updater.dart';
import 'package:flutter_ui_kit/story_book/props_explorer.dart';
import 'package:flutter_ui_kit/widgets/big_asset_card.dart';
import 'package:flutter_ui_kit/widgets/buttons/text_button.dart';
import 'package:flutter_ui_kit/widgets/card.dart';
import 'package:flutter_ui_kit/widgets/news/news_card.dart';

class AppCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _emptyCardStory(),
            _dialogCardStory(),
            _newsCardStory(),
            _bigAssetCardStory(),
          ],
        ),
      ),
    );
  }

  Widget _emptyCardStory() {
    return ExpandableStory(
      title: 'Empty Card',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'elevation': 2.0,
          'margin': 15.0,
          'borderRadius': 4.0,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              DoublePropUpdater(props: props, updateProp: updateProp, propKey: 'elevation', min: 1, max: 4),
              DoublePropUpdater(props: props, updateProp: updateProp, propKey: 'margin', min: 0, max: 20),
              DoublePropUpdater(props: props, updateProp: updateProp, propKey: 'borderRadius', min: 0, max: 20)
            ],
          );
        },
        widgetBuilder: (context, props) {
          final double elevation = props['elevation'];
          final double margin = props['margin'];
          final double borderRadius = props['borderRadius'];

          return AppCard(
            color: AppColor.deepWhite,
            elevation: elevation.toInt(),
            margin: EdgeInsets.all(margin),
            borderRadius: borderRadius,
            child: Container(
              width: 140,
              height: 140,
            ),
          );
        },
      ),
    );
  }

  Widget _dialogCardStory() {
    return ExpandableStory(
      title: 'Sample Card',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'elevation': 2.0,
          'margin': 15.0,
          'borderRadius': 4.0,
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              DoublePropUpdater(props: props, updateProp: updateProp, propKey: 'elevation', min: 1, max: 4),
              DoublePropUpdater(props: props, updateProp: updateProp, propKey: 'margin', min: 0, max: 20),
              DoublePropUpdater(props: props, updateProp: updateProp, propKey: 'borderRadius', min: 0, max: 20)
            ],
          );
        },
        widgetBuilder: (context, props) {
          final double elevation = props['elevation'];
          final double margin = props['margin'];
          final double borderRadius = props['borderRadius'];

          return AppCard(
            color: AppColor.deepWhite,
            elevation: elevation.toInt(),
            margin: EdgeInsets.all(margin),
            borderRadius: borderRadius,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('The Enchanted Nightingale'),
                  subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                ButtonBarTheme(
                  child: ButtonBar(
                    children: <Widget>[
                      ChgTextButton(
                        'BUY TICKETS',
                        onPressed: () {},
                      ),
                      ChgTextButton(
                        'LISTEN',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _newsCardStory() {
    return ExpandableStory(
      title: 'News Card',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{
          'source': 'TheBlock',
          'time': 0,
          'title':
              'Coinbase Challenger In Europe Change Launches Its Own Equity-Like Token - Coinbase Challenger In Europe Change Launches Its Own Equity-Like Token',
          'image':
              'https://images.cointelegraph.com/images/1480_aHR0cHM6Ly9zMy5jb2ludGVsZWdyYXBoLmNvbS9zdG9yYWdlL3VwbG9hZHMvdmlldy80NjljNTI4N2Y0Yjc5NDMxOGRiNGQzMjQ3MGVlNjUzMi5qcGVn.jpeg'
        },
        formBuilder: (context, props, updateProp) {
          return ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              StringPropUpdater(props: props, updateProp: updateProp, propKey: 'source'),
              IntPropUpdater(props: props, updateProp: updateProp, propKey: 'time'),
              StringPropUpdater(props: props, updateProp: updateProp, propKey: 'title'),
              StringPropUpdater(props: props, updateProp: updateProp, propKey: 'image')
            ],
          );
        },
        widgetBuilder: (context, props) {
          final String source = props['source'];
          final int time = props['time'];
          final String title = props['title'];
          final String image = props['image'];

          return NewsCard(title: title, image: image, source: source, time: time);
        },
      ),
    );
  }

  Widget _bigAssetCardStory() {
    return ExpandableStory(
      title: 'Big Asset Card',
      child: PropsExplorer(
        initialProps: const <String, dynamic>{},
        formBuilder: (context, props, updateProp) {
          return Container();
        },
        widgetBuilder: (context, props) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: BigAssetCard(
                  title: 'Earn',
                  icon: const Icon(Icons.timeline, color: AppColor.green),
                  description: '2.00% APY*',
                  tag: 'COMING SOON',
                  tagIsBadge: true,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: BigAssetCard(
                  title: 'Spend',
                  icon: const Icon(Icons.credit_card, color: AppColor.green),
                  description: '€110,546.00',
                  tag: 'Debit card, ATM',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
