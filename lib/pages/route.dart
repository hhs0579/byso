import 'package:flutter/material.dart';

Route createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0); // 시작 위치를 아래에서 위로 변경
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      // 페이드인 효과를 위한 애니메이션 추가
      var fadeAnimation = animation.drive(
          Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeIn)));

      return FadeTransition(
        opacity: fadeAnimation,
        child: SlideTransition(
          position: offsetAnimation,
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  );
}
