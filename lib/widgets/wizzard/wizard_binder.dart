
class WizardBinder {

  Function? callToAction;
  Function? start;
  Function? next;
  Function? end;

  String? getCallToAction(int index) {
    if (callToAction == null) {
      return null;
    }
    return callToAction!(index);
  }

  void onStart() {
    if (start != null) {
      start!();
    }
  }

  bool? onNext(int index) {
    if (next != null) {
      return next!(index);
    } else {
      return true;
    }

  }

  void onEnd() {
    if (end != null) {
      end!();
    }
  }
}