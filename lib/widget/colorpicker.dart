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
    final selectedColor = model.legColor;

    // 사용 가능한 색상이 하나뿐인 경우, 모델에서 이를 자동으로 선택
    // WidgetsBinding.instance.addPostFrameCallback를 사용하여 프레임이 끝난 후 실행하도록 합니다.
    if (availableColors.length == 1 &&
        model.legColor != availableColors.first) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (model.legColor != availableColors.first) {
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
            model.legColor,
            style: const TextStyle(color: Colors.white, fontSize: 20),
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
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  // 선택된 색상의 경우 배경을 회색으로, 그렇지 않은 경우 해당 색상을 배경색으로 설정
                  color: isSelected
                      ? Colors.grey
                      : (color == "화이트" ? Colors.white : Colors.black),
                  border: Border.all(color: Colors.black), // 모든 박스에 검은색 테두리 적용
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
