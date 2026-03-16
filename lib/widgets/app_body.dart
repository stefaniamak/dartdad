import 'package:dart_dad/consts/assets/app_colors.dart';
import 'package:dart_dad/consts/assets/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppConsts.spacing8,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Color(AppColors.darkColor),
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: null,
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.firaCode().fontFamily,
                    ),
                    maxLines: null,
                    expands: true,
                  ),
                ),
              ],
            ),
          ),
        ),
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
