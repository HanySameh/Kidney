import 'package:flutter/material.dart';
import 'package:kidney/core/utils/media_query_values.dart';
import 'package:kidney/view/widgets/doctor_list_item.dart';
import 'package:kidney/view/widgets/frame.dart';

class EmergencyScreen extends StatelessWidget {
  EmergencyScreen({super.key});
  final List<String> _doctorName = [
    'اسعاف',
    'النجده',
  ];
  final List<String> _doctorImage = [
    'assets/images/ambulance.jpeg',
    'assets/images/police.jpeg',
  ];
  final List<String> _doctorPhone = [
    '123',
    '122',
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
                  'ارقام الطوارئ',
                  style: Theme.of(context).textTheme.headline1,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: context.height * 0.195),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) => DoctorListItem(
                    name: _doctorName[index],
                    image: _doctorImage[index],
                    phoneNumber: _doctorPhone[index],
                    hasWhatsapp: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
