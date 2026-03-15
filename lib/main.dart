import 'package:dart_dad/consts/assets/app_assets.dart';
import 'package:dart_dad/consts/assets/app_colors.dart';
import 'package:dart_dad/consts/assets/app_consts.dart';
import 'package:dart_dad/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DartDad',
      home: const MyHomePage(title: 'DartDad'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppConsts.kAppToolbarHeight,
        backgroundColor: Color(AppColors.primaryColor),
        title: Row(
          spacing: AppConsts.spacing8,
          children: [
            SvgPicture.network(
              AppAssets.dartLogoUrl,
              width: AppConsts.spacing36,
            ),
            Text(widget.title, style: AppTextStyles.nameTextStyle),
          ],
        ),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      bottomNavigationBar: Container(
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
              ],
            ),
            Row(
              spacing: AppConsts.spacing46,
              children: [
                Row(
                  spacing: AppConsts.spacing8,
                  children: [
                    Icon(
                      Icons.settings_input_component,
                      size: 22,
                      color: Colors.white,
                    ),
                    Text(
                      'Dart 3.11.0 • Flutter 3.41.2',
                      style: AppTextStyles.bodyTextStyle,
                    ),
                  ],
                ),
                Row(
                  spacing: AppConsts.spacing8,
                  children: [
                    Icon(Icons.info_outline, size: 22, color: Colors.white),
                    Text('Stable channel', style: AppTextStyles.bodyTextStyle),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
