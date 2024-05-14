import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/model/deskmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class mPatternPicker1Widget extends StatelessWidget {
  const mPatternPicker1Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            '천연 대리석 (원산지 : 이탈리아)',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        // 패턴 이미지 표시
        SizedBox(
          height: height * 0.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: group1Patterns.length,
            itemBuilder: (context, index) {
              final patternName = group1Patterns[index];
              final imagePath = patterns[patternName];
              bool isSelected =
                  model.pattern == patternName && model.selectedGroup == 1;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => model.setPattern(patternName, 1),
                      child: Container(
                        width: 88,
                        height: 88,
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
                    SizedBox(
                      width: 88,
                      child: AutoSizeText(
                        patternName,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        maxLines: 2,
                        minFontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class mPatternPicker2Widget extends StatelessWidget {
  const mPatternPicker2Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              '포세린 (원산지 : 이탈리아)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: group2Patterns.length,
              itemBuilder: (context, index) {
                final patternName = group2Patterns[index];
                final imagePath = patterns[patternName];
                bool isSelected =
                    model.pattern == patternName && model.selectedGroup == 2;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => model.setPattern(patternName, 2),
                        child: Container(
                          width: 88,
                          height: 88,
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
                      SizedBox(
                        width: 88,
                        child: AutoSizeText(
                          patternName,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                          maxLines: 2,
                          minFontSize: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
