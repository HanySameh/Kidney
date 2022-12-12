import 'package:flutter/material.dart';
import 'package:kidney/cache.dart';
import 'package:kidney/core/utils/app_colors.dart';
import 'package:kidney/core/utils/enums.dart';
import 'package:kidney/core/utils/media_query_values.dart';
import 'package:kidney/view/widgets/custom_button.dart';
import 'package:kidney/view/widgets/frame.dart';
import 'package:kidney/view/widgets/input_field.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

import '../../config/routes/routes.dart';
import '../../controller/auth_controller.dart';
import '../../services/auth_services.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return ChangeNotifierProvider<AuthController>(
      create: (_) => AuthController(auth: auth),
      child: Consumer<AuthController>(
        builder: (_, model, __) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Frame(
                widget: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: context.height * 0.0627,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تسجيل الدخول',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        'قم بتسجيل الدخول للمتابعة',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      InputField(
                        controller: _emailController,
                        title: 'الايميل',
                        hint: 'الرجاء إدخال البريد الإلكتروني',
                      ),
                      InputField(
                        controller: _passController,
                        title: 'الباسورد',
                        hint: 'الرجاء إدخال كلمة المرور',
                        obscureText: model.isPassword,
                        suffix: true,
                        suffixIcon: model.suffix,
                        suffixPressed: () => model.changePasswordVisibility(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: context.height * 0.04,
                          bottom: context.height * 0.03,
                        ),
                        child: CustomButton(
                          width: context.width * 0.6,
                          height: context.height * 0.06,
                          label: 'تسجيل الدخول',
                          onTap: () async {
                            model.authFormType = AuthFormType.login;
                            if (_emailController.text.isNotEmpty ||
                                _passController.text.isNotEmpty) {
                              if (model.isLoading) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      'Loading...',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16.0,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    backgroundColor: AppColors.primary,
                                    behavior: SnackBarBehavior.floating,
                                    elevation: 1.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                );
                              }
                              await model
                                  .submit(
                                      email: _emailController.text,
                                      pass: _passController.text)
                                  .then((value) {
                                Cache.saveData(key: 'login', value: true);
                                Navigator.pushReplacementNamed(
                                    context, Routes.homeRoute);
                                model.loadingState();
                              }).catchError((error) {
                                model.loadingState();
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.error,
                                  text: error.toString(),
                                  title: 'fail',
                                );
                              });
                            } else {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                text: 'All fields require',
                                title: 'Required',
                              );
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'لست مسجل؟ ',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          InkWell(
                            onTap: () {
                              model.authFormType = AuthFormType.register;
                              Navigator.pushReplacementNamed(
                                  context, Routes.registerRoute);
                            },
                            child: Text(
                              'تسجيل',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
