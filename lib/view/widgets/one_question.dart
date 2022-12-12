import 'package:flutter/material.dart';
import 'package:kidney/core/utils/media_query_values.dart';
import 'package:readmore/readmore.dart';

import '../../core/utils/app_colors.dart';
import 'frame.dart';

class OneQuestionItem extends StatelessWidget {
  const OneQuestionItem({
    super.key,
    required this.answer,
    required this.question,
    required this.numberOfLines,
    this.widget,
  });
  final String answer;
  final String question;
  final int numberOfLines;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Frame(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'اعرف اكتر',
              style: Theme.of(context).textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 18.0,
                right: 18.0,
                bottom: numberOfLines > 8
                    ? context.height * 0.032
                    : context.height * 0.1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    question,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 30.0,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: context.width * 0.8,
                    child: ReadMoreText(
                      answer,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                      trimLines: 13,
                      colorClickableText: AppColors.primary,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'اكثر',
                      trimExpandedText: 'اقل',
                    ),
                  ),
                  widget ?? Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
