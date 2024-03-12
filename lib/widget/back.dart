import 'package:byso/model/deskmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void goBackToPreviousPage(BuildContext context) {
  // 현재 선택된 설정을 바탕으로 가격을 다시 계산합니다.
  Provider.of<DeskCustomizationModel>(context, listen: false)
      .revertToPreviousSelection();

  // 이전 페이지로 이동하는 코드
  Navigator.pop(context);
}
