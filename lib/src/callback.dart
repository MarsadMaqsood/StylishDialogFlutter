import 'package:flutter/material.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class DialogController extends ChangeNotifier {
  DialogController({
    this.listener,
  });

  Function(DialogStatus status)? listener;

  set setValue(DialogStatus status) {
    if (listener != null) listener!(status);
  }

  @override
  void dispose() {
    listener = null;
    super.dispose();
  }
}
