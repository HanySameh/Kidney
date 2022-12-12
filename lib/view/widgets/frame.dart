import 'package:flutter/material.dart';
import 'package:flutter_animate/animate_list.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:flutter_animate/extensions/extensions.dart';
import 'package:kidney/core/utils/media_query_values.dart';

class Frame extends StatelessWidget {
  const Frame(
      {super.key, this.widget, this.showHead = true, this.showBottom = true});
  final Widget? widget;
  final bool? showHead;
  final bool? showBottom;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (showHead == true)
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/wave-point.png',
              // height: context.height * 0.17,
            ),
          ),
        widget ?? Container(),
        SizedBox(
          height: context.height * 0.009,
        ),
        if (showBottom == true)
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/wave.png',
              height: context.height * 0.17,
            ),
          ),
      ].animate(interval: 400.ms).fade(duration: 300.ms),
    );
  }
}
