import 'package:flutter/material.dart';
import 'package:flutter_animate/animate_list.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:flutter_animate/extensions/extensions.dart';
import 'package:kidney/core/utils/app_colors.dart';
import 'package:kidney/core/utils/media_query_values.dart';
import 'package:kidney/view/widgets/custom_button.dart';
import 'package:kidney/view/widgets/input_field.dart';
import 'package:quickalert/quickalert.dart';

import '../../config/routes/routes.dart';

class MoreInfoRegisterScreen extends StatefulWidget {
  const MoreInfoRegisterScreen({super.key});

  @override
  State<MoreInfoRegisterScreen> createState() => _MoreInfoRegisterScreenState();
}

class _MoreInfoRegisterScreenState extends State<MoreInfoRegisterScreen> {
  int? _selectedIndex = 4;
  final List<String> _options = ['سكر', 'قلب', 'ضغط', 'أمراض أخرى', 'لا يوجد'];
  int? _useSelectedIndex = 1;
  final List<String> _useOptions = ['نعم', 'لا'];
  final TextEditingController _numberOfDOController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/wave-point.png',
                height: context.height * 0.12,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: context.height * 0.091),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'ما هى الأمراض المزمنه التى لديك ؟',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  Wrap(
                    spacing: context.width * 0.1,
                    runSpacing: context.height * 0.02,
                    children: List.generate(
                      5,
                      (int index) {
                        return ChoiceChip(
                          padding: const EdgeInsets.all(8),
                          label: Text(_options[index]),
                          labelStyle:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: AppColors.white,
                                  ),
                          selectedColor: AppColors.primary,
                          backgroundColor: Colors.black54,
                          selected: _selectedIndex == index,
                          elevation: 5.0,
                          pressElevation: 0.0,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedIndex = selected ? index : null;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                  InputField(
                    controller: _numberOfDOController,
                    title: ' عدد مرات الغسيل',
                    hint: 'من فضلك أدخل عدد مرات الغسيل',
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'هل سبق ان استخدمت الغسيل البروتونى ؟',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  Wrap(
                    spacing: context.width * 0.1,
                    runSpacing: context.height * 0.02,
                    children: List.generate(
                      2,
                      (int index) {
                        return ChoiceChip(
                          padding: const EdgeInsets.all(8),
                          label: Text(_useOptions[index]),
                          labelStyle:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: AppColors.white,
                                  ),
                          selectedColor: AppColors.primary,
                          backgroundColor: Colors.black54,
                          selected: _useSelectedIndex == index,
                          elevation: 5.0,
                          pressElevation: 0.0,
                          onSelected: (bool selected) {
                            setState(() {
                              _useSelectedIndex = selected ? index : null;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(
                    height: context.height * 0.036,
                  ),
                  CustomButton(
                    label: 'التالي',
                    onTap: () {
                      if (_numberOfDOController.text.isNotEmpty) {
                        Navigator.of(context).pushNamed(Routes.notifyInfoRegisterRoute);
                      } else {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Required',
                          text: 'All fields required',
                        );
                      }
                    },
                    width: context.width * 0.6,
                    height: context.height * 0.06,
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/images/wave.png',
                height: context.height * 0.12,
              ),
            ),
          ].animate(interval: 400.ms).fade(duration: 300.ms),
        ),
      ),
    );
  }
}
