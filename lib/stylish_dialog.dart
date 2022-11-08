// ignore_for_file: deprecated_member_use_from_same_package

library stylish_dialog;

import 'package:flutter/material.dart';
import 'package:stylish_dialog/src/callback.dart';
import 'package:stylish_dialog/src/stylish_dialog_ui.dart';

export 'src/callback.dart';
export 'src/adaptive_dialog.dart';

enum StylishDialogType {
  ///![](https://raw.githubusercontent.com/MarsadMaqsood/StylishDialogFlutter/master/assets/1.png)
  NORMAL,

  ///![](https://raw.githubusercontent.com/MarsadMaqsood/StylishDialogFlutter/master/assets/2.png)
  PROGRESS,

  ///![](https://raw.githubusercontent.com/MarsadMaqsood/StylishDialogFlutter/master/assets/3.png)
  SUCCESS,

  ///![](https://raw.githubusercontent.com/MarsadMaqsood/StylishDialogFlutter/master/assets/4.png)
  INFO,

  ///![](https://raw.githubusercontent.com/MarsadMaqsood/StylishDialogFlutter/master/assets/5.png)
  WARNING,

  ///![](https://raw.githubusercontent.com/MarsadMaqsood/StylishDialogFlutter/master/assets/6.png)
  ERROR,

  _CHANGE,
}

enum Style {
  //Default dialog style with differnet alert types `StylishDialogType`

  ///![](https://raw.githubusercontent.com/MarsadMaqsood/StylishDialogFlutter/master/assets/1.png)
  Default,

  ///![](https://raw.githubusercontent.com/MarsadMaqsood/StylishDialogFlutter/master/assets/7.png)
  Style1,
}

enum DialogStatus {
  Showing,
  Changed,
  Dismissed,
}

class StylishDialog {
  final BuildContext context;

  ///To show dialog with different alert types. You can specify alert type
  /// using;
  /// for Normal [StylishDialogType.NORMAL]
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
  ///
  final StylishDialogType? alertType;

  ///Dialog's title [Text] widget
  Widget? title;

  ///Dialog's content [Text] widget
  Widget? content;

  ///Use this to set confirm button text.
  ///
  ///@Deprecated('Use `confirmEvent` instead. Will be removed soon')
  @Deprecated('Use `confirmEvent` instead. Will be removed soon')
  String? confirmText;

  ///Use this to set cancel button text.
  ///
  ///@Deprecated('Use `cancelEvent` instead. Will be removed soon')
  @Deprecated('Use `cancelEvent` instead. Will be removed soon')
  String? cancelText;

  ///Use this to avoid dialog from dismissing by touching outside of the dialog
  ///Default value is true
  ///
  ///```
  ///bool dismissOnTouchOutside = true;
  ///```
  bool dismissOnTouchOutside;

  ///Play animations in a loop.
  ///Default value is false
  ///```
  /// bool animationLoop = false;
  ///```
  bool animationLoop;

  ///Hanlde confirm button press event.
  ///
  ///@Deprecated('Use `confirmButton` instead. Will be removed soon')
  @Deprecated('Use `confirmButton` instead. Will be removed soon')
  VoidCallback? confirmPressEvent;

  ///Hanlde cancel button press event.
  ///
  ///@Deprecated('Use `cancelButton` instead. Will be removed soon')
  @Deprecated('Use `cancelButton` instead. Will be removed soon')
  VoidCallback? cancelPressEvent;

  ///Add custom widget in the dialog.
  Widget? addView;

  ///Use this to add confirm button widget.
  ///To assign press event on non-clickable widgets like
  ///```dart
  /// GestureDetector(
  ///   onTap: (){
  ///
  ///   }
  ///   child: widget,
  /// )
  ///
  ///or
  ///
  /// InkWell(
  ///   onTap: (){
  ///
  ///   }
  ///   child: widget,
  /// )
  ///```
  Widget? confirmButton;

  ///Use this to add cancel button widget.
  ///To assign press event on non-clickable widgets like
  ///```dart
  /// Containter(), Text() etc.
  ///```
  ///Wrap you widget with
  ///```dart
  /// GestureDetector(
  ///   onTap: (){
  ///
  ///   }
  ///   child: widget,
  /// )
  ///
  ///or
  ///
  /// InkWell(
  ///   onTap: (){
  ///
  ///   }
  ///   child: widget,
  /// )
  ///```
  Widget? cancelButton;

