import 'package:byso/%08widget/number.dart';
import 'package:byso/model/deskmodel.dart';
import 'package:byso/pages/custom1.dart';
import 'package:byso/pages/custom2.dart';
import 'package:byso/pages/custom3.dart';
import 'package:byso/pages/custom4.dart';
import 'package:byso/pages/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({Key? key}) : super(key: key);

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
        if (model.legType == '사리넨(정원형)' || model.legType == '사리넨(타원형)')
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              switch (title) {
                case '테이블 레그':
                  Navigator.of(context).push(createRoute(const custom1()));
                  break;
                case '레그 컬러':
                  Navigator.of(context).push(createRoute(const custom2()));
                  break;
                case '패턴':
                  Navigator.of(context).push(createRoute(const custom3()));
                  break;
                case '가로길이':
                  Navigator.of(context).push(createRoute(const custom4()));
                  break;
                case '배송비':
                  Navigator.of(context).push(createRoute(const custom4()));
                  break;
                // 다른 색상 옵션에 대한 처리를 추가할 수 있습니다.
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                Row(
                  children: [
                    Text(
                      '옵션변경',
                      style:
                          TextStyle(color: Colors.grey[500], fontSize: 14.sp),
                    ),
                    Image.asset(
                      'assets/images/write.png',
                      width: 16.w,
                      height: 16.h,
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
                      width: 40.w,
                      height: 50.h,
                    ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(value,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Text(formatPriceWithCommas(optionPrice),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
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
                  Navigator.of(context).push(createRoute(const custom1()));
                  break;
                case '레그 컬러':
                  Navigator.of(context).push(createRoute(const custom2()));
                  break;
                case '패턴':
                  Navigator.of(context).push(createRoute(const custom3()));
                  break;
                case '가로길이':
                  Navigator.of(context).push(createRoute(const custom4()));
                  break;
                case '배송비':
                  Navigator.of(context).push(createRoute(const custom4()));
                  break;
                // 다른 색상 옵션에 대한 처리를 추가할 수 있습니다.
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                Row(
                  children: [
                    Text(
                      '옵션변경',
                      style:
                          TextStyle(color: Colors.grey[500], fontSize: 14.sp),
                    ),
                    Image.asset(
                      'assets/images/write.png',
                      width: 16.w,
                      height: 16.h,
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
                width: 35.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: color,
                  border: Border.all(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                value,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
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
