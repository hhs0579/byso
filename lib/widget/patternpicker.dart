import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:byso/model/deskmodel.dart'; // 실제 경로에 맞게 수정해주세요.

class PatternPickerWidget extends StatelessWidget {
  const PatternPickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeskCustomizationModel>(context);
    // 모델에서 패턴 이미지 맵을 직접 사용
    final patterns = model.patternImages;
// 가정: model.getAvailablePatterns() 메서드가 사용 가능한 패턴 리스트를 반환한다고 가정
    final availablePatterns = model.getAvailablePatterns();

// 사용 가능한 패턴 중 첫 번째 패턴을 기본값으로 설정
    if (!availablePatterns.contains(model.pattern)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // 현재 선택된 패턴이 사용 가능한 패턴 목록에 없는 경우, 첫 번째 패턴을 자동으로 선택
        if (availablePatterns.isNotEmpty) {
          model.setPattern(availablePatterns.first);
        }
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 패턴 이름 표시
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            model.pattern != 'None' ? model.pattern : patterns.keys.first,
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // 패턴 이미지 표시
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: patterns.entries.map((entry) {
            final patternName = entry.key;
            final imagePath = entry.value;

            bool isSelected = model.pattern == patternName ||
                (model.pattern == 'None' && patternName == patterns.keys.first);

            return InkWell(
              onTap: () => model.setPattern(patternName),
              child: Container(
                width: 50.w,
                height: 80.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: isSelected
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: const Icon(Icons.check,
                            color: Colors.white, size: 24),
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
