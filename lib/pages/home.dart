import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/pages/custom1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('바이소메트릭 마블 커스터마이징',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Column(
                    children: [
                      Text(
                        'bysometric은 byso의 새로운 커스터마이징 서비스로, 개인의 공간을 자유롭고 창의적으로 꾸밀수 있도록 돕는 서비스입니다.',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        '고객이 가구의 컬러와 재질을 직접 선택하여 자신만의 독특한 공간을 창조할 수 있도록 합니다.',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        'bysometric은 고객의 개성과 취향이 반영된 공간을 만드는 것을 목표로합니다.',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const custom1()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.04,
                      width: width * 0.05,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        '시작하기',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
