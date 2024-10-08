import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/%08widget/back.dart';
import 'package:byso/%08widget/launch.dart';
import 'package:byso/%08widget/number.dart';
import 'package:byso/%08widget/patternpicker.dart';
import 'package:byso/model/deskmodel.dart';
import 'package:byso/pages/custom1.dart';
import 'package:byso/pages/custom2.dart';
import 'package:byso/pages/custom4.dart';
import 'package:byso/pages/home.dart';
import 'package:byso/pages/marble.dart';
import 'package:byso/pages/route.dart';
import 'package:byso/pages/route/customRoute4.dart';
import 'package:byso/pages/route/homeRoute.dart';
import 'package:byso/pages/route/mbyso.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class custom3 extends StatelessWidget {
  const custom3({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final model = Provider.of<DeskCustomizationModel>(context);
    return Consumer<DeskCustomizationModel>(builder: (context, model, child) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: Container(
              color: const Color(0xff171717),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBar(
                    scrolledUnderElevation: 0,
                    backgroundColor: const Color(0xff171717),
                    title: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(createRoute(const HomeRoute()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'assets/images/logo.png',
                          scale: 4,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    leading: null,
                    actions: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(createRoute(const mbyso()));
                            },
                            child: AutoSizeText(
                              'MARBLE INFO',
                              maxFontSize: 20,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          InkWell(
                            onTap: () {
                              launch2(
                                'https://byso.kr/',
                              );
                            },
                            child: AutoSizeText(
                              'BYSO HOMEPAGE',
                              maxFontSize: 20,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: SizedBox(
            height: height,
            width: width,
            child: Row(children: [
              Container(
                color: const Color(0xff101010),
                width: width * 0.12,
                height: height,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    InkWell(
                      onTap: () {
                        model.revertAndResetSelections(context, 1);
                      },
                      child: AutoSizeText(
                        '테이블 레그 선택',
                        maxFontSize: 18,
                        style: TextStyle(
                            color: const Color(0xff7D7D7D), fontSize: 14.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[400],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        model.revertAndResetSelections(context, 2);
                      },
                      child: AutoSizeText(
                        '레그 컬러 선택',
                        maxFontSize: 18,
                        style: TextStyle(
                            color: const Color(0xff7D7D7D), fontSize: 14.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[400],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        model.revertAndResetSelections(context, 3);
                      },
                      child: AutoSizeText(
                        '상판 패턴 선택',
                        maxFontSize: 18,
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[400],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: AutoSizeText(
                        '부가정보 선택',
                        maxFontSize: 18,
                        style: TextStyle(
                            color: const Color(0xff7D7D7D), fontSize: 14.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[400],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: AutoSizeText(
                        '최종 견적 확인',
                        maxFontSize: 18,
                        style: TextStyle(
                            color: const Color(0xff7D7D7D), fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: const Color(0xff171717),
                height: height,
                width: width * 0.6,
                child: Image.asset(
                  model.currentPatternImage, // 이미지 경로를 적절히 변경하세요.
                  fit: BoxFit.contain,
                  scale: 4,
                ),
              ),
              Container(
                  color: const Color(0xff101010),
                  height: height,
                  width: width * 0.28,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 40.h,
                                  right: 30.w,
                                  left: 30.w,
                                  bottom: 40.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: AutoSizeText(
                                      '상판 패턴을 선택해주세요',
                                      maxFontSize: 20,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Container(
                                    color: Colors.grey[500],
                                    width: width * 0.25,
                                    height: 1,
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  const PatternPicker1Widget(),
                                  const SizedBox(height: 16.0),
                                  const PatternPicker2Widget(),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: width,
                            height: 1,
                            color: Colors.grey[500],
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 40.h,
                                right: 30.w,
                                left: 30.w,
                                bottom: 40.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  '가격',
                                  textAlign: TextAlign.start,
                                  maxFontSize: 18,
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 16.sp),
                                ),
                                Consumer<DeskCustomizationModel>(
                                  builder: (context, model, child) {
                                    // 이 부분에서 model.currentPrice를 UI에 반영합니다.
                                    // 예를 들어, 가격을 표시하는 Text 위젯이 있다면 다음과 같이 작성할 수 있습니다.
                                    return AutoSizeText(
                                      '+${formatPriceWithCommas(model.currentPrice)}원',
                                      maxFontSize: 24,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 22.sp, color: Colors.white),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        model.revertAndResetSelections(
                                            context, 2);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: width * 0.115,
                                        height: height * 0.04,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.white, width: 1)),
                                        child: AutoSizeText(
                                          '이전',
                                          maxFontSize: 18,
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            createRoute(const customRoute4()));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: width * 0.115,
                                        height: height * 0.04,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.white, width: 1)),
                                        child: AutoSizeText(
                                          '다음',
                                          maxFontSize: 18,
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ]),
          ));
    });
  }
}
