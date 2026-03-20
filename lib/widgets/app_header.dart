import 'package:dart_dad/consts/assets/app_assets.dart';
import 'package:dart_dad/consts/assets/app_consts.dart';
import 'package:dart_dad/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppConsts.spacing8,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.network(
              AppAssets.dartLogoUrl,
              width: AppConsts.spacing36,
            ),
            Text('DartDad', style: AppTextStyles.nameTextStyle),
          ],
        ),
        Row(
          spacing: AppConsts.spacing16,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.get_app_rounded, color: Colors.white),
              label: Text('Open in', style: TextStyle(color: Colors.white)),
            ),
            Icon(Icons.light_mode_outlined, color: Colors.white),
            Icon(Icons.more_vert, color: Colors.white),
          ],
        ),
      ],
    );
  }
}
