import 'package:flutter/material.dart';

abstract class Style {
  abstract final Color backgroundColor;
}

///Default dialog style with differnet alert types `StylishDialogType`
///
///![](https://raw.githubusercontent.com/MarsadMaqsood/StylishDialogFlutter/master/assets/1.png)
class DefaultStyle extends Style {
  ///Change the background color of dialog
  ///
  ///default is [Colors.white]
  @override
  final Color backgroundColor;

  ///Play animations in a loop.
  ///
  ///Default value is `false`
  final bool animationLoop;

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

  DefaultStyle({
    this.backgroundColor = Colors.white,
    this.animationLoop = false,
    this.progressColor,
  });
}

///![](https://raw.githubusercontent.com/MarsadMaqsood/StylishDialogFlutter/master/assets/7.png)
class Style1 extends Style {
  ///Change the background color of dialog
  ///
  ///default is [Colors.black]
  Color dialogBgColor;

  ///Change the background layer color of dialog
  ///
  ///default is [Colors.white]
  @override
  Color backgroundColor;

  Style1({
    this.dialogBgColor = Colors.white,
    this.backgroundColor = Colors.black,
  });
}
