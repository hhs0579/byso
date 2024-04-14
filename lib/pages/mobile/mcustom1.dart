import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/%08widget/launch.dart';
import 'package:byso/%08widget/number.dart';
import 'package:byso/model/deskmodel.dart';
import 'package:byso/pages/custom1.dart';
import 'package:byso/pages/custom2.dart';
import 'package:byso/pages/marble.dart';
import 'package:byso/pages/mobile/mhome.dart';
import 'package:byso/pages/route.dart';
import 'package:byso/pages/route/customRoute2.dart';
import 'package:byso/pages/route/homeRoute.dart';
import 'package:byso/pages/route/mbyso.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class mcustom1 extends StatefulWidget {
  const mcustom1({super.key});

  @override
  State<mcustom1> createState() => _mcustom1State();
}

class _mcustom1State extends State<mcustom1> {
  final ScrollController _controller = ScrollController();
  bool _isDrawerOpen = false;
  void toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // ScrollController를 사용한 후에는 반드시 해제해야 합니다.
    super.dispose();
  }

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
                      Navigator.of(context)
                          .push(createRoute(const HomeRoute()));
                    },
                    child: SizedBox(
                      width: width * 0.25,
                      child: Image.asset(
                        'assets/images/logo.png',
                        scale: 3,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  leading: null,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                      onPressed: toggleDrawer,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SizedBox(
          width: width,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: _isDrawerOpen
                            ? height * 0.15
                            : 0.0, // Control height to show/hide
                        color: const Color(0xff171717),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 40.w,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                    Navigator.of(context)
                          .push(createRoute(const mbyso()));
                                    },
                                    child: AutoSizeText(
                                      'MARBLE INFO',
                                      maxFontSize: 40,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MarbleInfo()));
                                      },
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.white, size: 45.w))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      launch2(
                                        'https://byso.kr/',
                                      );
                                    },
                                    child: AutoSizeText(
                                      'BYSO HOMEPAGE',
                                      maxFontSize: 40,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        launch2(
                                          'https://byso.kr/',
                                        );
                                      },
                                      icon: Icon(Icons.arrow_forward_ios,
                                          color: Colors.white, size: 45.w))
                                ],
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: const Color(0xff101010),
                        width: width * 2,
                        height: 80.h,
                        child: Scrollbar(
                          controller: _controller,
                          child: SingleChildScrollView(
                            controller: _controller,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 30.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const custom1()));
                                  },
                                  child: AutoSizeText(
                                    '테이블 레그 선택',
                                    maxFontSize: 18,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.h, bottom: 10.h),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey[400],
                                    size: 30.w,
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: AutoSizeText(
                                    '레그 컬러 선택',
                                    maxFontSize: 18,
                                    style: TextStyle(
                                        color: const Color(0xff7D7D7D),
                                        fontSize: 14.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.h, bottom: 10.h),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey[400],
                                    size: 30.w,
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: AutoSizeText(
                                    '상판 패턴 선택',
                                    maxFontSize: 18,
                                    style: TextStyle(
                                        color: const Color(0xff7D7D7D),
                                        fontSize: 14.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.h, bottom: 5.h),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey[400],
                                    size: 30.w,
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: AutoSizeText(
                                    '부가정보 선택',
                                    maxFontSize: 18,
                                    style: TextStyle(
                                        color: const Color(0xff7D7D7D),
                                        fontSize: 14.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 10.h, bottom: 5.h),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey[400],
                                    size: 30.w,
                                  ),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: AutoSizeText(
                                    '최종 견적 확인',
                                    maxFontSize: 18,
                                    style: TextStyle(
                                        color: const Color(0xff7D7D7D),
                                        fontSize: 14.sp),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color(0xff171717),
                        height: 300.h,
                        width: width,
                        child: Image.asset(
                          model.currentLegImage, // 이미지 경로를 적절히 변경하세요.
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        children: [
                          Scrollbar(
                            controller: _controller,
                            child: SingleChildScrollView(
                              controller: _controller,
                              child: Container(
                                color: const Color(0xff101010),
                                padding: EdgeInsets.only(
                                    top: 40.h,
                                    right: 30.w,
                                    left: 30.w,
                                    bottom: 40.h),
                                width: width,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        '테이블 레그를 선택해주세요',
                                        maxFontSize: 20,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Container(
                                      color: Colors.grey[500],
                                      width: width,
                                      height: 1,
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        model.setLegType(
                                            '사리넨(정원형)'); // 사용자 선택 반영
                                        // 가격 누적
                                      },
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        width: width,
                                        height: height * 0.15,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                    width: width * 0.1,
                                                    height: height * 0.07,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: model.legType ==
                                                                '사리넨(정원형)'
                                                            ? Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 1.5,
                                                              )
                                                            : const Border()),
                                                    child: Image.asset(
                                                      'assets/images/legA.png',
                                                      fit: BoxFit.contain,
                                                    )),
                                                SizedBox(width: 45.w),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      '소재',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
                                                    ),
                                                    AutoSizeText(
                                                      '제조사',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
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
                                                      '플랜트란스',
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
                                      width: width,
                                      height: 1,
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        model.setLegType(
                                            '사리넨(타원형)'); // 사용자 선택 반영
                                        // 가격 누적
                                      },
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        width: width,
                                        height: height * 0.15,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                    width: width * 0.1,
                                                    height: height * 0.07,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: model.legType ==
                                                                '사리넨(타원형)'
                                                            ? Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 1.5,
                                                              )
                                                            : const Border()),
                                                    child: Image.asset(
                                                      'assets/images/legA.png',
                                                      fit: BoxFit.contain,
                                                    )),
                                                SizedBox(width: 45.w),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      '소재',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
                                                    ),
                                                    AutoSizeText(
                                                      '제조사',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
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
                                                      '플랜트란스',
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
                                      width: width,
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
                                        width: width,
                                        height: height * 0.17,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                '개트윅',
                                                maxFontSize: 24,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                    width: width * 0.1,
                                                    height: height * 0.07,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: model.legType ==
                                                                '개트윅'
                                                            ? Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 1.5,
                                                              )
                                                            : const Border()),
                                                    child: Image.asset(
                                                        'assets/images/legB.png',
                                                        fit: BoxFit.cover)),
                                                SizedBox(width: 45.w),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      '소재',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
                                                    ),
                                                    AutoSizeText(
                                                      '제조사',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
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
                                                      '플랜트란스',
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
                                      width: width,
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
                                        width: width,
                                        height: height * 0.17,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                '샹베리',
                                                maxFontSize: 24,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                    width: width * 0.1,
                                                    height: height * 0.07,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: model.legType ==
                                                                '샹베리'
                                                            ? Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 1.5,
                                                              )
                                                            : const Border()),
                                                    child: Image.asset(
                                                        'assets/images/legC.png',
                                                        fit: BoxFit.cover)),
                                                SizedBox(width: 45.w),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      '소재',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
                                                    ),
                                                    AutoSizeText(
                                                      '제조사',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
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
                                                      '플랜트란스',
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
                                      width: width,
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
                                        width: width,
                                        height: height * 0.17,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                '라고스',
                                                maxFontSize: 24,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                    width: width * 0.1,
                                                    height: height * 0.07,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: model.legType ==
                                                                '라고스'
                                                            ? Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 1.5,
                                                              )
                                                            : const Border()),
                                                    child: Image.asset(
                                                        'assets/images/legD.png',
                                                        fit: BoxFit.cover)),
                                                SizedBox(width: 45.w),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      '소재',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
                                                    ),
                                                    AutoSizeText(
                                                      '제조사',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
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
                                                      '플랜트란스',
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
                                      width: width,
                                      height: 1,
                                    ),
                                    Container(
                                      color: Colors.grey[500],
                                      width: width,
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
                                        width: width,
                                        height: height * 0.17,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                '디디모스',
                                                maxFontSize: 24,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                    width: width * 0.1,
                                                    height: height * 0.07,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: model.legType ==
                                                                '디디모스'
                                                            ? Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 1.5,
                                                              )
                                                            : const Border()),
                                                    child: Image.asset(
                                                        'assets/images/legE.png',
                                                        fit: BoxFit.contain)),
                                                SizedBox(width: 45.w),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      '소재',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
                                                    ),
                                                    AutoSizeText(
                                                      '제조사',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
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
                                                      '플랜트란스',
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
                                      width: width,
                                      height: 1,
                                    ),
                                    Container(
                                      color: Colors.grey[500],
                                      width: width,
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
                                        width: width,
                                        height: height * 0.15,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                '리프 다이닝',
                                                maxFontSize: 24,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                    width: width * 0.1,
                                                    height: height * 0.07,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: model.legType ==
                                                                '리프 다이닝'
                                                            ? Border.all(
                                                                color: Colors
                                                                    .white,
                                                                width: 1.5,
                                                              )
                                                            : const Border()),
                                                    child: Image.asset(
                                                        'assets/images/legF.png',
                                                        fit: BoxFit.contain)),
                                                SizedBox(width: 45.w),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AutoSizeText(
                                                      '소재',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
                                                    ),
                                                    AutoSizeText(
                                                      '제조사',
                                                      maxFontSize: 14,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.grey[500]),
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
                                                      '플랜트란스',
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 20.h, right: 30.w, left: 30.w, bottom: 20.h),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: const Color(0xff101010),
                  border: Border(
                      top: BorderSide(color: Colors.grey[500]!, width: 1)),
                ),
                width: width,
                height: height * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '가격',
                      maxFontSize: 18,
                      style:
                          TextStyle(color: Colors.grey[400], fontSize: 16.sp),
                    ),
                    Consumer<DeskCustomizationModel>(
                      builder: (context, model, child) {
                        // 이 부분에서 model.currentPrice를 UI에 반영합니다.
                        // 예를 들어, 가격을 표시하는 Text 위젯이 있다면 다음과 같이 작성할 수 있습니다.
                        return AutoSizeText(
                          '${formatPriceWithCommas(model.currentPrice)}원',
                          maxFontSize: 60,
                          textAlign: TextAlign.start,
                          style:
                              TextStyle(fontSize: 60.sp, color: Colors.white),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width * 0.465,
                            height: height * 0.07,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: AutoSizeText(
                              '이전',
                              maxFontSize: 18,
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(createRoute(const customRoute2()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: width * 0.465,
                            height: height * 0.07,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
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
        ));
  }
}
