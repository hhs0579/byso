import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/model/deskmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
    _animation = Tween<double>(begin: 0.5, end: 0.7).animate(_controller)
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

  final double _scale = 0.5;

  bool a = false;
  bool b = false;
  bool c = false;
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeskCustomizationModel>(context);
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
                      height: 25.h,
                    ),
                    AutoSizeText(
                      '테이블 레그 선택',
                      maxFontSize: 18,
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[400],
                      ),
                    ),
                    AutoSizeText(
                      '레그 컬러 선택',
                      maxFontSize: 18,
                      style: TextStyle(
                          color: const Color(0xff7D7D7D), fontSize: 14.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[400],
                      ),
                    ),
                    AutoSizeText(
                      '상판 패턴 선택',
                      maxFontSize: 18,
                      style: TextStyle(
                          color: const Color(0xff7D7D7D), fontSize: 14.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[400],
                      ),
                    ),
                    AutoSizeText(
                      '견적 완료',
                      maxFontSize: 18,
                      style: TextStyle(
                          color: const Color(0xff7D7D7D), fontSize: 14.sp),
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
                          fit: BoxFit.cover,
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
                        height: height,
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
                                model.setLegType('Type A'); // 사용자 선택 반영
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
                                      '타원형',
                                      maxFontSize: 24,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.sp,
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
                                                    model.legType == 'Type A'
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 1.5,
                                                          )
                                                        : const Border()),
                                            child: Image.asset(
                                              'assets/images/legA.png',
                                              fit: BoxFit.cover,
                                            )),
                                        SizedBox(width: 15.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              '원산지',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
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
                                              '국내',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            ),
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
                                model.setLegType('Type B'); // 사용자 선택 반영
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
                                        '우드',
                                        maxFontSize: 24,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp,
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
                                                    model.legType == 'Type B'
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
                                              '원산지',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
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
                                              '국내',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            ),
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
                                model.setLegType('Type C'); // 사용자 선택 반영
                                // 가격 누적
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 20.h),
                                alignment: Alignment.centerLeft,
                                width: width * 0.25,
                                height: height * 0.2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        '2레그',
                                        maxFontSize: 24,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp,
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
                                                    model.legType == 'Type C'
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
                                              '원산지',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.grey[500]),
                                            ),
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
                                              '국내',
                                              maxFontSize: 14,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white),
                                            ),
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
                    height: height * 0.2,
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
                          '${model.price}원',
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
                            Container(
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
