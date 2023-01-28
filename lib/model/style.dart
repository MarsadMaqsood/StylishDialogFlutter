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

  DefaultStyle({
    this.backgroundColor = Colors.white,
    this.animationLoop = false,
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
