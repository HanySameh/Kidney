import 'package:flutter/material.dart';
import 'package:kidney/core/utils/media_query_values.dart';
import 'package:kidney/view/widgets/frame.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Frame(
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text(
                'أنظمة غذائية لمريض الفشل الكلوي',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 25.0,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Image.asset(
                'assets/images/tips.jpeg',
                height: context.height * 0.4,
                width: context.width * 0.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
