library stylish_dialog;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stylish_dialog/src/stylish_dialog_ui.dart';

// export 'src/stylish_dialogs.dart';

class StylishDialog {
  static const int NORMAL = 1;
  static const int PROGRESS = 2;
  static const int SUCCESS = 3;
  static const int INFO = 4;
  static const int WARNING = 5;
  static const int ERROR = 6;

  final BuildContext context;
  final int? alertType;
  String? titleText;
  String? contentText;
  String? confirmText;
  String? cancelText;
  bool dismissOnTouchOutside;
  VoidCallback? confirmPressEvent;
  VoidCallback? cancelPressEvent;

  StylishDialog({
    required this.context,
    required this.alertType,
    this.titleText,
    this.contentText,
    this.confirmText,
    this.cancelText,
    this.confirmPressEvent,
    this.cancelPressEvent,
    this.dismissOnTouchOutside = true,
  });

  Future show() => showDialog(
        context: this.context,
        barrierDismissible: this.dismissOnTouchOutside,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            stateSetter = setState;
            return _buildDialog;
          });
        },
      );

  Widget get _buildDialog =>
      WillPopScope(onWillPop: _onWillPop, child: _buildDialogUI());

  Future<bool> _onWillPop() async => this.dismissOnTouchOutside;

  dismiss({bool rootNavigator = true}) {
    Navigator.of(this.context, rootNavigator: rootNavigator).pop();
  }

  late StateSetter stateSetter;
  int changeAlert = 9;

  changeAlertType(
      {required int alertType,
      String? titleText,
      String? contentText,
      String? confirmText,
      String? cancelText,
      VoidCallback? confirmPressEvent,
      VoidCallback? cancelPressEvent}) {
    stateSetter(() {
      this.titleText = titleText;
      this.contentText = contentText;
      this.confirmText = confirmText;
      this.cancelText = cancelText;
      this.confirmPressEvent = confirmPressEvent;
      this.cancelPressEvent = cancelPressEvent;
      changeAlert = alertType;
      _buildDialogUI(alertType: alertType);
    });
  }

  _buildDialogUI({int? alertType}) {
    return StylishDialogUI(
      context: this.context,
      alertType: (changeAlert == 9 ? this.alertType : changeAlert),
      titleText: this.titleText,
      contentText: this.contentText,
      confirmText: this.confirmText,
      cancelText: this.cancelText,
      confirmPressEvent: this.confirmPressEvent,
      cancelPressEvent: this.cancelPressEvent,
    );
  }
}
