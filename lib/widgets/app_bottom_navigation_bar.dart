import 'package:dart_dad/consts/assets/app_colors.dart';
import 'package:dart_dad/consts/assets/app_consts.dart';
import 'package:dart_dad/consts/text_styles.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConsts.kAppToolbarHeight,
      color: Color(AppColors.primaryColor),
      padding: EdgeInsets.symmetric(horizontal: AppConsts.spacing36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: AppConsts.spacing46,
            children: [
              Icon(
                Icons.keyboard,
                color: Colors.white,
                size: AppConsts.iconSize20,
              ),
              Row(
                spacing: AppConsts.spacing8,
                children: [
                  Text('Privacy notice', style: AppTextStyles.bodyTextStyle),
                  Icon(
                    Icons.ios_share,
                    color: Colors.white,
                    size: AppConsts.iconSize18,
                  ),
                ],
              ),
              Row(
                spacing: AppConsts.spacing8,
                children: [
                  Text('Feedback', style: AppTextStyles.bodyTextStyle),
                  Icon(
                    Icons.ios_share,
                    color: Colors.white,
                    size: AppConsts.iconSize18,
                  ),
                ],
              ),
            ],
          ),
          Row(
            spacing: AppConsts.spacing46,
            children: [
              Row(
                spacing: AppConsts.spacing8,
                children: [
                  Icon(Icons.info_outline, size: 22, color: Colors.white),
                  Text(
                    'Dart 3.11.0 • Flutter 3.41.2',
                    style: AppTextStyles.bodyTextStyle,
                  ),
                ],
              ),
              Row(
                spacing: AppConsts.spacing8,
                children: [
                  Icon(Icons.sort_outlined, size: 22, color: Colors.white),
                  Text('Stable channel', style: AppTextStyles.bodyTextStyle),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
