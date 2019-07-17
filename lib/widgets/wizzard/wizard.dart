import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/widgets/layout/app_bar.dart';
import 'package:flutter_ui_kit/widgets/layout/page_template.dart';
import 'package:flutter_ui_kit/widgets/wizzard/wizard_binder.dart';

import '../filled_button.dart';

class Wizard extends StatefulWidget {
  
  final WizardBinder binder;
  final Widget intoWidget;
  final List<Widget> wizardPages;
  final Widget outroWidget;

  const Wizard({this.intoWidget, this.wizardPages, this.outroWidget, this.binder});

  @override
  _WizardState createState() => _WizardState(intoWidget, wizardPages, outroWidget, binder);
}

class _WizardState extends State<Wizard> {
  
  WizardBinder binder;
  int currentPage = -1;

  Widget intoWidget;
  List<Widget> wizardPages;
  Widget outroWidget;

  Widget leadingWidget = const BackButton();
  List<Widget> tailingWidget;

  _WizardState(this.intoWidget, this.wizardPages, this.outroWidget, this.binder);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      appBar: MainAppBar(
          implyLeading: leadingWidget != null,
          leadingWidget: leadingWidget,
          tailingWidget: tailingWidget),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(flex: 1, child: _getCurrentPage()),
            FilledButton(_callToActionText(), fullWidth: true, onPressed: () {
              setState(() {
                _callToActionEvent();
                currentPage++;
              });
            })
          ],
        ),
      ),
    );
  }

  void _callToActionEvent() {
    if (currentPage < 0) {
      return binder.onStart();
    } else if(currentPage >= wizardPages.length) {
      return binder.onEnd();
    } else {
      binder.onNext(currentPage);
    }
  }

  String _callToActionText() {
    final text =  binder.getCallToAction(currentPage);
    if (text == null) {
      if (currentPage < 0) {
        return 'Start Started';
      } else if(currentPage >= wizardPages.length) {
        return 'End';
      } else {
        return 'Next';
      }
    } else {
      return text;
    }
  }

  Widget _getCurrentPage() {
    if (currentPage < 0) {
      debugPrint('Showing intro wizard');
      return intoWidget;
    } else if(currentPage >= wizardPages.length) {
      debugPrint('Showing outro wizard');
      return outroWidget;
    } else {
      debugPrint('Showing wizard page[$currentPage]');
      return wizardPages[currentPage];
    }
  }
}
