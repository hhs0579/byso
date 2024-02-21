import 'package:byso/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1440, 1080),
        builder: (context, _) => MaterialApp(
              theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
                  useMaterial3: true,
                  fontFamily: 'Pretendard'),
              home: const home(),
            ));
  }
}