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
    final group1Patterns = ['스타투아리오', '비앙코', '아라베스카토', '네로 마퀴니아', '기타'];

    // 사용 가능한 패턴 중 첫 번째 패턴을 기본값으로 설정
    if (!availablePatterns.contains(model.pattern)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (availablePatterns.isNotEmpty) {
          model.setPattern(availablePatterns.first, 1);
        }
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 패턴 이름 표시
        Padding(
          padding: EdgeInsets.only(left: 11.w, bottom: 20),
          child: const Text(
            '천연 대리석 (원산지 : 이탈리아)',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        // 패턴 이미지 표시
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 0.75,
          ),
          itemCount: group1Patterns.length,
          itemBuilder: (context, index) {
            final patternName = group1Patterns[index];
            final imagePath = patterns[patternName];
            bool isSelected =
                model.pattern == patternName && model.selectedGroup == 1;

            return Column(
              children: [
                InkWell(
                  onTap: () => model.setPattern(patternName, 1),
                  child: Container(
                    width: 60.w,
                    height: 90.h,
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
                            child: const Icon(Icons.check,
                                color: Colors.white, size: 24),
                          )
                        : null,
                  ),
                ),
                Center(
                  child: Text(
                    patternName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            );
          },
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
    final group2Patterns = [
      '칼라카타 마그니피코',
      '르누아르',
      '클래식 스테추아리오',
      '엑스트라 스타투아리오',
      '칼라카타 오로',
      '칼라카타 글로리',
      '네로 마퀴니아',
      '기타'
    ];

    if (!availablePatterns.contains(model.pattern)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (availablePatterns.isNotEmpty) {
          model.setPattern(availablePatterns.first, 2);
        }
      });
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 11.w, bottom: 20),
            child: const Text(
              '포세린',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 0.75,
            ),
            itemCount: group2Patterns.length,
            itemBuilder: (context, index) {
              final patternName = group2Patterns[index];
              final imagePath = patterns[patternName];
              bool isSelected =
                  model.pattern == patternName && model.selectedGroup == 2;

              return Column(
                children: [
                  InkWell(
                    onTap: () => model.setPattern(patternName, 2),
                    child: Container(
                      width: 60.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath!),
                          fit: BoxFit.cover,
                        ),
                        color:
                            isSelected ? Colors.black.withOpacity(0.5) : null,
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
                  ),
                  Center(
                    child: Text(
                      patternName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
