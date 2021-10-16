// ignore_for_file: deprecated_member_use_from_same_package

library stylish_dialog;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stylish_dialog/src/stylish_dialog_ui.dart';

enum StylishDialogType {
  NORMAL,
  PROGRESS,
  SUCCESS,
  INFO,
  WARNING,
  ERROR,
  _CHANGE,
}

class StylishDialog {
  final BuildContext context;

  ///StylishDialog to show dialog with different alert types. You can specify alert type
  /// using for Normal [StylishDialogType.NORMAL]
  ///
  ///Progress [StylishDialogType.PROGRESS]
  ///
  ///Success [StylishDialogType.SUCCESS]
  ///
  ///Info [StylishDialogType.INFO]
  ///
  ///Warning [StylishDialogType.WARNING]
  ///
  ///Error [StylishDialogType.ERROR]
  final StylishDialogType? alertType;

  ///Use this to set dialog title text
  String? titleText;

  ///Use this to set dialog content/detail text
  String? contentText;

  ///Use this to set confirm button text
  @Deprecated('Use `confirmEvent` instead. Will be removed soon')
  String? confirmText;

  ///Use this to set cancel button tex
  @Deprecated('Use `cancelEvent` instead. Will be removed soon')
  String? cancelText;

  ///Use this to stop dialog from dismissing by touching outside of the dialog
  ///Default value is true
  bool dismissOnTouchOutside;

  ///Play animations in loop.
  ///Default value is false
  bool animationLoop;

  ///Hanlde confirm button press event
  @Deprecated('Use `confirmButton` instead. Will be removed soon')
  VoidCallback? confirmPressEvent;

  ///Hanlde cancel button press event
  @Deprecated('Use `cancelButton` instead. Will be removed soon')
  VoidCallback? cancelPressEvent;

  ///Add custom widget in the dialog.
  Widget? addView;

  ///Use this to add confirm button widget.
  ///To assign press event on non-clickable widgets like
  ///```dart
  /// Containter(), Text() etc.
  ///```
  ///Wrap you widget with
  ///```dart
  ///GestureDetector() or InkWell()
  ///```
  Widget? confirmButton;

  ///Use this to add cancel button widget.
  ///To assign press event on non-clickable widgets like
  ///```dart
  /// Containter(), Text() etc.
  ///```
  ///Wrap you widget with
  ///```dart
  ///GestureDetector() or InkWell()
  ///```
  Widget? cancelButton;

  StylishDialog({
    required this.context,
    required this.alertType,
    this.titleText,
    this.contentText,
    @Deprecated('Use `confirmButton` instead. will be removed soon')
        this.confirmText,
    @Deprecated('Use `cancelButton` instead. will be removed soon')
        this.cancelText,
    @Deprecated('Use `confirmButton` instead. will be removed soon')
        this.confirmPressEvent,
    @Deprecated('Use `cancelButton` instead. will be removed soon')
        this.cancelPressEvent,
    this.dismissOnTouchOutside = true,
    this.animationLoop = false,
    this.addView,
    this.confirmButton,
    this.cancelButton,
  }) : assert(alertType != null, "StylishDialog: Require non-null alert type");

  ///Function to show dialog
  Future show() => showDialog(
        context: this.context,
        barrierDismissible: this.dismissOnTouchOutside,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            _stateSetter = setState;
            return _buildDialog;
          });
        },
      );

  //to build dialog
  Widget get _buildDialog =>
      WillPopScope(onWillPop: _onWillPop, child: _buildDialogUI());

  Future<bool> _onWillPop() async => this.dismissOnTouchOutside;

  ///Function to dismiss dialog
  dismiss({bool rootNavigator = true}) {
    Navigator.of(this.context, rootNavigator: rootNavigator).pop();
  }

  late StateSetter _stateSetter;
  StylishDialogType _changeAlert = StylishDialogType._CHANGE;

  ///Function to change current dialog alert type
  changeAlertType({
    required StylishDialogType alertType,
    String? titleText,
    String? contentText,
    @Deprecated('Use `confirmButton` instead. will be removed soon')
        String? confirmText,
    @Deprecated('Use `cancelButton` instead. will be removed soon')
        String? cancelText,
    @Deprecated('Use `confirmButton` instead. will be removed soon')
        VoidCallback? confirmPressEvent,
    @Deprecated('Use `cancelButton` instead. will be removed soon')
        VoidCallback? cancelPressEvent,

    ///Use this to add confirm button widget.
    ///To assign press event on non-clickable widgets like
    ///```dart
    /// Containter(), Text() etc.
    ///```
    ///Wrap you widget with
    ///```dart
    ///GestureDetector() or InkWell()
    ///```
    Widget? confirmButton,

    ///Use this to add cancel button widget.
    ///To assign press event on non-clickable widgets like
    ///```dart
    /// Containter(), Text() etc.
    ///```
    ///Wrap you widget with
    ///```dart
    ///GestureDetector() or InkWell()
    ///```
    Widget? cancelButton,
  }) {
    _stateSetter(() {
      this.titleText = titleText;
      this.contentText = contentText;
      this.confirmText = confirmText;
      this.cancelText = cancelText;
      this.confirmPressEvent = confirmPressEvent;
      this.cancelPressEvent = cancelPressEvent;
      this.confirmButton = confirmButton;
      this.cancelButton = cancelButton;
      _changeAlert = alertType;

      _buildDialogUI();
    });
  }

  ///Function to build dialog UI
  _buildDialogUI() {
    return StylishDialogUI(
      context: this.context,
      alertType: _changeAlert == StylishDialogType._CHANGE
          ? this.alertType
          : _changeAlert,
      titleText: this.titleText,
      contentText: this.contentText,
      confirmText: this.confirmText,
      cancelText: this.cancelText,
      confirmPressEvent: this.confirmPressEvent,
      cancelPressEvent: this.cancelPressEvent,
      addView: this.addView,
      animationLoop: this.animationLoop,
      cancelButton: this.cancelButton,
      confirmButton: this.confirmButton,
    );
  }
}
