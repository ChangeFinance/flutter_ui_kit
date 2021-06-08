import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';

typedef Callback = void Function();

class NewsCard extends StatelessWidget {
  final String? title;
  final String? image;
  final String? source;
  final int? time;
  final Callback? onClick;

  const NewsCard(
      {this.title = '',
      this.image,
      this.source = '',
      this.time = 0,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onClick,
        child: Container(
            decoration: const BoxDecoration(
                border: const Border(
                    bottom:
                        BorderSide(width: 1.0, color: AppColor.lightestGrey))),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(source!, style: AppText.newsSourceTime),
                        const Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              '●',
                              style: TextStyle(fontSize: 6),
                            )),
                        Text(DateUtils.formatTime(time!),
                            style: AppText.newsSourceTime)
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                            child: Container(
                                height: 60,
                                child: Text(title!,
                                    style: AppText.body1.copyWith(height: 1.2),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis))),
                        const SizedBox(width: 32),
                        Container(
                            width: 60,
                            height: 60,
                            decoration: image == null
                                ? null
                                : BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    image: DecorationImage(
                                        image: NetworkImage(image!),
                                        fit: BoxFit.fitHeight)))
                      ],
                    )
                  ],
                ))));
  }
}

class DateUtils {
  static String formatTime(int time) {
    final num seconds = DateTime.now().millisecondsSinceEpoch / 1000 - time;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;
    String result;
    if (seconds < 90)
      result = 'Now';
    else if (minutes < 50)
      result = '${minutes.round()}m';
    else if (hours < 24)
      result = '${hours.round()}h';
    else if (hours < 48)
      result = '${days.round()}d';
    else
      result = '${days.round()}d';

    return result;
  }
}
