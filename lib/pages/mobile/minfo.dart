import 'package:byso/model/deskmodel.dart';
import 'package:byso/pages/route.dart';
import 'package:byso/pages/route/homeRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class mMarbleInfo extends StatefulWidget {
  const mMarbleInfo({super.key});

  @override
  State<mMarbleInfo> createState() => _mMarbleInfoState();
}

class _mMarbleInfoState extends State<mMarbleInfo> {
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

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeskCustomizationModel>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff171717),
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
                    Navigator.of(context).push(createRoute(const HomeRoute()));
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
                centerTitle: false,
                automaticallyImplyLeading: false,
                leading: null,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                    onPressed: toggleDrawer,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          child: Column(children: [
            SizedBox(
              width: width,
              height: height * 0.4,
              child: Image.asset(
                'assets/images/mm1.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              width: width * 0.9,
              child: Image.asset(
                'assets/images/mm2.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            SizedBox(
              width: width,
              child: Image.asset(
                'assets/images/mm3.png',
                fit: BoxFit.cover,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