  ///Use this to change progress bar color.
  ///Default is
  ///```
  ///  Theme.of(context).primaryColor
  ///```
  Color? progressColor;

  ///Use this to change button style
  ///Default [Style.Default]
  Style? style;

  ///Background color of dialog
  Color? backgroundColor;

  ///Handle dialog callbacks
  /// [DialogStatus.Showing], [DialogStatus.Changed] or [DialogStatus.Dismissed]
  /// ```dart
  /// DialogController controller = DialogController(
  ///  listener: (status) {
  ///   ...
  ///  },
  /// );
  /// ```
  final DialogController? controller;

  StylishDialog({
    required this.context,
    required this.alertType,
    this.title,
    this.content,
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
    this.progressColor,
    this.style = Style.Default,
    this.controller,
    this.backgroundColor,
  }) : assert(alertType != null, "StylishDialog: Require non-null alert type");

  ///Function used to show the dialog
  ///```
  ///StylishDialog dialog = StylishDialog(
  ///   context: context,
  ///   alertType: StylishDialogType.PROGRESS,
  ///   ...
  ///);
  ///
  ///dialog.show();
  ///```
  Future<void> show() => showDialog(
        context: context,
        barrierDismissible: dismissOnTouchOutside,
        builder: (context) {
          controller?.setValue = DialogStatus.Showing;

          return StatefulBuilder(builder: (context, setState) {
            _stateSetter = setState;

            return _buildDialog;
          });
        },
      ).then((value) {
        if (value == null) {
          // if (controller != null) {
          controller?.setValue = DialogStatus.Dismissed;
          // controller!.listener!(DialogStatus.Dismissed);
          // }
        }
      });

  //to build dialog
  Widget get _buildDialog =>
      WillPopScope(onWillPop: _onWillPop, child: _buildDialogUI());

  Future<bool> _onWillPop() async => dismissOnTouchOutside;

  ///Function used to dismiss the dialog
  ///```
  ///StylishDialog dialog = StylishDialog(
  ///   context: context,
  ///   alertType: StylishDialogType.NORMAL,
  ///   ...
  ///);
  ///...
  ///dialog.dismiss();
  ///```
  void dismiss({bool rootNavigator = true}) {
    Navigator.of(context, rootNavigator: rootNavigator).pop();
  }

  late StateSetter _stateSetter;
  StylishDialogType _changeAlert = StylishDialogType._CHANGE;

  ///Function used to change current dialog alert type
  ///```
  ///StylishDialog dialog = StylishDialog(
  ///   context: context,
  ///   alertType: StylishDialogType.PROGRESS,
  ///   ...
  ///);
  ///...
  ///
  ///dialog.changeAlertType(
  ///   alertType: StylishDialogType.WARNING,
  ///   ...
  ///);
  ///
  ///```
  void changeAlertType({
    required StylishDialogType alertType,
    Widget? title,
    Widget? content,
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
    ///GestureDetector(
    /// onTap: (){
    ///
    /// },
    ///
    /// child: ...
    ///
    ///),
    /// //or
    ///
    ///InkWell(
    /// onTap: (){
    ///
    /// },
    ///
    /// child: ...
    ///
    ///),
    ///```
    Widget? cancelButton,
  }) {
    _stateSetter(() {
      this.title = title;
      this.content = content;
      this.confirmText = confirmText;
      this.cancelText = cancelText;
      this.confirmPressEvent = confirmPressEvent;
      this.cancelPressEvent = cancelPressEvent;
      this.confirmButton = confirmButton;
      this.cancelButton = cancelButton;

      _changeAlert = alertType;

      controller?.setValue = DialogStatus.Changed;

      _buildDialogUI();
    });
  }

  ///Function to build dialog UI
  _buildDialogUI() {
    return StylishDialogUI(
      context: context,
      alertType:
          _changeAlert == StylishDialogType._CHANGE ? alertType : _changeAlert,
      title: title,
      content: content,
      confirmText: confirmText,
      cancelText: cancelText,
      confirmPressEvent: confirmPressEvent,
      cancelPressEvent: cancelPressEvent,
      addView: addView,
      animationLoop: animationLoop,
      cancelButton: cancelButton,
      confirmButton: confirmButton,
      // titleStyle: titleStyle,
      // contentStyle: contentStyle,
      color: progressColor ?? Theme.of(context).primaryColor,
      style: style!,
      backgroundColor: backgroundColor,
    );
  }
}
