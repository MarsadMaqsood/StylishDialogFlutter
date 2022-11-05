import 'package:flutter/material.dart';
import '../stylish_dialog.dart';

const _sizeK = 48.0;

// ignore: must_be_immutable
class StylishDialogUI extends StatefulWidget {
  StylishDialogUI({
    Key? key,
    required this.context,
    required this.alertType,
    this.animationLoop,
    this.title,
    this.content,
    this.confirmText,
    this.cancelText,
    this.confirmPressEvent,
    this.cancelPressEvent,
    this.addView,
    this.confirmButton,
    this.cancelButton,
    this.color,
    // this.titleStyle,
    // this.contentStyle,
    this.style,
    this.backgroundColor,
  }) : super(key: key);

  final BuildContext context;
  final StylishDialogType? alertType;
  final bool? animationLoop;
  Widget? title;
  // String? titleText;
  // String? contentText;
  Widget? content;
  String? confirmText;
  String? cancelText;
  VoidCallback? confirmPressEvent;
  VoidCallback? cancelPressEvent;
  Widget? addView;

  Widget? confirmButton;
  Widget? cancelButton;
  Color? color;
  // TextStyle? titleStyle;
  // TextStyle? contentStyle;
  Style? style;
  Color? backgroundColor;

  @override
  State<StylishDialogUI> createState() => _StylishDialogState();
}

class _StylishDialogState extends State<StylishDialogUI>
    with TickerProviderStateMixin {
  final GlobalKey _key = GlobalKey<NavigatorState>();

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

    ///dispose the current active controller and
    /// create a new one for changeAlertType
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
      key: (widget.key ?? _key),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 0,
      backgroundColor: widget.style == Style.Default
          ? (widget.backgroundColor ?? Colors.white)
          : Colors.black,
      child: Container(
          padding: const EdgeInsets.all(12),
          child: widget.style == Style.Default
              ? _stylishContentBox()
              : _stylishContentBoxStyle1()),
    );
  }

  _stylishContentBox() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _stylishDialogChange(),
        if (widget.title != null) _titleTextWidget(widget.title),
        if (widget.content != null) _contentTextWidget(widget.content),
        if (widget.addView != null)
          Container(
              padding:
                  const EdgeInsets.only(left: 10, top: 8, bottom: 4, right: 10),
              child: widget.addView),
        const SizedBox(
          height: 12,
        ),
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
  Widget _titleTextWidget(text) {
    return Padding(
      padding: const EdgeInsets.only(
        top: KPadding,
        left: KPadding,
        right: KPadding,
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: (Theme.of(context).textTheme.headline6?.color) ?? Colors.black,
        ),
        child: text,
      ),
    );
  }

  //Text widget for content text
  Widget _contentTextWidget(text) {
    return Padding(
      padding: const EdgeInsets.only(
        right: KPadding,
        left: KPadding,
        top: KPadding,
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: (Theme.of(context).textTheme.subtitle1?.color) ?? Colors.black,
        ),
        child: text,
      ),
    );
  }

  //Button widget for confirm and cancel buttons
  _pressButtonWidget(pressEvent, color, text) {
    return Flexible(
      child: TextButton(
        onPressed: () async {
          pressEvent();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8.0, right: 4.0, top: 4, bottom: 4),
          child: Text(
            '$text',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  _playAnimation() {
    if (widget.animationLoop!) {
      _controller.repeat();
    } else {
      _controller.forward();
    }
  }

  _stylishDialogChange() {
    switch (widget.alertType) {
      case StylishDialogType.NORMAL:
        return Container(
            // width: 0,
            );
      case StylishDialogType.PROGRESS:
        return Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: CircularProgressIndicator(
            color: widget.color,
            strokeWidth: 3,
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
              // color: Colors.white,
              border: Border.all(
                color: Colors.green,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.all(4.0),
            child: SizeTransition(
              sizeFactor: _animation,
              axis: Axis.horizontal,
              axisAlignment: -1,
              child: const Icon(
                Icons.check,
                color: Colors.green,
                size: 38,
              ),
            ),
          ),
        );
      case StylishDialogType.INFO:
        _playAnimation();
        return Padding(
          padding:
              const EdgeInsets.only(top: 12.0, left: 8, right: 8, bottom: 8),
          child: ScaleTransition(
              scale: _animation,
              child: const Icon(
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
              child: const Icon(
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
              // color: Colors.white,
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.all(4.0),
            child: ScaleTransition(
                scale: _animation,
                child: const Icon(
                  Icons.clear,
                  color: Colors.red,
                  size: 40,
                )),
          ),
        );

      default:
        return Container(
            // width: 0,
            );
    }
  }

  _stylishContentBoxStyle1() {
    return Transform.rotate(
      angle: -0.07,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.backgroundColor ?? Colors.white,
        ),
        padding: const EdgeInsets.all(1),
        child: Transform.rotate(
          angle: 0.07,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 12,
              ),
              if (widget.title != null) _titleTextWidget(widget.title),
              if (widget.content != null) _contentTextWidget(widget.content),
              if (widget.addView != null)
                Container(
                    padding: const EdgeInsets.only(
                        left: 10, top: 8, bottom: 4, right: 10),
                    child: widget.addView),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///Confirm
                  if (widget.confirmButton != null)
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: widget.confirmButton!,
                    )
                  else if (widget.confirmPressEvent != null)
                    _pressButtonWidgetStyle1(widget.confirmPressEvent,
                        Colors.black, widget.confirmText),

                  ///Cancel
                  if (widget.cancelButton != null)
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: widget.cancelButton!,
                    )
                  else if (widget.cancelPressEvent != null)
                    _pressButtonWidgetStyle1(widget.cancelPressEvent,
                        Colors.transparent, widget.cancelText,
                        textColor: Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _pressButtonWidgetStyle1(pressEvent, color, text, {textColor}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () async {
          pressEvent();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color,
          ),
          padding: const EdgeInsets.all(12),
          child: Text(
            '$text',
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor ?? Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

const double KPadding = 12.0;
