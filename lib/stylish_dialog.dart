// ignore_for_file: deprecated_member_use_from_same_package

library stylish_dialog;

import 'package:flutter/material.dart';
import 'package:stylish_dialog/model/style.dart';
import 'package:stylish_dialog/src/callback.dart';
import 'package:stylish_dialog/src/stylish_dialog_ui.dart';

export 'model/style.dart';
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

enum DialogStatus {
  Showing,
  Changed,
  Dismissed,
}

class StylishDialog {
  ///The [BuildContext] of the current widget.
  final BuildContext context;

  /// The type of alert to be displayed in the dialog.
  ///
  /// You can specify the alert type using one of the following options:
  /// - `StylishDialogType.NORMAL` for a normal alert.
  /// - `StylishDialogType.PROGRESS` for a progress alert which shows a loading indicator.
  /// - `StylishDialogType.SUCCESS` for a success alert with a success icon.
  /// - `StylishDialogType.INFO` for an informational alert with an informational icon.
  /// - `StylishDialogType.WARNING` for a warning alert with a warning icon.
  /// - `StylishDialogType.ERROR` for an error alert with an error icon.
  ///
  /// This property also affects the color and icon of the dialog, so it's recommended
  /// to set it according to the context of the alert.
  final StylishDialogType alertType;

  /// The title of the dialog, displayed at the top of the dialog box.
  Widget? title;

  /// The main content of the dialog, displayed in the middle of the dialog box.
  /// The widget can be any text-based widget, such as [Text] or [RichText].
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

  /// Use this property to specify whether the dialog should be dismissed when the user touches outside of it.
  /// If set to `true`, the dialog will be dismissed when the user touches outside of it.
  /// If set to `false`, the dialog will not be dismissed when the user touches outside of it.
  ///
  /// The default value is `true`.
  ///
  /// ```dart
  /// bool dismissOnTouchOutside = true;
  /// ```
  ///
  /// To use this property, pass it as an argument when creating an instance of the [StylishDialog] class.
  ///
  /// ```dart
  /// StylishDialog(
  ///   dismissOnTouchOutside: false,
  ///   // other properties...
  /// )
  /// ```
  bool dismissOnTouchOutside;

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

  /// Allows you to add a custom widget to the dialog.
  ///
  /// You can use this property to add any widget you want to the dialog, such as a [TextField], a [List], or an [Image].
  ///
  /// To use this property, pass it as an argument when creating an instance of the [StylishDialog] class.
  ///
  /// ```dart
  /// StylishDialog(
  ///   addView: customWidget,
  ///   // other properties...
  /// )
  /// ```
  Widget? addView;

  /// Use this property to add a confirm button widget to the dialog.
  /// The widget can be any type of button, such as [TextButton], [ElevatedButton] or [IconButton].
  /// To assign a press event to the non-clickable widget, wrap it in a clickable widget such as [GestureDetector] or [InkWell].
  /// The code snippet below shows an example of how to use [GestureDetector] to assign a press event to the [Container]:
  /// ```dart
  /// GestureDetector(
  ///   onTap: (){
  ///     // code to execute when button is pressed
  ///   },
  ///   child: Container(
  ///     child: Text('Confirm'),
  ///   ),
  /// )
  /// ```
  /// or
  ///
  ///```dart
  /// InkWell(
  ///   onTap: (){
  ///     // code to execute when button is pressed
  ///   },
  ///   child: Container(
  ///     child: Text('Confirm'),
  ///   ),
  /// )
  /// ```
  Widget? confirmButton;

  /// Use this property to add a confirm button widget to the dialog.
  /// The widget can be any type of button, such as [TextButton], [ElevatedButton] or [IconButton].
  /// To assign a press event to the non-clickable widget, wrap it in a clickable widget such as [GestureDetector] or [InkWell].
  /// The code snippet below shows an example of how to use [GestureDetector] to assign a press event to the [Container]:
  /// ```dart
  /// GestureDetector(
  ///   onTap: (){
  ///     // code to execute when button is pressed
  ///   },
  ///   child: Container(
  ///     child: Text('Cancel'),
  ///   ),
  /// )
  /// ```
  /// or
  ///
  ///```dart
  /// InkWell(
  ///   onTap: (){
  ///     // code to execute when button is pressed
  ///   },
  ///   child: Container(
  ///     child: Text('Cancel'),
  ///   ),
  /// )
  /// ```
  Widget? cancelButton;

  /// Use this property to customize the color of the progress bar.
  ///
  /// This property only takes effect when the [alertType] is set to [StylishDialogType.PROGRESS] and the [style] is set to [DefaultStyle].
  /// By default, the progress bar will use the primary color of the current theme. You can use this property to override that and specify a custom color.
  ///
  /// ```dart
  /// StylishDialog(
  ///   alertType: StylishDialogType.PROGRESS,
  ///   progressColor: Colors.red,
  ///   // other properties...
  /// )
  /// ```
  Color? progressColor;

