import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/%08widget/alert.dart';
import 'package:byso/%08widget/back.dart';
import 'package:byso/%08widget/number.dart';
import 'package:byso/%08widget/option.dart';
import 'package:byso/%08widget/shipping.dart';
import 'package:byso/model/deskmodel.dart';
import 'package:byso/pages/custom1.dart';
import 'package:byso/pages/custom2.dart';
import 'package:byso/pages/custom3.dart';
import 'package:byso/pages/custom4.dart';
import 'package:byso/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class custom5 extends StatelessWidget {
  const custom5({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final model = Provider.of<DeskCustomizationModel>(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: Container(
            color: const Color(0xff171717),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                  backgroundColor: const Color(0xff171717),
                  title: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const home()));
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
                        AutoSizeText(
                          'PRODUCT',
                          maxFontSize: 20,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        AutoSizeText(
                          'MARVEL CUSTOM',
                          maxFontSize: 20,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w200,
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
        body: Container(
          color: const Color(0xff171717),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const custom1()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const custom2()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const custom3()));
                    },
                    child: AutoSizeText(
                      '상판 패턴 선택',
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const custom4()));
                    },
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const custom5()));
                    },
                    child: AutoSizeText(
                      '최종 견적 확인',
                      maxFontSize: 18,
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  color: const Color(0xff171717),
                  height: height * 0.65,
                  width: width * 0.6,
                  child: Image.asset(
                    model.getCurrentPatternImage2, // 이미지 경로를 적절히 변경하세요.
                    fit: BoxFit.contain,
                    scale: 4,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  color: const Color(0xff171717),
                  width: width * 0.55,
                  height: height * 0.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      AutoSizeText(
                        '견적 신청하기',
                        maxFontSize: 22,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                '성함',
                                maxFontSize: 18,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: width * 0.15,
                                height: 50.h,
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    hintText: '성함',
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 14.sp),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        10.0, // 왼쪽 패딩
                                        (50.h - 14.sp) / 4, // 상단 패딩을 줄임
                                        10.0, // 오른쪽 패딩
                                        (50.h - 14.sp) / 4 // 하단 패딩을 줄임
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                '연락처',
                                maxFontSize: 18,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                width: width * 0.15,
                                height: 50.h,
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    hintText: '연락처',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        10.0, // 왼쪽 패딩
                                        (50.h - 14.sp) / 4, // 상단 패딩을 줄임
                                        10.0, // 오른쪽 패딩
                                        (50.h - 14.sp) / 4 // 하단 패딩을 줄임
                                        ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                '이메일',
                                maxFontSize: 18,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                width: width * 0.15,
                                height: 50.h,
                                child: TextField(
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    hintText: '이메일',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        10.0, // 왼쪽 패딩
                                        (50.h - 14.sp) / 4, // 상단 패딩을 줄임
                                        10.0, // 오른쪽 패딩
                                        (50.h - 14.sp) / 4 // 하단 패딩을 줄임
                                        ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                        onTap: () {
                        myAlert(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          width: width * 0.6,
                          height: 50.h,
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            '견적서 보내기',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                            maxFontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
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
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    '최종 견적을 확인해주세요',
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
                                const SummaryWidget()
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
                              top: 40.h, right: 30.w, left: 30.w, bottom: 40.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                '총가격',
                                textAlign: TextAlign.start,
                                maxFontSize: 18,
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 16.sp),
                              ),
                              AutoSizeText(
                                '${formatPriceWithCommas(model.currentPrice)}원',
                                maxFontSize: 24,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 22.sp, color: Colors.white),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ]),
        ));
  }
}
