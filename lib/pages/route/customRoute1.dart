import 'package:byso/pages/custom1.dart';
import 'package:byso/pages/mobile/mcustom1.dart';
import 'package:flutter/material.dart';

class customRoute1 extends StatelessWidget {
  const customRoute1({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면의 너비를 가져옵니다.
    var screenWidth = MediaQuery.of(context).size.width;

    // 모바일 화면 너비 기준을 설정합니다.
    const mobileWidthThreshold = 768;

    if (screenWidth < mobileWidthThreshold) {
      // 모바일 사이즈일 때의 레이아웃
      return const mcustom1();
    } else {
      // 데스크탑 또는 태블릿 사이즈일 때의 레이아웃
      return const custom1();
    }
  }
}