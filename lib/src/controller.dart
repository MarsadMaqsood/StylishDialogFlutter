import 'package:flutter/material.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

abstract class Controller extends ChangeNotifier {
  static setValue(DialogStatus status) {}

  void Function(DialogStatus status)? listener;

  void dismiss();

  @override
  void dispose();
}
