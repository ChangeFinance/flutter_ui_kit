import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/color.dart';
import 'package:flutter_ui_kit/widgets/buttons/outlined_button.dart';
import 'package:flutter_ui_kit/widgets/buttons/text_button.dart';

class SwipeConfirmation extends StatelessWidget {
  final Animation<double> labelTranslation;
  final Animation<double> buttonTranslation;
  final Animation<double> opacity;
  final String labelText;
  final String labelTitle;
  final Widget labelIcon;
  final String primaryButtonText;
  final Function primaryButtonAction;
  final bool primaryButtonEnabled;
  final String secondaryButtonText;
  final Function secondaryButtonAction;

  const SwipeConfirmation({
    @required this.labelTranslation,
    @required this.buttonTranslation,
    @required this.opacity,
    Key key,
    this.labelText,
    this.labelTitle,
    this.labelIcon,
    this.primaryButtonText = 'Done',
    this.primaryButtonAction,
    this.primaryButtonEnabled = true,
    this.secondaryButtonText,
    this.secondaryButtonAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Opacity(
        opacity: opacity.value,
        child: Stack(
          children: <Widget>[
            _buildLabels(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildLabels() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          labelIcon ?? Container(),
          const SizedBox(height: 20),
          Transform.translate(
            offset: Offset(0, labelTranslation.value),
            child: Column(
              children: <Widget>[
                _labelTitle(),
                const SizedBox(height: 10),
                _labelText(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _labelTitle() => Text(
        labelTitle,
        style: const TextStyle(
          color: AppColor.ltDeepWhite,
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      );

  Widget _labelText() => Text(
        labelText,
        style: const TextStyle(color: AppColor.ltDeepWhite, fontSize: 16),
        textAlign: TextAlign.center,
      );

  Widget _buildButtons() {
    final buttons = <Widget>[];
    if (primaryButtonText != null && primaryButtonText != '') {
      buttons.add(Opacity(
        opacity: primaryButtonEnabled ? 1.0 : 0.5,
        child: BorderedButton(
          primaryButtonText,
          onPressed: primaryButtonEnabled ? primaryButtonAction : null,
          fullWidth: true,
          narrow: false,
          alt: true,
        ),
      ));
    }
    if (secondaryButtonText != null && secondaryButtonText != '') {
      buttons.add(PlainButton(
        secondaryButtonText,
        onPressed: secondaryButtonAction,
        alt: true,
      ));
    }

    return Positioned(
      bottom: 20 + -buttonTranslation.value,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: buttons,
        ),
      ),
    );
  }
}
