import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/%08widget/launch.dart';
import 'package:byso/pages/custom1.dart';
import 'package:byso/pages/marble.dart';
import 'package:byso/pages/route.dart';
import 'package:byso/pages/route/customRoute1.dart';
import 'package:byso/pages/route/homeRoute.dart';
import 'package:byso/pages/route/mbyso.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class home extends StatelessWidget {
  const home({super.key});

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
              'assets/images/main.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 35.h, left: 20.w, right: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  const Text('바이소메트릭 마블 커스터마이징',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Column(
                    children: [
                      Text(
                        'bysometric은 byso의 새로운 커스터마이징 서비스로, 개인의 공간을 자유롭고 창의적으로 꾸밀수 있도록 돕는 서비스입니다.',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        '고객이 가구의 컬러와 재질을 직접 선택하여 자신만의 독특한 공간을 창조할 수 있도록 합니다.',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        'bysometric은 고객의 개성과 취향이 반영된 공간을 만드는 것을 목표로합니다.',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(createRoute(const customRoute1()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        '시작하기',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}
