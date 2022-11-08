import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum PreferedStyle {
  Android,
  IOS,
  System,
}

///[AdaptiveDialog]
typedef AdaptiveBuilder = Widget Function(BuildContext context);

class AdaptiveDialog extends Dialog {
  const AdaptiveDialog({
    super.key,
    this.title,
    this.actions = const [],
    this.content,
    this.preferedStyle = PreferedStyle.System,
  });

  final Widget? title, content;
  final List<Widget> actions;
  final PreferedStyle preferedStyle;

  @override
  Widget build(BuildContext context) {
    return preferedStyle == PreferedStyle.System
        ? Platform.isIOS
            ? CupertinoAlertDialog(
                title: title,
                actions: actions,
                content: content,
              )
            : AlertDialog(
                title: title,
                actions: actions,
                content: content,
              )
        : preferedStyle == PreferedStyle.IOS
            ? CupertinoAlertDialog(
                title: title,
                actions: actions,
                content: content,
              )
            : AlertDialog(
                title: title,
                actions: actions,
                content: content,
              );
  }
}

Future<T?> showAdaptiveDialog<T>({
  required BuildContext context,
  required AdaptiveBuilder builder,
  bool barrierDismissible = true,
  Color? barrierColor = Colors.black54,
  String? barrierLabel,
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
}) {
  assert(debugCheckHasMaterialLocalizations(context));

  final CapturedThemes themes = InheritedTheme.capture(
    from: context,
    to: Navigator.of(
      context,
      rootNavigator: useRootNavigator,
    ).context,
  );

  return Navigator.of(context, rootNavigator: useRootNavigator)
      .push<T>(DialogRoute<T>(
    context: context,
    builder: builder,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    useSafeArea: useSafeArea,
    settings: routeSettings,
    themes: themes,
  ));
}
