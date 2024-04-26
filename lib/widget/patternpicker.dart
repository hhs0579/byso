import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:byso/model/deskmodel.dart'; // 실제 경로에 맞게 수정해주세요.

class PatternPicker1Widget extends StatelessWidget {
  const PatternPicker1Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeskCustomizationModel>(context);
    final patterns = model.patternImages;
    final availablePatterns = model.getAvailablePatterns();
    final group1Patterns = [
      '칼라카타 마그니피코',
      '르누아르',
      '클래식 스테추아리오',
      '엑스트라 스타투아리오',
      '칼라카타 오로',
      '칼라카타 글로리'
    ];

    // 사용 가능한 패턴 중 첫 번째 패턴을 기본값으로 설정
    if (!availablePatterns.contains(model.pattern)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
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
            model.pattern != '선택안함' ? model.pattern : patterns.keys.first,
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
          children: group1Patterns.map((patternName) {
            final imagePath = patterns[patternName];
            bool isSelected = model.pattern == patternName ||
                (model.pattern == 'None' && patternName == patterns.keys.first);
            return InkWell(
              onTap: () => model.setPattern(patternName),
              child: Container(
                width: 50.w,
                height: 80.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: isSelected
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: const Icon(Icons.check, color: Colors.white, size: 24),
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

class PatternPicker2Widget extends StatelessWidget {
  const PatternPicker2Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeskCustomizationModel>(context);
    final patterns = model.patternImages;
    final availablePatterns = model.getAvailablePatterns();
    final group2Patterns = ['비앙코', '아라베스카토', '스타투아리오'];

    // 사용 가능한 패턴 중 첫 번째 패턴을 기본값으로 설정
    if (!availablePatterns.contains(model.pattern)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
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
            model.pattern != '선택안함' ? model.pattern : patterns.keys.first,
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
          children: group2Patterns.map((patternName) {
            final imagePath = patterns[patternName];
            bool isSelected = model.pattern == patternName ||
                (model.pattern == 'None' && patternName == patterns.keys.first);
            return InkWell(
              onTap: () => model.setPattern(patternName),
              child: Container(
                width: 50.w,
                height: 80.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: isSelected
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: const Icon(Icons.check, color: Colors.white, size: 24),
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