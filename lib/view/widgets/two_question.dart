import 'package:flutter/material.dart';
import 'package:kidney/core/utils/media_query_values.dart';
import 'package:readmore/readmore.dart';

import '../../core/utils/app_colors.dart';
import 'frame.dart';

class TwoQuestionItem extends StatelessWidget {
  const TwoQuestionItem({
    super.key,
    required this.answer1,
    required this.question1,
    required this.numberOfLines,
    required this.answer2,
    required this.question2,
  });
  final String answer1;
  final String question1;
  final String answer2;
  final String question2;
  final int numberOfLines;
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
                    question1,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 30.0,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: context.width * 0.8,
                    child: ReadMoreText(
                      answer1,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                      trimLines: 13,
                      colorClickableText: AppColors.primary,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'اكثر',
                      trimExpandedText: 'اقل',
                    ),
                  ),
                  Text(
                    question2,
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 30.0,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: context.width * 0.8,
                    child: ReadMoreText(
                      answer2,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                      trimLines: 13,
                      colorClickableText: AppColors.primary,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'اكثر',
                      trimExpandedText: 'اقل',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
