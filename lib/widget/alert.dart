import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void myAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;

      return AlertDialog(
        content: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            splashColor: Colors.transparent, // 물결 효과를 투명하게
            highlightColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Colors.white,
              ),
              height: height * 0.2,
              width: width * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeText(
                    '견적을 신청했습니다.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontFamily: 'Pretendard'),
                  ),
                  Column(
                    children: [
                      Text(
                        '전달 주신 견적서는 잘 전달받았습니다.',
                        style:
                            TextStyle(color: Colors.grey[500], fontSize: 15.sp),
                      ),
                      Text('입력해주신 정보를 바탕으로 신청일 1주일 내에 연락드리겠습니다',
                          style: TextStyle(
                              color: Colors.grey[500], fontSize: 15.sp)),
                    ],
                  ),
                  Container(
                    height: height * 0.04,
                    width: width * 0.07,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff171717)),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '확인',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
        ),
        contentPadding: EdgeInsets.zero, // 내부 여백 제거
        insetPadding: const EdgeInsets.all(10), // AlertDialog 외부 여백 조정
        // AlertDialog의 다른 속성들...
      );
    },
  );
}

void mmyAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;

      return AlertDialog(
        content: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            splashColor: Colors.transparent, // 물결 효과를 투명하게
            highlightColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: Colors.white,
              ),
              height: height * 0.3,
              width: width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const AutoSizeText(
                    '견적을 신청했습니다.',
                    maxFontSize: 40,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Pretendard'),
                  ),
                  Column(
                    children: [
                      AutoSizeText(
                        '전달 주신 견적서는 잘 전달받았습니다.',
                        maxFontSize: 30,
                        style: TextStyle(color: Colors.grey[500], fontSize: 16),
                      ),
                      AutoSizeText('입력해주신 정보를 바탕으로 신청일',
                          maxFontSize: 30,
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 16)),
                      AutoSizeText('1주일 내에 연락드리겠습니다',
                          maxFontSize: 30,
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 16)),
                    ],
                  ),
                  Container(
                    height: height * 0.045,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff171717)),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      '확인',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
        ),
        contentPadding: EdgeInsets.zero, // 내부 여백 제거
        insetPadding: const EdgeInsets.all(10), // AlertDialog 외부 여백 조정
        // AlertDialog의 다른 속성들...
      );
    },
  );
}

void lengthAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;

      return AlertDialog(
        content: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            splashColor: Colors.transparent, // 물결 효과를 투명하게
            highlightColor: Colors.transparent,
            child: Container(
              color: Colors.white,
              height: height * 0.2,
              width: width * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeText(
                    '가로길이를 선택해주세요.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Pretendard'),
                  ),
                  Container(
                    height: height * 0.05,
                    width: width * 0.07,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff171717)),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      '확인',
                      maxFontSize: 34,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
        ),
        contentPadding: EdgeInsets.zero, // 내부 여백 제거
        insetPadding: const EdgeInsets.all(10), // AlertDialog 외부 여백 조정
        // AlertDialog의 다른 속성들...
      );
    },
  );
}

void mlengthAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;

      return AlertDialog(
        content: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            splashColor: Colors.transparent, // 물결 효과를 투명하게
            highlightColor: Colors.transparent,
            child: Container(
              color: Colors.white,
              height: height * 0.2,
              width: width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const AutoSizeText(
                    '가로길이를 선택해주세요.',
                    maxFontSize: 24,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Pretendard'),
                  ),
                  Container(
                    height: height * 0.05,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff171717)),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    alignment: Alignment.center,
                    child: const AutoSizeText(
                      '확인',
                      maxFontSize: 24,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
        ),
        contentPadding: EdgeInsets.zero, // 내부 여백 제거
        insetPadding: const EdgeInsets.all(10), // AlertDialog 외부 여백 조정
        // AlertDialog의 다른 속성들...
      );
    },
  );
}

void shippingAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;

      return AlertDialog(
        content: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            splashColor: Colors.transparent, // 물결 효과를 투명하게
            highlightColor: Colors.transparent,
            child: Container(
              color: Colors.white,
              height: height * 0.2,
              width: width * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeText(
                    '배송비를 선택해주세요.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Pretendard'),
                  ),
                  Container(
                    height: height * 0.05,
                    width: width * 0.07,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff171717)),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '확인',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
        ),
        contentPadding: EdgeInsets.zero, // 내부 여백 제거
        insetPadding: const EdgeInsets.all(10), // AlertDialog 외부 여백 조정
        // AlertDialog의 다른 속성들...
      );
    },
  );
}

void mshippingAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;

      return AlertDialog(
        content: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            splashColor: Colors.transparent, // 물결 효과를 투명하게
            highlightColor: Colors.transparent,
            child: Container(
              color: Colors.white,
              height: height * 0.2,
              width: width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const AutoSizeText(
                    '배송비를 선택해주세요.',
                    maxFontSize: 24,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Pretendard'),
                  ),
                  Container(
                    height: height * 0.05,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff171717)),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    alignment: Alignment.center,
                    child: const AutoSizeText(
                      '확인',
                      maxFontSize: 24,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // 둥근 모서리 설정
        ),
        contentPadding: EdgeInsets.zero, // 내부 여백 제거
        insetPadding: const EdgeInsets.all(10), // AlertDialog 외부 여백 조정
        // AlertDialog의 다른 속성들...
      );
    },
  );
}
