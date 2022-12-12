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

class InfoRegisterScreen extends StatefulWidget {
  const InfoRegisterScreen({super.key});

  @override
  State<InfoRegisterScreen> createState() => _InfoRegisterScreenState();
}

class _InfoRegisterScreenState extends State<InfoRegisterScreen> {
  int? _selectedIndex = 0;
  final List<String> _options = ['ذكر', 'أنثى'];
  final List<IconData> _avatars = [Icons.male, Icons.female];
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputField(
                    controller: _ageController,
                    title: 'السن',
                    hint: 'من فضلك أدخل السن',
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'من فضلك أدخال النوع',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  Wrap(
                    spacing: context.width * 0.1,
                    children: List.generate(
                      2,
                      (int index) {
                        return ChoiceChip(
                          padding: const EdgeInsets.all(8),
                          label: Text(_options[index]),
                          labelStyle:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: AppColors.white,
                                  ),
                          avatar: Icon(
                            _avatars[index],
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
                    controller: _weightController,
                    title: 'الوزن',
                    hint: 'من فضلك أدخل الوزن',
                  ),
                  InputField(
                    controller: _phoneController,
                    title: 'الهاتف',
                    hint: 'من فضلك أدخل رقم الهاتف',
                  ),
                  InputField(
                    controller: _addressController,
                    title: 'العنوان',
                    hint: 'الرجاء إدخال العنوان',
                  ),
                  SizedBox(
                    height: context.height * 0.036,
                  ),
                  CustomButton(
                    label: 'التالي',
                    onTap: () {
                      if (_ageController.text.isNotEmpty ||
                          _weightController.text.isNotEmpty ||
                          _phoneController.text.isNotEmpty ||
                          _addressController.text.isNotEmpty) {
                        Navigator.of(context)
                            .pushNamed(Routes.moreInfoRegisterRoute);
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
