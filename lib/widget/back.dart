import 'package:byso/model/deskmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void goBackToPreviousPage(BuildContext context) {
  // 상태 변경 로직 호출 예시

  // 변경사항이 UI에 반영될 수 있는 충분한 시간을 주기 위해 딜레이를 추가

  Provider.of<DeskCustomizationModel>(context, listen: false)
      .revertToPreviousSelection();
  Navigator.pop(context);
}
