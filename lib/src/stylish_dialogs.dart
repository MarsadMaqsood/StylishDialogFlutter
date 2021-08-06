import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class StylishDialog extends StatefulWidget {
  static final int NORMAL = 1;
  static final int PROGRESS = 2;
  static final int SUCCESS = 3;
  static final int INFO = 4;
  static final int WARNING = 5;
  static final int ERROR = 6;

  StylishDialog({
    Key? key,
    required this.alertType,
    this.titleText,
    this.contentText,
    this.itemBuilder,
    this.controller,
    required this.context,
  }) : super(key: key);

  final int? alertType;
  String? titleText;
  String? contentText;
  final IndexedWidgetBuilder? itemBuilder;

  final AnimationController? controller;
  final BuildContext? context;

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
  void initState() {
    super.initState();
    widget.titleText ??= '';
    widget.contentText ??= '';
  }

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
                          : stylishErrorContentBox()),
    );
  }

  stylishContentBox() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: Text(
            '${(widget.titleText == null ? '' : widget.titleText)}',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 6.0, left: 8, right: 8, bottom: 12),
          child: Text(
            '${(widget.contentText == null ? '' : widget.contentText)}',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
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
        (widget.titleText != null
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 8, right: 8, bottom: 8),
                child: Text(
                  '${(widget.titleText == null ? '' : widget.titleText)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            : Text('')),
        (widget.contentText != null
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 6.0, left: 8, right: 8, bottom: 12),
                child: Text(
                  '${(widget.contentText == null ? '' : widget.contentText)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Text('')),
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
        (widget.titleText != null
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 8, right: 8, bottom: 8),
                child: Text(
                  '${(widget.titleText == null ? '' : widget.titleText)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            : Text('')),
        (widget.contentText != null
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 6.0, left: 8, right: 8, bottom: 12),
                child: Text(
                  '${(widget.contentText == null ? '' : widget.contentText)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Text('')),
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
        (widget.titleText != null
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 8, right: 8, bottom: 8),
                child: Text(
                  '${(widget.titleText == null ? '' : widget.titleText)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            : Text('')),
        (widget.contentText != null
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 6.0, left: 8, right: 8, bottom: 12),
                child: Text(
                  '${(widget.contentText == null ? '' : widget.contentText)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Text('')),
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
        (widget.titleText != null
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 8, right: 8, bottom: 8),
                child: Text(
                  '${(widget.titleText == null ? '' : widget.titleText)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            : Text('')),
        (widget.contentText != null
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 6.0, left: 8, right: 8, bottom: 12),
                child: Text(
                  '${(widget.contentText == null ? '' : widget.contentText)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Text('')),
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
        (widget.titleText != null
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 8, right: 8, bottom: 8),
                child: Text(
                  '${(widget.titleText == null ? '' : widget.titleText)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            : Text('')),
        (widget.contentText != null
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 6.0, left: 8, right: 8, bottom: 12),
                child: Text(
                  '${(widget.contentText == null ? '' : widget.contentText)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Text('')),
      ],
    );
  }
}
