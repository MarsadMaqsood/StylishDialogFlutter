import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class StylishDialog extends StatefulWidget {
  // ignore: non_constant_identifier_names
  static final int NORMAL = 1;
  // ignore: non_constant_identifier_names
  static final int PROGRESS = 2;
  // ignore: non_constant_identifier_names
  static final int SUCCESS = 3;
  // ignore: non_constant_identifier_names
  static final int INFO = 4;
  // ignore: non_constant_identifier_names
  static final int WARNING = 5;
  // ignore: non_constant_identifier_names
  static final int ERROR = 6;

  StylishDialog({
    Key? key,
    required this.context,
    required this.alertType,
    this.titleText,
    this.contentText,
    this.confirmText,
    this.cancelText,
    this.confirmPressEvent,
    this.cancelPressEvent,
  }) : super(key: key);

  final BuildContext? context;
  final int? alertType;
  String? titleText;
  String? contentText;
  String? confirmText;
  String? cancelText;
  final VoidCallback? confirmPressEvent;
  final VoidCallback? cancelPressEvent;

  @override
  _StylishDialogState createState() => _StylishDialogState();
}

class _StylishDialogState extends State<StylishDialog>
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
      child: (widget.alertType == StylishDialog.NORMAL
          ? stylishContentBox()
          : widget.alertType == StylishDialog.PROGRESS
              ? stylishProgressContentBox()
              : widget.alertType == StylishDialog.SUCCESS
                  ? stylishSuccessContentBox()
                  : widget.alertType == StylishDialog.INFO
                      ? stylishInfoContentBox()
                      : widget.alertType == StylishDialog.WARNING
                          ? stylishWarningContentBox()
                          // : stylishProgressContentBox()),
                          : stylishErrorContentBox()),
    );
  }

  stylishContentBox() {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.titleText != null) titleTextWidget(widget.titleText),
          if (widget.contentText != null) contentTextWidget(widget.contentText),
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

  stylishProgressContentBox() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: CircularProgressIndicator(
            color: Colors.teal,
          ),
        ),
        if (widget.titleText != null) titleTextWidget(widget.titleText),
        if (widget.contentText != null) contentTextWidget(widget.contentText),
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
    );
  }

  stylishSuccessContentBox() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
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
        ),
        if (widget.titleText != null) titleTextWidget(widget.titleText),
        if (widget.contentText != null) contentTextWidget(widget.contentText),
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
    );
  }

  stylishInfoContentBox() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: ScaleTransition(
              scale: _infoAnimation,
              // axis: Axis.horizontal,
              // axisAlignment: -1,
              child: Icon(
                Icons.info_outlined,
                color: Colors.blue,
                size: 44,
              )),
        ),
        if (widget.titleText != null) titleTextWidget(widget.titleText),
        if (widget.contentText != null) contentTextWidget(widget.contentText),
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
    );
  }

  stylishWarningContentBox() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: ScaleTransition(
              scale: _warningAnimation,
              // axis: Axis.horizontal,
              // axisAlignment: -1,
              child: Icon(
                Icons.info_outlined,
                color: Colors.amber,
                size: 44,
              )),
        ),
        if (widget.titleText != null) titleTextWidget(widget.titleText),
        if (widget.contentText != null) contentTextWidget(widget.contentText),
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
    );
  }

  stylishErrorContentBox() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
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
        ),
        if (widget.titleText != null) titleTextWidget(widget.titleText),
        if (widget.contentText != null) contentTextWidget(widget.contentText),
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
    );
  }

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

  pressButtonWidget(pressEvent, color, text) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextButton(
          onPressed: () async {
            pressEvent();
          },
          child: Text(
            '$text',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
        ),
      ),
    );
  }
}
