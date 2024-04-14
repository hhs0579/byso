import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/%08widget/number.dart';
import 'package:byso/model/deskmodel.dart';
import 'package:byso/pages/route.dart';
import 'package:byso/pages/route/customRoute1.dart';
import 'package:byso/pages/route/customRoute2.dart';
import 'package:byso/pages/route/customRoute3.dart';
import 'package:byso/pages/route/customRoute4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class moption extends StatelessWidget {
  const moption({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final model = Provider.of<DeskCustomizationModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          child: _buildOptionItem('테이블 레그', model.legType,
              model.currentLegImage, model.getLegTypePrice(), context),
        ),
        Container(
          color: Colors.grey[500],
          height: 1,
          width: width,
        ),
        Container(
          padding: EdgeInsets.all(10.w),
          child: _buildColorOptionItem(
            '레그 컬러',
            model.legColor,
            _getColorFromName(model.legColor),
            model.getLegColorPrice(),
            context,
          ),
        ),
        Container(
          color: Colors.grey[500],
          height: 1,
          width: width,
        ),
        Container(
          padding: EdgeInsets.all(10.w),
          child: _buildOptionItem('패턴', model.pattern,
              model.getCurrentPatternImage(), model.getPatternPrice(), context),
        ),
        Container(
          color: Colors.grey[500],
          height: 1,
          width: width,
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              child: _buildOptionItem('가로길이', model.selectedLength, null,
                  model.getLengthPrice(), context),
            ),
            Container(
              color: Colors.grey[500],
              height: 1,
              width: width,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(10.w),
          child: _buildOptionItem('배송비', model.shippingRegion, null,
              model.getShippingCost(), context),
        ),
        Container(
          color: Colors.grey[500],
          height: 1,
          width: width,
        ),
      ],
    );
  }

  Widget _buildOptionItem(String title, String value, String? imagePath,
      int optionPrice, BuildContext context) {
    final model = Provider.of<DeskCustomizationModel>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              switch (title) {
                case '테이블 레그':
                  model.revertAndResetSelections(context, 1);
                  break;
                case '레그 컬러':
                  model.revertAndResetSelections(context, 2);
                  break;
                case '패턴':
                  model.revertAndResetSelections(context, 3);
                  break;
                case '가로길이':
                  model.revertAndResetSelections(context, 4);
                  break;
                case '배송비':
                  model.revertAndResetSelections(context, 4);
                  break;
                // 다른 색상 옵션에 대한 처리를 추가할 수 있습니다.
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  title,
                  maxFontSize: 30,
                  style: TextStyle(color: Colors.white, fontSize: 24.sp),
                ),
                Row(
                  children: [
                    AutoSizeText(
                      '옵션변경',
                      maxFontSize: 30,
                      style:
                          TextStyle(color: Colors.grey[500], fontSize: 24.sp),
                    ),
                    Image.asset(
                      'assets/images/write.png',
                      width: 30.w,
                      height: 30.h,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h), // 추가
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (imagePath != null)
                    Image.asset(
                      imagePath,
                      width: 120.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                      scale: 2,
                    ),
                  SizedBox(
                    width: 10.w,
                  ),
                  AutoSizeText(value,
                      maxFontSize: 30,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              AutoSizeText('+${formatPriceWithCommas(optionPrice)}',
                  maxFontSize: 30,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildColorOptionItem(
    String title,
    String value,
    Color color,
    int optionPrice,
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              switch (title) {
                case '테이블 레그':
                  Navigator.of(context).push(createRoute(const customRoute1()));
                  break;
                case '레그 컬러':
                  Navigator.of(context).push(createRoute(const customRoute2()));
                  break;
                case '패턴':
                  Navigator.of(context).push(createRoute(const customRoute3()));
                  break;
                case '가로길이':
                  Navigator.of(context).push(createRoute(const customRoute4()));
                  break;
                case '배송비':
                  Navigator.of(context).push(createRoute(const customRoute4()));
                  break;
                // 다른 색상 옵션에 대한 처리를 추가할 수 있습니다.
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  title,
                  maxFontSize: 30,
                  style: TextStyle(color: Colors.white, fontSize: 24.sp),
                ),
                Row(
                  children: [
                    AutoSizeText(
                      '옵션변경',
                      maxFontSize: 30,
                      style:
                          TextStyle(color: Colors.grey[500], fontSize: 24.sp),
                    ),
                    Image.asset(
                      'assets/images/write.png',
                      width: 30.w,
                      height: 30.h,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h), // 추
          Row(
            children: [
              Container(
                width: 120.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: color,
                  border: Border.all(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              AutoSizeText(
                value,
                maxFontSize: 30,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getColorFromName(String colorName) {
    switch (colorName) {
      case '화이트':
        return Colors.white;
      case '브라운':
        return Colors.brown;
      case '블랙':
        return Colors.black;
      default:
        return Colors.transparent; // 기본값 or 선택되지 않았을 때의 색상
    }
  }
}
