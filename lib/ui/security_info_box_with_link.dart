import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/text.dart';
import 'package:url_launcher/url_launcher.dart';

class SecurityInfoBoxWithLink extends StatelessWidget {
  final String assetName;
  final String infoHeader;
  final String infoBody;
  final String infoLink;
  final String url;

  const SecurityInfoBoxWithLink(this.assetName, this.infoHeader, this.infoBody, {this.infoLink, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        child:Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Align(alignment: Alignment.topLeft, child:SvgPicture.asset(
                  assetName,
                  width: 24.0,
                  height: 24.0,
                )),
              ),
              Flexible(
                child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(infoHeader,
                              style: AppText.body3,)
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: new TextSpan(
                          text: infoBody,
                          style: AppText.body3SemiGray,
                          children: [
                            new TextSpan(
                                text: infoLink,
                                style: const TextStyle(color: AppColor.green),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () async {
                                    debugPrint('Help Center tapped');
                                    if (await canLaunch(url)) {
                                      debugPrint('Launching url');
                                      await launch(url);
                                    } else {
                                      debugPrint('Could not launch url');
                                    }
                                  })
                          ],
                        ),
                      ),
                    ]
                ),
              )
            ],
          ),
        ),
        decoration: const BoxDecoration(
            color: AppColor.veryLightGrey,
            border: null,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            boxShadow: null
        ),
      ),
    );
  }
}