import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:byso/model/deskmodel.dart';

class PatternPickerWidget extends StatelessWidget {
  const PatternPickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeskCustomizationModel>(context);

    // 패턴 이미지와 이름을 매핑합니다.
    final patterns = {
      '칼라카타 마그니피코': 'assets/images/p1.png',
      '르누아르': 'assets/images/p2.png',
      '클래식 스테추아리오': 'assets/images/p3.png',
      '엑스트라 스타투아리오': 'assets/images/p4.png',
      '칼라카타 오로': 'assets/images/p5.png',
    };

    return Wrap(
      spacing: 10, // 가로 간격
      runSpacing: 10, // 세로 간격
      children: patterns.entries.map((entry) {
        // 패턴 이름과 이미지 경로
        final patternName = entry.key;
        final imagePath = entry.value;

        // 현재 선택된 패턴인지 확인
        bool isSelected = model.pattern == patternName;

        return InkWell(
          onTap: () {
            // 사용자가 패턴을 선택하면 모델 업데이트
            model.setPattern(patternName);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 40.w,
                height: 60.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.white),
                ),
              ),
              if (isSelected)
                Container(
                  width: 40.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5), // 투명한 회색 배경
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 30.sp),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
