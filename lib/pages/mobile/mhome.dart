import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/%08widget/launch.dart';
import 'package:byso/pages/custom1.dart';
import 'package:byso/pages/marble.dart';
import 'package:byso/pages/route.dart';
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
                              builder: (context) => const mhome()));
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
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: toggleDrawer,
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
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _isDrawerOpen
                      ? 200.0
                      : 0.0, // Control height to show/hide
                  color: Colors.blue[100],
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text('Item 1'),
                        onTap: () {}, // Add navigation or other interaction
                      ),
                      ListTile(
                        title: const Text('Item 2'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Item 3'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText('바이소메트릭',
                              maxFontSize: 50,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50.sp,
                                  fontWeight: FontWeight.w600)),
                          AutoSizeText('마블 커스터마이징',
                              maxFontSize: 50,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50.sp,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          const Column(
                            children: [
                              Text(
                                'bysometric은 byso의 새로운 커스터마이징 서비스로, ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Text(
                                '개인의 공간을 자유롭고 창의적으로 꾸밀수 있도록 돕는 서비스입니다.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Text(
                                '고객이 가구의 컬러와 재질을 직접 선택하여 자신만의 독특한 공간을 창조할 수 있도록 합니다.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Text(
                                'bysometric은 고객의 개성과 취향이 반영된 공간을 만드는 것을 목표로합니다.',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(createRoute(const custom1()));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60.h,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: AutoSizeText(
                                '시작하기',
                                maxFontSize: 20,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w200),
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
