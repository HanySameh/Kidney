import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kidney/cache.dart';
import 'package:kidney/core/utils/app_strings.dart';
import 'package:kidney/models/notify_model.dart';
import 'package:kidney/view/widgets/frame.dart';

import 'package:kidney/core/utils/media_query_values.dart';

import '../../config/routes/routes.dart';
import '../../core/utils/app_colors.dart';
import '../../services/notification_services.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_field.dart';

class NotifyInfoScreen extends StatefulWidget {
  const NotifyInfoScreen({super.key});

  @override
  State<NotifyInfoScreen> createState() => _NotifyInfoScreenState();
}

class _NotifyInfoScreenState extends State<NotifyInfoScreen> {
  DateTime selectDate = DateTime.now();

  String startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();

  int selectRemind = 5;

  List<int> remindList = [5, 10, 15, 20];

  String selectRepeat = 'بدون تكرار';

  // List<String> repeatList = ['none', 'Daily', 'Weekly', 'Monthly'];
  List<String> repeatList = ['بدون تكرار', 'يومي', 'اسبوعي', 'شهري'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Frame(
          widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.height * 0.054,
                ),
                Text(
                  'الاشعارات',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputField(
                        title: 'التاريخ',
                        hint: DateFormat.yMd().format(selectDate),
                        widget: IconButton(
                          onPressed: () async {
                            DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: selectDate,
                              firstDate: DateTime(2016),
                              lastDate: DateTime(2040),
                            );
                            if (date != null) {
                              setState(() {
                                selectDate = date;
                              });
                            } else {
                              debugPrint('no date selected');
                            }
                          },
                          icon: const Icon(
                            Icons.calendar_today_outlined,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.02,
                    ),
                    Expanded(
                      child: InputField(
                        title: 'الوقت',
                        hint: startTime,
                        widget: IconButton(
                          onPressed: () async {
                            TimeOfDay? picStartTime = await showTimePicker(
                              context: context,
                              initialTime:
                                  TimeOfDay.fromDateTime(DateTime.now()),
                            );
                            if (picStartTime != null) {
                              setState(() {
                                startTime = picStartTime.format(context);
                              });
                            } else {
                              debugPrint('no time selected');
                            }
                          },
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                InputField(
                  title: 'التذكير',
                  hint: 'قبل الموعد بـ $selectRemind د',
                  widget: DropdownButton(
                    dropdownColor: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10.0),
                    items: remindList
                        .map<DropdownMenuItem<String>>(
                          (int value) => DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(
                              '$value',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectRemind = int.parse(newValue!);
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 32.0,
                    elevation: 4,
                    style: Theme.of(context).textTheme.subtitle1,
                    underline: Container(
                      height: 0.0,
                    ),
                  ),
                ),
                InputField(
                  title: 'التكرار',
                  hint: selectRepeat,
                  widget: Row(
                    children: [
                      DropdownButton(
                        dropdownColor: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10.0),
                        items: repeatList
                            .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectRepeat = newValue!;
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 32.0,
                        elevation: 4,
                        style: Theme.of(context).textTheme.subtitle1,
                        underline: Container(
                          height: 0.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.height * 0.036,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    label: 'اشتراك',
                    onTap: () {
                      final NotifyModel notifyModel = NotifyModel(
                        date: DateFormat.yMd().format(selectDate),
                        startTime: startTime,
                        remind: selectRemind,
                        repeat: selectRepeat,
                      );
                      debugPrint(notifyModel.date);
                      debugPrint(notifyModel.startTime);
                      debugPrint(notifyModel.remind.toString());
                      debugPrint(notifyModel.repeat);
                      final date = DateFormat.jm().parse(startTime);
                      final time = DateFormat('HH:MM').format(date);
                      NotificationServices().scheduledNotification(
                        int.parse(time.toString().split(':')[0]),
                        int.parse(time.toString().split(':')[1]),
                        notifyModel,
                      );
                      Navigator.of(context).pushNamed(Routes.loginRoute);
                    },
                    width: context.width * 0.6,
                    height: context.height * 0.06,
                  ),
                ),
                SizedBox(
                  height: context.height * 0.06,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
