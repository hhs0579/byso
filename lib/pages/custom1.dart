import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/%08widget/launch.dart';

import 'package:byso/%08widget/number.dart';
import 'package:byso/model/deskmodel.dart';
import 'package:byso/pages/custom2.dart';
import 'package:byso/pages/custom3.dart';
import 'package:byso/pages/custom4.dart';
import 'package:byso/pages/custom5.dart';
import 'package:byso/pages/home.dart';
import 'package:byso/pages/marble.dart';
import 'package:byso/pages/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class custom1 extends StatefulWidget {
  const custom1({super.key});

  @override
  State<custom1> createState() => _custom1State();
}

class _custom1State extends State<custom1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.7, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  void _onHover(bool isHovering) {
    if (isHovering) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool a = false;
  bool b = false;
  bool c = false;
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeskCustomizationModel>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xff171717),
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MarbleInfo()));
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
          child: Row(
            children: [
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
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
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
                      onTap: () {},
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
                      onTap: () {},
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
                  child: MouseRegion(
                      onEnter: (event) => _onHover(true),
                      onExit: (event) => _onHover(false),
                      child: Transform.scale(
                        scale: _animation.value,
                        child: Image.asset(
                          model.currentLegImage, // 이미지 경로를 적절히 변경하세요.
                          fit: BoxFit.contain,
                        ),
                      ))),
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        color: const Color(0xff101010),
                        padding: EdgeInsets.only(
                            top: 40.h, right: 30.w, left: 30.w, bottom: 40.h),
                        height: height * 1.5,
                        width: width * 0.28,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                '테이블 레그를 선택해주세요',
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
                            InkWell(
                              onTap: () {
                                model.setLegType('사리넨(정원형)'); // 사용자 선택 반영
                                // 가격 누적
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: width * 0.25,
                                height: height * 0.15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      '사리넨(정원형)',
                                      maxFontSize: 24,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: width * 0.05,
                                            height: height * 0.07,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border:
                                                    model.legType == '사리넨(정원형)'
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 1.5,
                                                          )
                                                        : const Border()),
                                            child: Image.asset(
                                              'assets/images/legA.png',
                                              fit: BoxFit.contain,
                                            )),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              '소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                            AutoSizeText(
                                              '제조사',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'HPL 소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            ),
                                            AutoSizeText(
                                              '플렌트란스',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey[500],
                              width: width * 0.25,
                              height: 1,
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            InkWell(
                              onTap: () {
                                model.setLegType('사리넨(타원형)'); // 사용자 선택 반영
                                // 가격 누적
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: width * 0.25,
                                height: height * 0.15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      '사리넨(타원형)',
                                      maxFontSize: 24,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: width * 0.05,
                                            height: height * 0.07,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border:
                                                    model.legType == '사리넨(타원형)'
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 1.5,
                                                          )
                                                        : const Border()),
                                            child: Image.asset(
                                              'assets/images/legA.png',
                                              fit: BoxFit.contain,
                                            )),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              '소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                            AutoSizeText(
                                              '제조사',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'HPL 소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            ),
                                            AutoSizeText(
                                              '플렌트란스',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey[500],
                              width: width * 0.25,
                              height: 1,
                            ),
                            InkWell(
                              onTap: () {
                                model.setLegType('개트윅'); // 사용자 선택 반영
                                // 가격 누적
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 20.h),
                                alignment: Alignment.centerLeft,
                                width: width * 0.25,
                                height: height * 0.17,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        '개트윅',
                                        maxFontSize: 24,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: width * 0.05,
                                            height: height * 0.07,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: model.legType == '개트윅'
                                                    ? Border.all(
                                                        color: Colors.white,
                                                        width: 1.5,
                                                      )
                                                    : const Border()),
                                            child: Image.asset(
                                                'assets/images/legB.png',
                                                fit: BoxFit.cover)),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              '소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                            AutoSizeText(
                                              '제조사',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'HPL 소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            ),
                                            AutoSizeText(
                                              '플렌트란스',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey[500],
                              width: width * 0.25,
                              height: 1,
                            ),
                            InkWell(
                              onTap: () {
                                model.setLegType('샹베리'); // 사용자 선택 반영
                                // 가격 누적
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 20.h),
                                alignment: Alignment.centerLeft,
                                width: width * 0.25,
                                height: height * 0.17,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        '샹베리',
                                        maxFontSize: 24,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: width * 0.05,
                                            height: height * 0.07,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: model.legType == '샹베리'
                                                    ? Border.all(
                                                        color: Colors.white,
                                                        width: 1.5,
                                                      )
                                                    : const Border()),
                                            child: Image.asset(
                                                'assets/images/legC.png',
                                                fit: BoxFit.cover)),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              '소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                            AutoSizeText(
                                              '제조사',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'HPL 소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            ),
                                            AutoSizeText(
                                              '플렌트란스',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey[500],
                              width: width * 0.25,
                              height: 1,
                            ),
                            InkWell(
                              onTap: () {
                                model.setLegType('라고스'); // 사용자 선택 반영
                                // 가격 누적
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 20.h),
                                alignment: Alignment.centerLeft,
                                width: width * 0.25,
                                height: height * 0.17,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        '라고스',
                                        maxFontSize: 24,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: width * 0.05,
                                            height: height * 0.07,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: model.legType == '라고스'
                                                    ? Border.all(
                                                        color: Colors.white,
                                                        width: 1.5,
                                                      )
                                                    : const Border()),
                                            child: Image.asset(
                                                'assets/images/legD.png',
                                                fit: BoxFit.cover)),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              '소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                            AutoSizeText(
                                              '제조사',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'HPL 소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            ),
                                            AutoSizeText(
                                              '플렌트란스',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey[500],
                              width: width * 0.25,
                              height: 1,
                            ),
                            Container(
                              color: Colors.grey[500],
                              width: width * 0.25,
                              height: 1,
                            ),
                            InkWell(
                              onTap: () {
                                model.setLegType('디디모스'); // 사용자 선택 반영
                                // 가격 누적
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 20.h),
                                alignment: Alignment.centerLeft,
                                width: width * 0.25,
                                height: height * 0.17,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        '디디모스',
                                        maxFontSize: 24,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: width * 0.05,
                                            height: height * 0.07,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: model.legType == '디디모스'
                                                    ? Border.all(
                                                        color: Colors.white,
                                                        width: 1.5,
                                                      )
                                                    : const Border()),
                                            child: Image.asset(
                                                'assets/images/legE.png',
                                                fit: BoxFit.contain)),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              '소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                            AutoSizeText(
                                              '제조사',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'HPL 소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            ),
                                            AutoSizeText(
                                              '플렌트란스',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey[500],
                              width: width * 0.25,
                              height: 1,
                            ),
                            Container(
                              color: Colors.grey[500],
                              width: width * 0.25,
                              height: 1,
                            ),
                            InkWell(
                              onTap: () {
                                model.setLegType('리프 다이닝'); // 사용자 선택 반영
                                // 가격 누적
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 20.h),
                                alignment: Alignment.centerLeft,
                                width: width * 0.25,
                                height: height * 0.15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        '리프 다이닝',
                                        maxFontSize: 24,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: width * 0.05,
                                            height: height * 0.07,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border:
                                                    model.legType == '리프 다이닝'
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 1.5,
                                                          )
                                                        : const Border()),
                                            child: Image.asset(
                                                'assets/images/legF.png',
                                                fit: BoxFit.contain)),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              '소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                            AutoSizeText(
                                              '제조사',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'HPL 소재',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            ),
                                            AutoSizeText(
                                              '플렌트란스',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 40.h, right: 30.w, left: 30.w, bottom: 40.h),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: const Color(0xff101010),
                      border: Border(
                          top: BorderSide(color: Colors.grey[500]!, width: 1)),
                    ),
                    width: width * 0.28,
                    height: height * 0.21,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          '가격',
                          maxFontSize: 18,
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 16.sp),
                        ),
                        AutoSizeText(
                          '${formatPriceWithCommas(model.currentPrice)}원',
                          maxFontSize: 24,
                          style:
                              TextStyle(fontSize: 22.sp, color: Colors.white),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: width * 0.115,
                                height: height * 0.04,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.white, width: 1)),
                                child: AutoSizeText(
                                  '이전',
                                  maxFontSize: 18,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(createRoute(const custom2()));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: width * 0.115,
                                height: height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.white, width: 1)),
                                child: AutoSizeText(
                                  '다음',
                                  maxFontSize: 18,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
