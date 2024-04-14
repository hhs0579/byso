import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/%08widget/alert.dart';
import 'package:byso/%08widget/launch.dart';
import 'package:byso/%08widget/moption.dart';
import 'package:byso/%08widget/number.dart';
import 'package:byso/%08widget/option.dart';
import 'package:byso/%08widget/shipping.dart';
import 'package:byso/%08widget/table.dart';
import 'package:byso/model/deskmodel.dart';
import 'package:byso/pages/custom1.dart';
import 'package:byso/pages/custom5.dart';
import 'package:byso/pages/marble.dart';
import 'package:byso/pages/mobile/mhome.dart';
import 'package:byso/pages/route.dart';
import 'package:byso/pages/route/homeRoute.dart';
import 'package:byso/pages/route/mbyso.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class mcustom5 extends StatefulWidget {
  const mcustom5({super.key});

  @override
  State<mcustom5> createState() => _mcustom5State();
}

class _mcustom5State extends State<mcustom5> {
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MarbleInfo()));
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
                                                Navigator.of(context)
                          .push(createRoute(const mbyso()));
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
                                              model.revertAndResetSelections(
                                          context, 1);
                                  },
                                  child: AutoSizeText(
                                    '테이블 레그 선택',
                                    maxFontSize: 18,
                                    style: TextStyle(
                                        color: Color(0xff7D7D7D), fontSize: 14.sp),
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
                                  onTap: () {                model.revertAndResetSelections(
                                          context, 2);},
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
                                  onTap: () {                model.revertAndResetSelections(
                                          context, 3);},
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
                                  onTap: () {
                model.revertAndResetSelections(
                                          context, 4);
                                  },
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
                                  onTap: () {                model.revertAndResetSelections(
                                          context, 5);},
                                  child: AutoSizeText(
                                    '최종 견적 확인',
                                    maxFontSize: 18,
                                    style: TextStyle(
                                        color: Colors.white,
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
                          model.currentPatternImage, // 이미지 경로를 적절히 변경하세요.
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                          child: Column(children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 40.w),
                          child: AutoSizeText(
                            '견적 신청하기',
                            maxFontSize: 22,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Column(
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
                                  width: width * 0.95,
                                  height: 50.h,
                                  child: TextField(
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      hintText: '성함',
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 40.sp),
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
                            SizedBox(
                              height: 20.h,
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
                                  width: width * 0.95,
                                  height: 50.h,
                                  child: TextField(
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      hintText: '연락처',
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 40.sp),
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
                            SizedBox(
                              height: 20.h,
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
                                  width: width * 0.95,
                                  height: 50.h,
                                  child: TextField(
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      hintText: '이메일',
                                      hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 40.sp),
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
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            '최종 견적을 확인해주세요',
                            maxFontSize: 20,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.sp),
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
                        const moption()
                      ])),
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
                    InkWell(
                      onTap: () {
                        mmyAlert(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        width: width * 0.95,
                        height: height * 0.07,
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
        ));
  }
}
