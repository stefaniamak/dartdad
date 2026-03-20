import 'package:dart_dad/consts/assets/app_colors.dart';
import 'package:dart_dad/consts/assets/app_consts.dart';
import 'package:dart_dad/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  String codeResults = 'test';

  // Define your target matches
  final targetMatches = [
    MatchTargetItem.pattern(
      r'main|variable|print', // Match exact text
      style: const TextStyle(
        color: Color(AppColors.blueColor),
        fontWeight: FontWeight.bold,
      ),
    ),
    MatchTargetItem.pattern(
      r'\"|Mike|Julia|Result|\:|\"|\"', // Match exact text
      style: const TextStyle(color: Color(AppColors.redColor)),
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
            child: Stack(
              children: [
                Positioned(
                  top: AppConsts.spacing8,
                  left: AppConsts.spacing8,
                  bottom: AppConsts.spacing8,
                  right: AppConsts.spacing8,
                  child: Column(
                    children: [Expanded(child: buildCodeTextField())],
                  ),
                ),
                Positioned(
                  top: AppConsts.spacing16,
                  right: AppConsts.spacing24,
                  child: Row(
                    children: [
                      FilledButton.icon(
                        onPressed: () {
                          setState(() {
                            codeResults = 'Result: true';
                          });
                        },
                        icon: Icon(Icons.play_arrow),
                        label: Text('Run'),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(AppColors.lightBlueColor),
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            horizontal: AppConsts.spacing12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppConsts.spacing4),
                            ),
                          ),
                        ),
                      ),
                    ],
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
              Expanded(
                child: Container(
                  color: Color(AppColors.darkColor),

                  child: Stack(
                    children: [
                      Positioned(
                        top: AppConsts.spacing8,
                        left: AppConsts.spacing8,
                        bottom: AppConsts.spacing8,
                        right: AppConsts.spacing8,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                codeResults,
                                style: AppTextStyles.codeTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        top: AppConsts.spacing16,
                        right: AppConsts.spacing24,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  codeResults = '';
                                });
                              },
                              icon: Icon(
                                Icons.delete_sweep,
                                color: Colors.white,
                                size: AppConsts.iconSize18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextField buildCodeTextField() {
    return TextField(
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
      style: AppTextStyles.codeTextStyle,
      maxLines: null,
      expands: true,
    );
  }
}
