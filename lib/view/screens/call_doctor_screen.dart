import 'package:flutter/material.dart';
import 'package:kidney/core/utils/media_query_values.dart';
import 'package:kidney/view/widgets/doctor_list_item.dart';
import 'package:kidney/view/widgets/frame.dart';

class CallYourDoctorScreen extends StatelessWidget {
  CallYourDoctorScreen({super.key});
  final List<String> _doctorName = [
    'دكتور : ماريو',
    'دكتوره : مريم',
    'دكتوره : رناد',
  ];
  final List<String> _doctorImage = [
    'assets/images/doctor1.jpg',
    'assets/images/doctor2.jpg',
    'assets/images/doctor3.jpg',
  ];
  final List<String> _doctorPhone = [
    '01282204607',
    '01110590332',
    '01098032567',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Frame(
          widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اتصل بطبيبك',
                  style: Theme.of(context).textTheme.headline1,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: context.height * 0.019),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) => DoctorListItem(
                      name: _doctorName[index],
                      image: _doctorImage[index],
                      phoneNumber: _doctorPhone[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
