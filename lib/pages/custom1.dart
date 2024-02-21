import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class custom1 extends StatelessWidget {
  const custom1({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff171717),
          title: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/images/logo.png',
              scale: 4,
              fit: BoxFit.contain,
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
                      height: 20.h,
                    ),
                    AutoSizeText(
                      '테이블 레그 선택',
                      maxFontSize: 18,
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[400],
                      ),
                    ),
                    AutoSizeText(
                      '상판 선택',
                      maxFontSize: 18,
                      style:
                          TextStyle(color: Colors.grey[400], fontSize: 14.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[400],
                      ),
                    ),
                    AutoSizeText(
                      '패턴 선택',
                      maxFontSize: 18,
                      style:
                          TextStyle(color: Colors.grey[400], fontSize: 14.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[400],
                      ),
                    ),
                    AutoSizeText(
                      '견적 완료',
                      maxFontSize: 18,
                      style:
                          TextStyle(color: Colors.grey[400], fontSize: 14.sp),
                    )
                  ],
                ),
              ),
              Container(
                color: const Color(0xff171717),
                width: width * 0.6,
              )
            ],
          ),
        ));
  }
}
