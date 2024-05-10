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
import 'package:http/http.dart' as http;

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

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  Future<void> submitForm2() async {
    final model = Provider.of<DeskCustomizationModel>(context, listen: false);

    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      try {
        final response = await http.post(
          Uri.parse('https://formspree.io/f/mgegdbwa'),
          body: {
            'email': _emailController.text,
            'name': _nameController.text,
            'message': '연락처: ${_phoneController.text}\n'
                '선택한 다리 유형: ${model.legType}\n'
                '선택한 다리 색상: ${model.legColor}\n'
                '선택한 패턴: ${model.pattern}\n'
                '선택한 길이: ${model.selectedLength}\n'
                '배송 지역: ${model.shippingRegion}\n'
                '총 가격: ${formatPriceWithCommas(model.currentPrice)}원',
          },
        );

        if (response.statusCode == 200) {
          // 폼 제출 성공
          print('Form submitted successfully!');

          _nameController.clear();
          _emailController.clear();
          _phoneController.clear();
        } else {
          // 폼 제출 실패
          print('Failed to submit form. ${response.body}');
          _showFailureDialog();
        }
      } catch (e) {
        print('Error submitting form: $e');
        // 예외 처리 로직
        // ...
      }
    }
  }

  void _showFailureDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('실패'),
          content: const Text('견적 요청 전송에 실패했습니다. 다시 시도해 주세요.'),
          actions: [
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeskCustomizationModel>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xff171717),
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: width,
            child: Column(
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
                            padding: EdgeInsets.only(left: 60.w, right: 30.w),
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
                                SizedBox(
                                  height: 10.h,
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
                        Container(
                          padding: EdgeInsets.only(left: 30.w, right: 30.w),
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
                                    child: const AutoSizeText(
                                      '테이블 레그 선택',
                                      maxFontSize: 22,
                                      style: TextStyle(
                                          color: Color(0xff7D7D7D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.h, bottom: 10.h),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey[400],
                                      size: 42.w,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      model.revertAndResetSelections(
                                          context, 2);
                                    },
                                    child: const AutoSizeText(
                                      '레그 컬러 선택',
                                      maxFontSize: 20,
                                      style: TextStyle(
                                          color: Color(0xff7D7D7D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.h, bottom: 10.h),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey[400],
                                      size: 42.w,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      model.revertAndResetSelections(
                                          context, 3);
                                    },
                                    child: const AutoSizeText(
                                      '상판 패턴 선택',
                                      maxFontSize: 20,
                                      style: TextStyle(
                                          color: Color(0xff7D7D7D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
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
                                      size: 42.w,
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
                                    child: const AutoSizeText(
                                      '부가정보 선택',
                                      maxFontSize: 20,
                                      style: TextStyle(
                                          color: Color(0xff7D7D7D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
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
                                          context, 5);
                                    },
                                    child: const AutoSizeText(
                                      '최종 견적 확인',
                                      maxFontSize: 20,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
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
                            model.getCurrentPatternImage2, // 이미지 경로를 적절히 변경하세요.
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Column(children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const AutoSizeText(
                                  '견적 신청하기',
                                  maxFontSize: 22,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const AutoSizeText(
                                        '성함',
                                        maxFontSize: 18,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width: width * 0.95,
                                        height: 50.h,
                                        child: TextFormField(
                                          controller: _nameController,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.red),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.red),
                                            ),
                                            hintText: '성함',
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 14),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 0),
                                            isDense: false,
                                            errorStyle: const TextStyle(
                                                height: 0.0, fontSize: 0.0),
                                            errorMaxLines: 1,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return '';
                                            }
                                            return null;
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const AutoSizeText(
                                        '연락처',
                                        maxFontSize: 18,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      SizedBox(
                                        width: width * 0.95,
                                        height: 50.h,
                                        child: TextFormField(
                                          controller: _phoneController,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.red),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.red),
                                            ),
                                            hintText: '연락처',
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 14),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 0),
                                            isDense: false,
                                            errorStyle: const TextStyle(
                                                height: 0.0, fontSize: 0.0),
                                            errorMaxLines: 1,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return '';
                                            }
                                            return null;
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const AutoSizeText(
                                        '이메일',
                                        maxFontSize: 18,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      SizedBox(
                                        width: width * 0.95,
                                        height: 50.h,
                                        child: TextFormField(
                                          controller: _emailController,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.white),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.red),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Colors.red),
                                            ),
                                            hintText: '이메일',
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 14),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 0),
                                            isDense: false,
                                            errorStyle: const TextStyle(
                                                height: 0.0, fontSize: 0.0),
                                            errorMaxLines: 1,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return '';
                                            }
                                            return null;
                                          },
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
                              Padding(
                                padding: const EdgeInsets.symmetric(),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const AutoSizeText(
                                        '최종 견적을 확인해주세요',
                                        maxFontSize: 20,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
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
                                    const moption(),
                                    SizedBox(
                                      height: 30.h,
                                    )
                                  ],
                                ),
                              ),
                            ])),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 20.h, right: 50.w, left: 50.w, bottom: 20.h),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: const Color(0xff101010),
                    border: Border(
                        top: BorderSide(color: Colors.grey[500]!, width: 1)),
                  ),
                  width: width,
                  height: height * 0.18,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        '가격',
                        maxFontSize: 18,
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                      Consumer<DeskCustomizationModel>(
                        builder: (context, model, child) {
                          // 이 부분에서 model.currentPrice를 UI에 반영합니다.
                          // 예를 들어, 가격을 표시하는 Text 위젯이 있다면 다음과 같이 작성할 수 있습니다.
                          return AutoSizeText(
                            '${formatPriceWithCommas(model.currentPrice)}원',
                            maxFontSize: 60,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 24, color: Colors.white),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            submitForm2();
                            _nameController.clear();
                            _emailController.clear();
                            _phoneController.clear();
                            mmyAlert(context);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          width: width * 0.9,
                          height: 48.h,
                          alignment: Alignment.center,
                          child: const AutoSizeText(
                            '견적서 보내기',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            maxFontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
