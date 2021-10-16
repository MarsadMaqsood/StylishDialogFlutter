import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../stylish_dialog.dart';

const _sizeK = 50.0;

// ignore: must_be_immutable
class StylishDialogUI extends StatefulWidget {
  StylishDialogUI({
    Key? key,
    required this.context,
    required this.alertType,
    this.animationLoop,
    this.titleText,
    this.contentText,
    this.confirmText,
    this.cancelText,
    this.confirmPressEvent,
    this.cancelPressEvent,
    this.addView,
    this.confirmButton,
    this.cancelButton,
  }) : super(key: key);

  final BuildContext context;
  final StylishDialogType? alertType;
  final bool? animationLoop;
  String? titleText;
  String? contentText;
  String? confirmText;
  String? cancelText;
  VoidCallback? confirmPressEvent;
  VoidCallback? cancelPressEvent;
  Widget? addView;
  //
  Widget? confirmButton;
  Widget? cancelButton;

  @override
  _StylishDialogState createState() => _StylishDialogState();
}

class _StylishDialogState extends State<StylishDialogUI>
    with TickerProviderStateMixin {
  var _key = GlobalKey<NavigatorState>();

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  @override
  void didUpdateWidget(covariant StylishDialogUI oldWidget) {
    super.didUpdateWidget(oldWidget);

    ///dispose current active controller and
    /// create new one for changeAlertType
    _controller.dispose();
    _initializeAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _initializeAnimation() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    //Default values of Confirm Button Text
    widget.confirmText ??= 'Confirm';
    //Default values of Cancel Button Text
    widget.cancelText ??= 'Cancel';

    return Dialog(
      key: (widget.key == null ? _key : widget.key),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: _stylishContentBox(),
    );
  }

  _stylishContentBox() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _stylishDialogChange(),
        if (widget.titleText != null) _titleTextWidget(widget.titleText),
        if (widget.contentText != null) _contentTextWidget(widget.contentText),
        if (widget.alertType == StylishDialogType.NORMAL &&
            widget.addView != null)
          Container(
              padding: EdgeInsets.only(left: 10, top: 8, bottom: 4, right: 10),
              child: widget.addView),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ///Cancel
            if (widget.cancelButton != null)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: widget.cancelButton!,
              )
            else if (widget.cancelPressEvent != null)
              _pressButtonWidget(
                  widget.cancelPressEvent, Colors.red, widget.cancelText),

            ///Confirm
            if (widget.confirmButton != null)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: widget.confirmButton!,
              )
            else if (widget.confirmPressEvent != null)
              _pressButtonWidget(
                  widget.confirmPressEvent, Colors.teal, widget.confirmText),
          ],
        ),
      ],
    );
  }

  //Text widget for title text
  _titleTextWidget(text) {
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
  _contentTextWidget(text) {
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
  _pressButtonWidget(pressEvent, color, text) {
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

  _playAnimation() {
    if (widget.animationLoop!)
      _controller.repeat();
    else
      _controller.forward();
  }

  _stylishDialogChange() {
    switch (widget.alertType) {
      case StylishDialogType.NORMAL:
        return Container(
          width: 0,
        );
      case StylishDialogType.PROGRESS:
        return Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: CircularProgressIndicator(
            color: Colors.teal,
          ),
        );
      case StylishDialogType.SUCCESS:
        _playAnimation();
        return Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: Container(
            alignment: Alignment.center,
            width: _sizeK,
            height: _sizeK,
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
                sizeFactor: _animation,
                axis: Axis.horizontal,
                axisAlignment: -1,
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 40,
                )),
          ),
        );
      case StylishDialogType.INFO:
        _playAnimation();
        return Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: ScaleTransition(
              scale: _animation,
              child: Icon(
                Icons.info_outlined,
                color: Colors.blue,
                size: 44,
              )),
        );
      case StylishDialogType.WARNING:
        _playAnimation();
        return Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: ScaleTransition(
              scale: _animation,
              child: Icon(
                Icons.info_outlined,
                color: Colors.amber,
                size: 44,
              )),
        );
      case StylishDialogType.ERROR:
        _playAnimation();
        return Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: Container(
            alignment: Alignment.center,
            width: _sizeK,
            height: _sizeK,
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
                scale: _animation,
                child: Icon(
                  Icons.clear,
                  color: Colors.red,
                  size: 40,
                )),
          ),
        );

      default:
        return Container(
          width: 0,
        );
    }
  }
}
