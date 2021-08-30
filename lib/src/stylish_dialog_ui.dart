import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../stylish_dialog.dart';

// ignore: must_be_immutable
class StylishDialogUI extends StatefulWidget {
  StylishDialogUI({
    Key? key,
    required this.context,
    required this.alertType,
    this.titleText,
    this.contentText,
    this.confirmText,
    this.cancelText,
    this.confirmPressEvent,
    this.cancelPressEvent,
    this.addView,
  }) : super(key: key);

  final BuildContext context;
  final int? alertType;
  String? titleText;
  String? contentText;
  String? confirmText;
  String? cancelText;
  VoidCallback? confirmPressEvent;
  VoidCallback? cancelPressEvent;
  Widget? addView;

  @override
  _StylishDialogState createState() => _StylishDialogState();
}

class _StylishDialogState extends State<StylishDialogUI>
    with TickerProviderStateMixin {
  var key = GlobalKey<NavigatorState>();

  late final AnimationController _successAnimController = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _successAnimation = CurvedAnimation(
    parent: _successAnimController,
    curve: Curves.fastOutSlowIn,
  );

  late final AnimationController _infoAnimController = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _infoAnimation = CurvedAnimation(
    parent: _infoAnimController,
    curve: Curves.fastOutSlowIn,
  );

  //warning animation controller
  late final AnimationController _warnAnimController = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _warningAnimation = CurvedAnimation(
    parent: _warnAnimController,
    curve: Curves.fastOutSlowIn,
  );

  //error animation controller
  late final AnimationController _errorAnimController = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _errorAnimation = CurvedAnimation(
    parent: _errorAnimController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _successAnimController.dispose();
    _infoAnimController.dispose();
    _warnAnimController.dispose();
    _errorAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Default values of Confirm Button Text
    widget.confirmText ??= 'Confirm';
    //Default values of Cancel Button Text
    widget.cancelText ??= 'Cancel';

    return Dialog(
      key: (widget.key == null ? key : widget.key),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: stylishContentBox(),
    );
  }

  stylishContentBox() {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _stylishDialogChange(),
          if (widget.titleText != null) titleTextWidget(widget.titleText),
          if (widget.contentText != null) contentTextWidget(widget.contentText),
          if (widget.alertType == StylishDialog.NORMAL &&
              widget.addView != null)
            Container(
                padding:
                    EdgeInsets.only(left: 10, top: 8, bottom: 4, right: 10),
                child: widget.addView),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.cancelPressEvent != null)
                pressButtonWidget(
                    widget.cancelPressEvent, Colors.red, widget.cancelText),
              if (widget.confirmPressEvent != null)
                pressButtonWidget(
                    widget.confirmPressEvent, Colors.teal, widget.confirmText),
            ],
          ),
        ],
      ),
    );
  }

  //Text widget for title text
  titleTextWidget(text) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
      child: Text(
        '$text',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  //Text widget for content text
  contentTextWidget(text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
      child: Text(
        '$text',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  //Button widget for confirm and cancel buttons
  pressButtonWidget(pressEvent, color, text) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextButton(
          onPressed: () async {
            pressEvent();
          },
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 4.0, top: 4, bottom: 4),
            child: Text(
              '$text',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
        ),
      ),
    );
  }

  _stylishDialogChange() {
    switch (widget.alertType) {
      case StylishDialog.NORMAL:
        return Container(
          width: 0,
        );
      case StylishDialog.PROGRESS:
        return Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: CircularProgressIndicator(
            color: Colors.teal,
          ),
        );
      case StylishDialog.SUCCESS:
        return Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44),
              color: Colors.white,
              border: Border.all(
                color: Colors.green,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(4.0),
            child: SizeTransition(
                sizeFactor: _successAnimation,
                axis: Axis.horizontal,
                axisAlignment: -1,
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 40,
                )),
          ),
        );
      case StylishDialog.INFO:
        return Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: ScaleTransition(
              scale: _infoAnimation,
              child: Icon(
                Icons.info_outlined,
                color: Colors.blue,
                size: 44,
              )),
        );
      case StylishDialog.WARNING:
        return Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: ScaleTransition(
              scale: _warningAnimation,
              child: Icon(
                Icons.info_outlined,
                color: Colors.amber,
                size: 44,
              )),
        );
      case StylishDialog.ERROR:
        return Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44),
              color: Colors.white,
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(4.0),
            child: ScaleTransition(
                scale: _errorAnimation,
                child: Icon(
                  Icons.clear,
                  color: Colors.red,
                  size: 40,
                )),
          ),
        );
    }
  }
}
