import 'package:flutter/material.dart';
import 'package:kidney/core/utils/app_colors.dart';
import 'package:kidney/core/utils/media_query_values.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.title,
    required this.hint,
    this.widget,
    this.controller,
    this.obscureText,
    this.suffix = false,
    this.suffixIcon,
    this.suffixPressed,
  }) : super(key: key);

  final String title;
  final String hint;
  final Widget? widget;
  final bool? obscureText;
  final bool? suffix;
  final IconData? suffixIcon;
  final VoidCallback? suffixPressed;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Container(
            width: context.width,
            height: 52.0,
            padding: const EdgeInsets.only(
              left: 14.0,
              right: 14.0,
            ),
            margin: const EdgeInsets.only(
              top: 8.0,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    obscureText: obscureText ?? false,
                    autofocus: false,
                    readOnly: widget != null ? true : false,
                    cursorColor: AppColors.grey,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                      suffix: suffix == false
                          ? null
                          : IconButton(
                              onPressed: suffixPressed,
                              icon: Icon(suffixIcon),
                            ),
                      hintText: hint,
                      hintStyle: Theme.of(context).textTheme.bodyText1,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
                widget ?? Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
