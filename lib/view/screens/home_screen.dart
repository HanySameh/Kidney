import 'package:flutter/material.dart';
import 'package:kidney/cache.dart';
import 'package:kidney/core/utils/media_query_values.dart';
import 'package:kidney/services/auth_services.dart';
import 'package:kidney/view/widgets/frame.dart';
import 'package:kidney/view/widgets/grId_item.dart';
import 'package:provider/provider.dart';

import '../../config/routes/routes.dart';
import '../../controller/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
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
                widget: Column(
                  children: [
                    Wrap(
                      children: [
                        GridItem(
                          icon: Icons.emergency,
                          title: 'ارقام طوارئ',
                          onTap: () => Navigator.pushNamed(
                              context, Routes.emergencyRoute),
                        ),
                        GridItem(
                          icon: Icons.local_hospital,
                          title: 'اتصال بالطبيب',
                          onTap: () => Navigator.pushNamed(
                              context, Routes.callDoctorRoute),
                        ),
                        GridItem(
                          icon: Icons.food_bank,
                          title: 'انظمه غذائيه',
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.foodRoute),
                        ),
                        GridItem(
                          icon: Icons.medical_services_outlined,
                          title: 'ادويه',
                          onTap: () => Navigator.pushNamed(
                              context, Routes.treatmentRoute),
                        ),
                        GridItem(
                          icon: Icons.question_mark_outlined,
                          title: 'اعرف اكثر',
                          onTap: () => Navigator.pushNamed(
                              context, Routes.learnMoreRoute),
                        ),
                        GridItem(
                          icon: Icons.logout,
                          title: 'الخروج',
                          onTap: () {
                            auth.logout();
                            Cache.removeData(key: 'login');
                            Navigator.pushReplacementNamed(
                                context, Routes.registerRoute);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.0052,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
