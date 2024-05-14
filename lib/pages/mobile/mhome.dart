import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/%08widget/launch.dart';
import 'package:byso/pages/custom1.dart';
import 'package:byso/pages/marble.dart';
import 'package:byso/pages/mobile/mcustom1.dart';
import 'package:byso/pages/route.dart';
import 'package:byso/pages/route/customRoute1.dart';
import 'package:byso/pages/route/homeRoute.dart';
import 'package:byso/pages/route/mbyso.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class mhome extends StatefulWidget {
  const mhome({super.key});

  @override
  State<mhome> createState() => _mhomeState();
}

class _mhomeState extends State<mhome> {
  bool _isDrawerOpen = false;
  void toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var screenWidth = MediaQuery.of(context).size.width;
    const mobileWidthThreshold = 600;

    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: const Color(0xff0C0C0C),
          height: height,
          width: width,
          child: Image.asset(
            'assets/images/mmain.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: _isDrawerOpen
                        ? const Color(0xff171717)
                        : Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20.h, left: 60.w, right: 30.w, bottom: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
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
                          IconButton(
                            icon: _isDrawerOpen
                                ? const Icon(Icons.close)
                                : const Icon(Icons.menu),
                            color: Colors.white,
                            onPressed: toggleDrawer,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _isDrawerOpen
                  ? height * 0.15
                  : 0.0, // Control height to show/hide
              color: const Color(0xff171717),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 60.w, right: 30.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(createRoute(const mbyso()));
                          },
                          child: const AutoSizeText(
                            'MARBLE INFO',
                            maxFontSize: 40,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            launch2(
                              'https://byso.kr/',
                            );
                          },
                          child: const AutoSizeText(
                            'BYSO HOMEPAGE',
                            maxFontSize: 40,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
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
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText('바이소메트릭',
                          maxFontSize: 80,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 80.sp,
                              fontWeight: FontWeight.w500)),
                      AutoSizeText('마블 커스터마이징',
                          maxFontSize: 80,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 80.sp,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      const Column(
                        children: [
                          AutoSizeText(
                            'bysometric은 byso의 새로운 커스터마이징 서비스로, ',
                            maxFontSize: 30,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          AutoSizeText(
                            '개인의 공간을 자유롭고 창의적으로 꾸밀수 있도록 돕는',
                            maxFontSize: 30,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          AutoSizeText(
                            '서비스입니다. 고객이 가구의 컬러와 재질을 직접 선택하여 ',
                            maxFontSize: 30,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          AutoSizeText(
                            '자신만의 독특한 공간을 창조할 수 있도록 합니다.',
                            maxFontSize: 30,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          AutoSizeText(
                            'bysometric은 고객의 개성과 취향이 반영된 공간을',
                            maxFontSize: 30,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          AutoSizeText(
                            '만드는 것을 목표로합니다.',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(createRoute(const customRoute1()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60.h,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const AutoSizeText(
                            '시작하기',
                            maxFontSize: 30,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
