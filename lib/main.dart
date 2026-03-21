import 'package:dart_dad/consts/assets/app_colors.dart';
import 'package:dart_dad/consts/assets/app_consts.dart';
import 'package:dart_dad/widgets/app_body.dart';
import 'package:dart_dad/widgets/app_bottom_navigation_bar.dart';
import 'package:dart_dad/widgets/app_header.dart';
import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Color(AppColors.loaderColor).withAlpha(90),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            iconSize: AppConsts.iconSize16,
            minimumSize: Size(AppConsts.spacing32, AppConsts.spacing32),
            backgroundColor: Color(AppColors.iconButtonBlueColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConsts.spacing46),
            ),
          ),
        ),
      ),

      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.primaryColor),
      appBar: AppBar(
        toolbarHeight: AppConsts.kAppToolbarHeight,
        backgroundColor: Color(AppColors.primaryColor),
        title: AppHeader(),
        titleTextStyle: TextStyle(color: Colors.white),
        titleSpacing: AppConsts.spacing8,
      ),
      body: AppBody(),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
