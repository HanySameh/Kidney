import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class GridItem extends StatelessWidget {
  const GridItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.primary,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 100.0,
              color: AppColors.white,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
