import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:byso/model/deskmodel.dart'; // Ensure this import points to where your model is located

class LengthPickerWidget extends StatelessWidget {
  const LengthPickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeskCustomizationModel>(context);
    final availableLengths = model.getAvailableLengths();
    final double width = MediaQuery.of(context).size.width;



    // 사리넨일 경우 길이 선택기 UI를 렌더링
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Container(color: Colors.grey[500], width: width * 0.25, height: 1),
        SizedBox(height: 30.h),
        Container(
          alignment: Alignment.centerLeft,
          child: AutoSizeText(
            '가로길이(mm)',
            maxFontSize: 18,
            style: TextStyle(fontSize: 14.sp, color: Colors.white),
          ),
        ),
        ...availableLengths.map((length) {
          bool isSelected = model.selectedLength == length;
          return GestureDetector(
            onTap: () => model.setSelectedLength(length),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.black,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? Colors.black : Colors.grey,
                          ),
                        ),
                        child: isSelected
                            ? const Icon(Icons.check,
                                size: 18, color: Colors.black)
                            : Container(),
                      ),
                      const SizedBox(width: 8),
                      Text(length,
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white)),
                    ],
                  ),
                  Text(
                    '+ ${model.getLengthPriceInfo(length)}',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
