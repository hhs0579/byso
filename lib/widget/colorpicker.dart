import 'package:byso/model/deskmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeskCustomizationModel>(context);
    final availableColors = model.getAvailableColors(model.legType);

    // 사용 가능한 색상 중 첫 번째 색상을 기본값으로 설정
    if (!availableColors.contains(model.legColor)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // 현재 선택된 색상이 사용 가능한 색상 목록에 없는 경우, 첫 번째 색상을 자동으로 선택
        if (!availableColors.contains(model.legColor) &&
            availableColors.isNotEmpty) {
          model.setLegColor(availableColors.first);
        }
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Text(
            model.legColor.isNotEmpty ? model.legColor : "색상을 선택하세요",
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: availableColors.map((color) {
            bool isSelected = model.legColor == color;
            return InkWell(
              onTap: () {
                model.setLegColor(color);
              },
              child: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.grey
                      : color == "화이트"
                          ? Colors.white
                          : color == "브라운"
                              ? Colors.brown
                              : Colors.black,
                  border: Border.all(color: Colors.black),
                ),
                child: isSelected
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
