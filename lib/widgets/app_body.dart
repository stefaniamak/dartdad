import 'dart:math';

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
  var random = Random();
  bool isFakeLoading = false;

  int totalLines = 1;
  String codeResults = '';
  RichTextController richTextController = RichTextController(
    text: """
void main() {
  var variable = "Mike";
  var variable = "Julia";
 
  print("Result: \${variable = variable}");
}
                    """,
    onMatch: (matches) {},
    targetMatches: [
      MatchTargetItem.pattern(
        r'main|variable|print', // Match exact text
        style: const TextStyle(color: Color(AppColors.blueColor)),
      ),
      MatchTargetItem.pattern(
        r'\"|Mike|Julia|Result|\:|\"|\"', // Match exact text
        style: const TextStyle(
          color: Color(AppColors.redColor),
          fontWeight: FontWeight.bold,
        ),
        onTap: (match) {
          print('Tapped on match: $match');
        },
      ),
    ],
  );

  @override
  void initState() {
    super.initState();

    richTextController.addListener(() {
      setState(() {
        totalLines = richTextController.text.split('\n').length;
      });
    });
  }

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
                  left: AppConsts.spacing24,
                  bottom: AppConsts.spacing8,
                  right: AppConsts.spacing8,
                  child: Row(
                    spacing: AppConsts.spacing8,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(
                          richTextController.text.split('\n').length,
                          (int index) => Text(
                            (index + 1).toString(),
                            style: AppTextStyles.codeTextStyle.copyWith(
                              color: Color(AppColors.greyColor),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [Expanded(child: buildCodeTextField())],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: AppConsts.spacing16,
                  right: AppConsts.spacing24,
                  child: Row(
                    spacing: AppConsts.spacing16,
                    children: [
                      Row(
                        spacing: AppConsts.spacing8,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.query_builder,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.file_copy_outlined,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.format_align_left,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      FilledButton.icon(
                        onPressed: () {
                          setState(() {
                            print('loading');
                            isFakeLoading = true;
                            Future.delayed(
                              Duration(milliseconds: random.nextInt(1000)),
                            ).then((_) {
                              print('delay');
                              setState(() {
                                isFakeLoading = false;
                                codeResults = '';
                              });
                              Future.delayed(
                                Duration(seconds: random.nextInt(4)),
                              ).then((_) {
                                // if variable = variable => true | same name
                                // if variable == variable => false | same value
                                setState(() {
                                  if (richTextController.text.contains('==')) {
                                    codeResults = 'Result: false';
                                  } else {
                                    codeResults = 'Result: true';
                                  }
                                });
                              });
                            });
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
                              child: SelectableText(
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

                                print(
                                  richTextController.text.split('\n').length,
                                );
                              },
                              icon: Icon(
                                Icons.delete_sweep,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isFakeLoading)
                        Positioned.fill(
                          child: Container(
                            color: Color(AppColors.primaryColor).withAlpha(190),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Color(AppColors.loaderColor),
                              ),
                            ),
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
      controller: richTextController,
      decoration: null,
      cursorColor: Colors.white,
      style: AppTextStyles.codeTextStyle.copyWith(fontWeight: FontWeight.bold),
      maxLines: null,
      expands: true,
    );
  }
}
