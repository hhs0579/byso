import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/%08widget/launch.dart';
import 'package:byso/pages/home.dart';
import 'package:byso/pages/route.dart';
import 'package:byso/pages/route/homeRoute.dart';
import 'package:byso/pages/route/mbyso.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class MarbleInfo extends StatelessWidget {
  const MarbleInfo({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Navigator.of(context).push(createRoute(const HomeRoute()));
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
                          launch2('https://byso.kr/');
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
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/m1.png'),
              Container(
                height: 50.h,
              ),
              Container(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Image.asset('assets/images/m2.png')),
              Container(
                height: 50.h,
              ),
              Image.asset('assets/images/m3.png'),
            ],
          ),
        ),
      ),
    );
  }
}
