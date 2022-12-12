import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorListItem extends StatelessWidget {
  const DoctorListItem(
      {super.key,
      required this.name,
      required this.image,
      required this.phoneNumber,
      this.hasWhatsapp = true});
  final String name;
  final String image;
  final String phoneNumber;
  final bool? hasWhatsapp;
  Future<void> _sentMessageWhatsapp({
    required String phoneNumber,
    required String message,
  }) async {
    final whatsappUrl =
        "whatsapp://send?phone=${'+20$phoneNumber'}&text=${Uri.encodeComponent(message)}";
    try {
      launchUrl(Uri.parse(whatsappUrl));
    } catch (e) {
      //To handle error and display error message
    }
  }
    Future<void> _makePhoneCall({required String phoneNumber}) async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }

    @override
    Widget build(BuildContext context) {
      return Card(
        elevation: 6.0,
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 150,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 25),
                ),
                Text(
                  phoneNumber,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => _makePhoneCall(phoneNumber: phoneNumber),
                      icon: const Icon(Icons.call),
                    ),
                    if (hasWhatsapp == true)
                      IconButton(
                        onPressed: () => _sentMessageWhatsapp(
                            phoneNumber: phoneNumber, message: 'hello'),
                        icon: const Icon(Icons.whatsapp),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

