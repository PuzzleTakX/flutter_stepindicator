// ignore_for_file: must_be_immutable

library flutter_stepindicator;

import 'package:flutter/material.dart';

import 'animation_fade.dart';
/// The `FlutterStepIndicator` is a widget that displays a step indicator for visualizing progress through a multi-step process. This class extends `StatefulWidget` and can be used to display and monitor various stages, such as the steps in a registration process or multiple stages in a specific task.

/// Parameters:
/// - `list`: A list of stages or steps to be displayed.
/// - `page`: The current page number or active step.
/// - `positiveCheck`: An optional widget for displaying a positive checkmark.
/// - `disableAutoScroll`: A flag to enable or disable automatic scrolling.
/// - `height`: The height of the step indicator.
/// - `durationScroller`: The duration for scrolling animations.
/// - `durationCheckBulb`: The duration for checkmark bulb animations.
/// - `division`: The number of divisions for rendering steps.
/// - `positiveColor`: The color for positive steps.
/// - `negativeColor`: The color for negative (disabled) steps.
/// - `progressColor`: The color for the progress indicator.
/// - `onChange`: A callback function that triggers when the active step changes.

/// The `FlutterStepIndicator` class provides a flexible way to create step indicators and customize their appearance for various use cases.

class FlutterStepIndicator extends StatefulWidget {
  final List list;
  final int page;
  final Widget? positiveCheck;
  final bool disableAutoScroll;
  final double height;
  final Duration? durationScroller;
  final Duration? durationCheckBulb;
  final int? division;
  Color? positiveColor;
  Color? negativeColor;
  Color? progressColor;
  final Function(int) onChange;

  FlutterStepIndicator({
    super.key,
    required this.onChange,
    required this.list,
    this.durationScroller,
    this.durationCheckBulb,
    this.division,
    this.positiveCheck,
    this.negativeColor,
    this.positiveColor,
    this.progressColor,
    required this.page,
    required this.disableAutoScroll,
    required this.height,
  });

  @override
  State<FlutterStepIndicator> createState() => _FlutterStepIndicatorState();
}

class _FlutterStepIndicatorState extends State<FlutterStepIndicator> {
  ScrollController controller = ScrollController();
  double maxWidths = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: widget.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            shrinkWrap: true,
            controller: controller,
            physics: const NeverScrollableScrollPhysics(
                parent: NeverScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: widget.list.length,
            itemBuilder: (context, index) => (index == 0)
                ? ItemStepIndicatorZero(
                    duration: _currentDurationBulb(),
                    childCheck: _checkEnable(),
                    disableColor: (widget.negativeColor == null)
                        ? Colors.grey
                        : widget.negativeColor!,
                    enableColor: (widget.positiveColor == null)
                        ? Colors.green
                        : widget.positiveColor!,
                    progressColor: (widget.progressColor == null)
                        ? Colors.orange
                        : widget.progressColor!,
                    index: index,
                    currentPage: widget.page,
                    height: widget.height,
                    width: widget.height)
                : ItemStepIndicator(
                    duration: _currentDurationBulb(),
                    childCheck: _checkEnable(),
                    height: widget.height,
                    currentPage: widget.page,
                    disableColor: (widget.negativeColor == null)
                        ? Colors.grey
                        : widget.negativeColor!,
                    enableColor: (widget.positiveColor == null)
                        ? Colors.green
                        : widget.positiveColor!,
                    progressColor: (widget.progressColor == null)
                        ? Colors.orange
                        : widget.progressColor!,
                    index: index,
                    width: widthIndicator(constraints.maxWidth),
                  ),
          );
        },
      ),
    );
  }

  Duration _currentDuration() {
    return (widget.durationScroller == null)
        ? const Duration(milliseconds: 250)
        : widget.durationScroller!;
  }

  Duration _currentDurationBulb() {
    return (widget.durationCheckBulb == null)
        ? const Duration(milliseconds: 250)
        : widget.durationCheckBulb!;
  }

  Widget _checkEnable() {
    return (widget.positiveCheck == null)
        ? const Icon(
            Icons.check_rounded,
            size: 15,
            color: Colors.white,
          )
        : widget.positiveCheck!;
  }

  @override
  void didUpdateWidget(covariant FlutterStepIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.disableAutoScroll) {
      if ((widget.page - 2) >= 0 &&
          (widget.page - 2) <= (widget.list.length - 5)) {
        controller.animateTo((widget.page - 2) * widthIndicator(maxWidths),
            duration: _currentDuration(), curve: Curves.decelerate);
      }
    } else {
      // ignore: curly_braces_in_flow_control_structures
      if (((((maxWidths - widget.height) / (widget.list.length - 1)) <
          // ignore: curly_braces_in_flow_control_structures
          (widget.height + 5)))) if ((widget.page - 2) >=
              0 &&
          (widget.page - 2) <= (widget.list.length - 5)) {
        controller.animateTo((widget.page - 2) * widthIndicator(maxWidths),
            duration: _currentDuration(), curve: Curves.decelerate);
      }
    }
    widget.onChange.call(widget.page);
  }

  double widthIndicator(double maxWidth) {
    maxWidths = maxWidth;
    return (widget.disableAutoScroll)
        ? widthScroller(maxWidth)
        : ((((maxWidth - widget.height) / (widget.list.length - 1)) >
                (widget.height + 5)))
            ? ((maxWidth - widget.height) / (widget.list.length - 1))
            : widthScroller(maxWidth);
  }

  double widthScroller(double maxWidth) {
    return ((maxWidth - widget.height) /
        (((widget.list.length - 1) <= 2)
            ? (widget.list.length - 1)
            : (widget.division == null)
                ? 4
                : widget.division!));
  }
}

