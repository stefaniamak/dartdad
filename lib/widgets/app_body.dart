import 'package:dart_dad/consts/assets/app_colors.dart';
import 'package:dart_dad/consts/assets/app_consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  final TextEditingController _textEditingController = TextEditingController();

  // Define your target matches
  final targetMatches = [
    MatchTargetItem.pattern(
      r'main|variable|print', // Match exact text
      style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
    ),
    MatchTargetItem.pattern(
      r'\"|Mike|Julia|Result|\:|\"|\"', // Match exact text
      style: const TextStyle(color: Colors.red),
      onTap: (match) {
        print('Tapped on match: $match');
      },
    ),
  ];

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
                    controller: RichTextController(
                      text: """
void main() {
  var variable = "Mike";
  var variable = "Julia";

  print("Result: \${variable = variable}");
}
                      """,
                      targetMatches: targetMatches,
                      onMatch: (matches) {},
                    ),
                    decoration: null,
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
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
