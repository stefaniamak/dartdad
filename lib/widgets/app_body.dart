import 'package:dart_dad/consts/assets/app_colors.dart';
import 'package:dart_dad/consts/assets/app_consts.dart';
import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppConsts.spacing8,
      children: <Widget>[
        Expanded(child: Container(color: Color(AppColors.darkColor))),
        Expanded(
          child: Column(
            spacing: AppConsts.spacing8,
            children: [
              Expanded(child: Container(color: Color(AppColors.darkColor))),
              Expanded(child: Container(color: Color(AppColors.darkColor))),
            ],
          ),
        ),
      ],
    );
  }
}
