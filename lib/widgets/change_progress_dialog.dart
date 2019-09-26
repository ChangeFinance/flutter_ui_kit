import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


bool _isShowing = false;
BuildContext _context, _dismissingContext;
bool _barrierDismissible = true, _showLogs = false;

double _dialogElevation = 8.0, _borderRadius = 8.0;
Color _backgroundColor = Colors.white;
Curve _insetAnimCurve = Curves.easeInOut;

Widget _progressWidget = Image.asset(
  'assets/double_ring_loading_io.gif',
  package: 'progress_dialog',
);

class ChangeProgressDialog {
  _Body _dialog;

  ChangeProgressDialog(BuildContext context,
      {bool isDismissible, bool showLogs}) {
    _context = context;
    _barrierDismissible = isDismissible ?? true;
    _showLogs = showLogs ?? false;
  }

  void style(
      {double progress,
      double maxProgress,
      Widget progressWidget,
      Color backgroundColor,
      double elevation,
      double borderRadius,
      Curve insetAnimCurve}) {
    if (_isShowing)
      return;

    _progressWidget = progressWidget ?? _progressWidget;
    _backgroundColor = backgroundColor ?? _backgroundColor;
    _dialogElevation = elevation ?? _dialogElevation;
    _borderRadius = borderRadius ?? _borderRadius;
    _insetAnimCurve = insetAnimCurve ?? _insetAnimCurve;
  }

  void update(
      {double progress,
      double maxProgress,
      Widget progressWidget,}) {

    _progressWidget = progressWidget ?? _progressWidget;

    if (_isShowing)
      _dialog.update();
  }

  bool isShowing() {
    return _isShowing;
  }

  void dismiss() {
    if (_isShowing) {
      try {
        _isShowing = false;
        if (Navigator.of(_dismissingContext).canPop()) {
          Navigator.of(_dismissingContext).pop();
          if (_showLogs)
            debugPrint('ProgressDialog dismissed');
        } else {
          if (_showLogs)
            debugPrint('Cant pop ProgressDialog');
        }
      } on Exception catch (_) {}
    } else {
      if (_showLogs)
        debugPrint('ProgressDialog already dismissed');
    }
  }

  Future<bool> hide() {
    if (_isShowing) {
      try {
        _isShowing = false;
        Navigator.of(_dismissingContext).pop(true);
        if (_showLogs)
          debugPrint('ProgressDialog dismissed');
        return Future.value(true);
      } on Exception catch (_) {
        return Future.value(false);
      }
    } else {
      if (_showLogs)
        debugPrint('ProgressDialog already dismissed');
      return Future.value(false);
    }
  }

  void show() {
    if (!_isShowing) {
      _dialog = new _Body();
      _isShowing = true;

      if (_showLogs)
        debugPrint('ProgressDialog shown');

      showDialog<dynamic>(
        context: _context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _dismissingContext = context;
          return WillPopScope(
            onWillPop: () {
              return Future.value(_barrierDismissible);
            },
            child: Dialog(
                backgroundColor: _backgroundColor,
                insetAnimationCurve: _insetAnimCurve,
                insetAnimationDuration: Duration(milliseconds: 100),
                elevation: _dialogElevation,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(_borderRadius))),
                child: _dialog),
          );
        },
      );
    } else {
      if (_showLogs)
        debugPrint('ProgressDialog already shown/showing');
    }
  }
}

class _Body extends StatefulWidget {
  final _BodyState _dialog = _BodyState();

  void update() {
    _dialog.update();
  }

  @override
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _BodyState extends State<_Body> {
  void update() {
    setState(() {});
  }

  @override
  void dispose() {
    _isShowing = false;
    if (_showLogs)
      debugPrint('ProgressDialog dismissed by back button');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 0,
      child: SizedBox(
        width: 60.0,
        height: 60.0,
        child: _progressWidget,
      ),
    );
  }
}
