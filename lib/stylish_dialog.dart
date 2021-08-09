library stylish_dialog;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stylish_dialog/src/stylish_dialog_ui.dart';

// export 'src/stylish_dialogs.dart';

class StylishDialog {
  // ignore: non_constant_identifier_names
  static final int NORMAL = 1;
  // ignore: non_constant_identifier_names
  static final int PROGRESS = 2;
  // ignore: non_constant_identifier_names
  static final int SUCCESS = 3;
  // ignore: non_constant_identifier_names
  static final int INFO = 4;
  // ignore: non_constant_identifier_names
  static final int WARNING = 5;
  // ignore: non_constant_identifier_names
  static final int ERROR = 6;

  final BuildContext context;
  final int? alertType;
  String? titleText;
  String? contentText;
  String? confirmText;
  String? cancelText;
  bool dismissOnTouchOutside;
  final VoidCallback? confirmPressEvent;
  final VoidCallback? cancelPressEvent;

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
          return _buildDialog;
        },
      );

  Widget get _buildDialog => WillPopScope(
        onWillPop: _onWillPop,
        child: StylishDialogUI(
          context: this.context,
          alertType: this.alertType,
          titleText: this.titleText,
          contentText: this.contentText,
          confirmText: this.confirmText,
          cancelText: this.cancelText,
          confirmPressEvent: this.confirmPressEvent,
          cancelPressEvent: this.cancelPressEvent,
        ),
      );

  Future<bool> _onWillPop() async => this.dismissOnTouchOutside;

  dismiss() {
    Navigator.of(this.context).pop();
  }
}
