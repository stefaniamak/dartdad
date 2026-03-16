import 'package:dart_dad/consts/assets/app_colors.dart';
import 'package:dart_dad/consts/assets/app_consts.dart';
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
    return MaterialApp(title: 'DartDad', home: const MyHomePage());
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
      ),
      body: Row(
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
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
