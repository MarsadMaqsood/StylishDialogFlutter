import 'package:stylish_dialog/stylish_dialog.dart';

abstract class Controller {
  void setValue(DialogStatus status);

  Function(DialogStatus status)? listener;

  void dismiss();

  void dispose();
}
