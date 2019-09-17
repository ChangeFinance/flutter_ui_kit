import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../color.dart';
import '../text.dart';

class SecurityInfoBox extends StatelessWidget {
  final String assetName;
  final String infoHeader;
  final String infoBody;

  const SecurityInfoBox(this.assetName, this.infoHeader, this.infoBody);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        child:Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
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
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(infoHeader,
                              style: AppText.body3,)
                        ),
                      ),
                      Text(infoBody,
                        style: AppText.body3SemiGray,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 15,),
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
