import 'package:flutter/material.dart';
import 'package:kidney/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.label, required this.onTap, required this.width, required this.height})
      : super(key: key);
  final String label;
  final Function() onTap;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.primary,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
