import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../stylish_dialog.dart';

const double paddingK = 12.0;
const double sizeK = 48.0;

class StylishDialogUI extends StatefulWidget {
  const StylishDialogUI({
    super.key,
    required this.context,
    required this.alertType,
    this.title,
    this.content,
    this.addView,
    this.confirmButton,
    this.cancelButton,
    this.sizeK,
    required this.style,
  });

  final BuildContext context;
  final StylishDialogType? alertType;
  final Widget? title, content;

  final Widget? addView;

  final Widget? confirmButton, cancelButton;

  ///Dialog style
  final Style style;
  //progress Indicator Size
  final double? sizeK;

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
    /// create a new one for `changeAlertType`
    _controller.dispose();
    _initializeAnimation();
  }

  @override
  void dispose() {
    ///dispose controller
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
    return Dialog(
      key: (widget.key ?? _key),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 0,
      backgroundColor: widget.style.backgroundColor,
      child: widget.style.runtimeType == DefaultStyle
          ? Container(
              padding: const EdgeInsets.all(12),
              child: _stylishContentBox(),
            )
          : _stylishContentBoxStyle1(),
    );
  }

  Widget _stylishContentBox() {
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
            child: widget.addView,
          ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisSize: kIsWeb ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ///Cancel
            if (widget.cancelButton != null)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: widget.cancelButton!,
              ),

            ///Confirm
            if (widget.confirmButton != null)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: widget.confirmButton!,
              ),
          ],
        ),
      ],
    );
  }

  //Text widget for title text
  Widget _titleTextWidget(text) {
    return Padding(
      padding: const EdgeInsets.only(
        top: paddingK,
        left: paddingK,
        right: paddingK,
      ),
      child: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color:
              (Theme.of(context).textTheme.titleLarge?.color) ?? Colors.black,
        ),
        child: text,
      ),
    );
  }

  //Text widget for content text
  Widget _contentTextWidget(text) {
    return Padding(
      padding: const EdgeInsets.only(
        top: paddingK,
        left: paddingK,
        right: paddingK,
      ),
      child: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: (Theme.of(context).textTheme.bodyLarge?.fontSize) ?? 15.0,
          color:
              (Theme.of(context).textTheme.titleMedium?.color) ?? Colors.black,
        ),
        child: text,
      ),
    );
  }

  _playAnimation() {
    if ((widget.style as DefaultStyle).animationLoop) {
      _controller.repeat();
    } else {
      _controller.forward();
    }
  }

  Widget _stylishDialogChange() {
    switch (widget.alertType) {
      case StylishDialogType.NORMAL:
        return const SizedBox();
      case StylishDialogType.PROGRESS:
        return Container(
          width: widget.sizeK ?? sizeK,
          height: widget.sizeK ?? sizeK,
          margin: const EdgeInsets.only(
            top: 12.0,
          ),
          child: CircularProgressIndicator(
            color: (widget.style as DefaultStyle).progressColor ??
                Theme.of(context).primaryColor,
            strokeWidth: 2.5,
          ),
        );
      case StylishDialogType.SUCCESS:
        _playAnimation();
        return Container(
          alignment: Alignment.center,
          width: sizeK,
          height: sizeK,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: Colors.green,
              width: 2,
            ),
          ),
          margin: const EdgeInsets.only(
            top: 12,
          ),
          padding: const EdgeInsets.all(2.0),
          child: ScaleTransition(
            scale: _animation,
            child: const Icon(
              Icons.check,
              color: Colors.green,
              size: 36,
            ),
          ),
        );
      case StylishDialogType.INFO:
        _playAnimation();
        return Container(
          width: sizeK,
          height: sizeK,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
          ),
          margin: const EdgeInsets.only(
            top: 12.0,
          ),
          padding: const EdgeInsets.all(2.0),
          child: ScaleTransition(
            scale: _animation,
            child: const Icon(
              IconData(
                0x0069,
                fontFamily: 'serif',
              ),
              color: Colors.blue,
              size: 36,
            ),
          ),
        );

      case StylishDialogType.WARNING:
        _playAnimation();
        return Container(
          width: sizeK,
          height: sizeK,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: Colors.amber,
              width: 2,
            ),
          ),
          margin: const EdgeInsets.only(
            top: 12.0,
          ),
          padding: const EdgeInsets.all(2.0),
          child: ScaleTransition(
            scale: _animation,
            child: const Icon(
              IconData(
                0x0069,
                fontFamily: 'serif',
              ),
              color: Colors.amber,
              size: 36,
            ),
          ),
        );
      case StylishDialogType.ERROR:
        _playAnimation();
        return Container(
          alignment: Alignment.center,
          width: sizeK,
          height: sizeK,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            // color: Colors.white,
            border: Border.all(
              color: Colors.red,
              width: 2,
            ),
          ),
          margin: const EdgeInsets.only(
            top: 12.0,
          ),
          padding: const EdgeInsets.all(2.0),
          child: ScaleTransition(
            scale: _animation,
            child: const Icon(
              Icons.clear,
              color: Colors.red,
              size: 36,
            ),
          ),
        );

      default:
        return const SizedBox();
    }
  }

  Widget _stylishContentBoxStyle1() {
    return Transform.rotate(
      angle: -0.07,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: (widget.style as Style1).dialogBgColor,
        ),
        padding: const EdgeInsets.all(1),
        child: Transform.rotate(
          angle: 0.07,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // const SizedBox(
                //   height: 12,
                // ),
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
                    ///Confirm Button
                    if (widget.confirmButton != null)
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: widget.confirmButton!,
                      ),

                    ///Cancel Button
                    if (widget.cancelButton != null)
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: widget.cancelButton!,
                      ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
