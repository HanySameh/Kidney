import 'package:flutter/material.dart';
import 'package:kidney/controller/auth_controller.dart';
import 'package:kidney/core/utils/enums.dart';
import 'package:kidney/core/utils/media_query_values.dart';
import 'package:kidney/services/auth_services.dart';
import 'package:kidney/view/widgets/custom_button.dart';
import 'package:kidney/view/widgets/frame.dart';
import 'package:kidney/view/widgets/input_field.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

import '../../config/routes/routes.dart';

class BasicRegisterScreen extends StatelessWidget {
  BasicRegisterScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ChangeNotifierProvider<AuthController>(
        create: (_) => AuthController(auth: auth),
        child: Consumer<AuthController>(
          builder: (_, model, __) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Frame(
                  widget: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Text(
                          'انشاء حساب جديد',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'مسجل بالفعل؟ ',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            InkWell(
                              onTap: () {
                                model.authFormType = AuthFormType.login;
                                Navigator.pushReplacementNamed(
                                    context, Routes.loginRoute);
                              },
                              child: Text(
                                'تسجيل الدخول',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
                        ),
                        InputField(
                          controller: nameController,
                          title: 'الاسم',
                          hint: 'من فضلك أدخل إسمك',
                        ),
                        InputField(
                          controller: emailController,
                          title: 'الايميل',
                          hint: 'الرجاء إدخال البريد الإلكتروني',
                        ),
                        InputField(
                          controller: passController,
                          title: 'الباسورد',
                          hint: 'الرجاء إدخال كلمة المرور',
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: context.height * 0.04,
                            bottom: context.height * 0.03,
                          ),
                          child: CustomButton(
                            width: context.width * 0.6,
                            height: context.height * 0.06,
                            label: 'التالى',
                            onTap: () async {
                              if (model.isLoading) {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.loading,
                                );
                              }
                              if (emailController.text.isNotEmpty ||
                                  emailController.text.isNotEmpty ||
                                  nameController.text.isNotEmpty) {
                                try {
                                  await model.submit(
                                      email: emailController.text,
                                      pass: passController.text);
                                  Navigator.of(context)
                                      .pushNamed(Routes.infoRegisterRoute);
                                  model.loadingState();
                                } catch (e) {
                                  model.loadingState();
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    title: 'fail',
                                    text: e.toString(),
                                  );
                                }
                              } else {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.error,
                                  title: 'Required',
                                  text: 'All fields required',
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
