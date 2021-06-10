import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class StoryBook extends StatelessWidget {
  final List<Widget> pages;
  final String? title;

  StoryBook({
    required this.pages,
    this.title,
  })  : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title ?? 'Story Book')),
        body: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) =>
              _pageOpener(context, pages[index]),
          itemCount: pages.length,
        ));
  }

  ListTile _pageOpener(BuildContext context, Widget page) {
    final title = _getTitle(page);
    final titleWidget = Text(title);
    return ListTile(
        trailing: const Icon(Icons.arrow_right),
        title: titleWidget,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<Null>(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(title: titleWidget),
                body: page,
              );
            }),
          );
        });
  }

  String _getTitle(Widget page) =>
      ReCase(page.runtimeType.toString()).titleCase;
}