class ItemStepIndicatorZero extends StatelessWidget {
  final double width;
  final double height;
  final int currentPage;
  final Duration duration;
  final int index;
  final Color disableColor;
  final Color progressColor;
  final Color enableColor;
  final Widget childCheck;

  const ItemStepIndicatorZero({
    super.key,
    required this.height,
    required this.duration,
    required this.width,
    required this.currentPage,
    required this.index,
    required this.disableColor,
    required this.progressColor,
    required this.enableColor,
    required this.childCheck,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: AnimatedContainer(
        curve: Curves.easeOutQuint,
        duration: duration,
        decoration: BoxDecoration(
          color: (index == currentPage)
              ? Colors.transparent
              : (index < currentPage ? enableColor : disableColor),
          borderRadius: BorderRadius.circular(150),
          border: Border.all(
              color: (index == currentPage)
                  ? progressColor
                  : (index < currentPage ? enableColor : disableColor),
              width: (index == currentPage) ? 2 : 0),
        ),
        padding: EdgeInsets.all((index == currentPage) ? 2.5 : 0),
        alignment: Alignment.centerRight,
        child: Center(
            child: (index == currentPage)
                ? AnimatedContainer(
                    duration: Duration(
                        milliseconds: duration.inMilliseconds ~/ 1.3),
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                        color: (index == currentPage)
                            ? progressColor
                            : (index < currentPage
                                ? enableColor
                                : disableColor),
                        borderRadius: BorderRadius.circular(150)),
                  )
                : ShowUpAnimationPage(
                    duration: duration, delay: 0, child: childCheck)),
      ),
    );
  }
}

class ItemStepIndicator extends StatelessWidget {
  final double width;
  final double height;
  final int currentPage;
  final Duration duration;
  final int index;
  final Color disableColor;
  final Color progressColor;
  final Color enableColor;
  final Widget childCheck;

  const ItemStepIndicator({
    super.key,
    required this.height,
    required this.duration,
    required this.width,
    required this.currentPage,
    required this.index,
    required this.disableColor,
    required this.progressColor,
    required this.enableColor,
    required this.childCheck,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          SizedBox(
              height: height,
              width: height,
              child: (index == currentPage)
                  ? _enable()
                  : (index < currentPage)
                      ? _done()
                      : _disable()),
          Expanded(
              child: SizedBox(
            height: height / (height / 4.4),
            child: TweenAnimationBuilder<double>(
                tween: Tween(
                    begin: 0,
                    end: (index == currentPage)
                        ? 1.0
                        : (index < currentPage ? 1.0 : 0.0)),
                curve: Curves.decelerate,
                duration:
                    Duration(milliseconds: duration.inMilliseconds ~/ 1.6),
                builder: (context, value, _) => LayoutBuilder(
                      builder: (context, constraints) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(150),
                            child: Stack(
                              children: [
                                Visibility(
                                    visible: (index >= currentPage),
                                    child: Container(
                                      width: double.maxFinite,
                                      height: double.maxFinite,
                                      color: disableColor.withOpacity(0.5),
                                    )),
                                AnimatedContainer(
                                  duration: Duration(
                                      milliseconds:
                                          duration.inMilliseconds ~/ 1.6),
                                  width: (constraints.maxWidth * value),
                                  height: double.maxFinite,
                                  decoration: BoxDecoration(
                                    gradient: (index == currentPage)
                                        ? LinearGradient(
                                            colors: [
                                                enableColor,
                                                enableColor
                                              ],
                                            end: Alignment.centerRight,
                                            begin: Alignment.centerLeft)
                                        : (index < currentPage
                                            ? LinearGradient(
                                                colors: [
                                                    enableColor,
                                                    enableColor
                                                  ],
                                                end: Alignment.centerRight,
                                                begin: Alignment.centerLeft)
                                            : LinearGradient(
                                                colors: [
                                                    enableColor
                                                        .withOpacity(0.5),
                                                    disableColor
                                                        .withOpacity(0.5)
                                                  ],
                                                end: Alignment.centerRight,
                                                begin:
                                                    Alignment.centerLeft)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
          ))
        ],
      ),
    );
  }

  Widget _done() {
    return AnimatedContainer(
      curve: Curves.easeOutQuint,
      duration: Duration(milliseconds: duration.inMilliseconds),
      decoration: BoxDecoration(
        color: enableColor,
        borderRadius: BorderRadius.circular(150),
      ),
      alignment: Alignment.centerRight,
      child: Center(
          child: ShowUpAnimationPage(
              duration: duration, delay: 0, child: childCheck)),
    );
  }

  Widget _disable() {
    return AnimatedContainer(
      curve: Curves.easeOutQuint,
      duration: Duration(milliseconds: duration.inMilliseconds),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(150),
        border: Border.all(color: Colors.transparent, width: 0.0),
      ),
      padding: const EdgeInsets.all(2.6),
      alignment: Alignment.centerRight,
      child: Center(
          child: AnimatedContainer(
        duration: Duration(milliseconds: duration.inMilliseconds ~/ 1),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            color: disableColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(150)),
      )),
    );
  }

  Widget _enable() {
    return AnimatedContainer(
      curve: Curves.easeOutQuint,
      duration: Duration(milliseconds: duration.inMilliseconds),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(150),
        border: Border.all(color: progressColor, width: 2.0),
      ),
      padding: const EdgeInsets.all(2.5),
      alignment: Alignment.centerRight,
      child: Center(
          child: AnimatedContainer(
        duration: Duration(milliseconds: duration.inMilliseconds ~/ 1),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            color: progressColor, borderRadius: BorderRadius.circular(150)),
      )),
    );
  }
}