  /// Allows you to change the style of the dialog UI.
  ///
  /// The `style` property takes an instance of the subclasses of [Style] class, such as [DefaultStyle] or [Style1].
  /// The default value is [DefaultStyle].
  ///
  /// ```dart
  /// Style myStyle = Style1();
  /// StylishDialog(
  ///   style: myStyle,
  ///   // other properties...
  /// )
  /// ```
  ///
  /// You can also use the predefined styles provided by the library, such as `DefaultStyle()` or `Style1()`.
  ///
  /// ```dart
  /// StylishDialog(
  ///   style: Style1(),
  ///   // other properties...
  /// )
  /// ```
  ///
  /// Examples of different styles provided by the library:
  ///
  /// ![Default Style](https://raw.githubusercontent.com/MarsadMaqsood/StylishDialogFlutter/master/assets/1.png)
  ///
  /// ```dart
  /// StylishDialog(
  ///   style: DefaultStyle(),
  ///   // other properties...
  /// )
  /// ```
  /// ---
  ///
  /// ![Style 1](https://raw.githubusercontent.com/MarsadMaqsood/StylishDialogFlutter/master/assets/7.png)
  ///
  /// ```dart
  /// StylishDialog(
  ///   style: Style1(),
  ///   // other properties...
  /// )
  /// ```
  Style? style;

  /// Use this property to handle the callbacks of the dialog.
  ///
  /// By providing an instance of [DialogController] to this property, you can listen to the status of the dialog, which can be [DialogStatus.Showing], [DialogStatus.Changed] or [DialogStatus.Dismissed].
  /// You can use this to perform actions based on the status of the dialog.
  ///
  /// ```dart
  /// DialogController controller = DialogController(
  ///   listener: (status) {
  ///     if (status == DialogStatus.Showing) {
  ///       // perform some action
  ///     }
  ///   },
  /// );
  ///
  /// StylishDialog(
  ///   controller: controller,
  ///   // other properties...
  /// )
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
    this.addView,
    this.confirmButton,
    this.cancelButton,
    this.progressColor,
    this.style,
    this.controller,
  });

  ///The function used to show the stylish dialog
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

  ///The Function used to dismiss the dialog
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

  ///Call [changeAlertType] function to change the alert type of the current dialog
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

    /// The main content of the dialog, displayed in the middle of the dialog box.
    /// The widget can be any text-based widget, such as [Text] or [RichText].
    Widget? content,
    @Deprecated('Use `confirmButton` instead. will be removed soon')
        String? confirmText,
    @Deprecated('Use `cancelButton` instead. will be removed soon')
        String? cancelText,
    @Deprecated('Use `confirmButton` instead. will be removed soon')
        VoidCallback? confirmPressEvent,
    @Deprecated('Use `cancelButton` instead. will be removed soon')
        VoidCallback? cancelPressEvent,

    /// Use this property to add a confirm button widget to the dialog.
    /// The widget can be any type of button, such as [TextButton], [ElevatedButton] or [IconButton].
    /// To assign a press event to the non-clickable widget, wrap it in a clickable widget such as [GestureDetector] or [InkWell].
    /// The code snippet below shows an example of how to use [GestureDetector] to assign a press event to the [Container]:
    /// ```dart
    /// GestureDetector(
    ///   onTap: (){
    ///     // code to execute when button is pressed
    ///   },
    ///   child: Container(
    ///     child: Text('Confirm'),
    ///   ),
    /// )
    /// ```
    /// or
    ///
    ///```dart
    /// InkWell(
    ///   onTap: (){
    ///     // code to execute when button is pressed
    ///   },
    ///   child: Container(
    ///     child: Text('Confirm'),
    ///   ),
    /// )
    /// ```
    Widget? confirmButton,

    /// Use this property to add a confirm button widget to the dialog.
    /// The widget can be any type of button, such as [TextButton], [ElevatedButton] or [IconButton].
    /// To assign a press event to the non-clickable widget, wrap it in a clickable widget such as [GestureDetector] or [InkWell].
    /// The code snippet below shows an example of how to use [GestureDetector] to assign a press event to the [Container]:
    /// ```dart
    /// GestureDetector(
    ///   onTap: (){
    ///     // code to execute when button is pressed
    ///   },
    ///   child: Container(
    ///     child: Text('Cancel'),
    ///   ),
    /// )
    /// ```
    /// or
    ///
    ///```dart
    /// InkWell(
    ///   onTap: (){
    ///     // code to execute when button is pressed
    ///   },
    ///   child: Container(
    ///     child: Text('Cancel'),
    ///   ),
    /// )
    /// ```
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
  Widget _buildDialogUI() {
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
      cancelButton: cancelButton,
      confirmButton: confirmButton,
      progressColor: progressColor ?? Theme.of(context).primaryColor,
      style: style ?? DefaultStyle(),
    );
  }
}
