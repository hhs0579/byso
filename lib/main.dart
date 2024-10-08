import 'package:byso/%08widget/%08behavior.dart';
import 'package:byso/firebase_options.dart';
import 'package:byso/model/deskmodel.dart';
import 'package:byso/pages/home.dart';
import 'package:byso/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => DeskCustomizationModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1080),
      builder: (context, _) => MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
            fontFamily: 'Pretendard',
          ),
          home: const Splash(),
          scrollBehavior: MyCustomScrollBehavior()),
    );
  }
}
