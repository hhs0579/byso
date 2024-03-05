import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeskCustomizationModel with ChangeNotifier {
  String _legType = 'Type A';
  String _legColor = '화이트';
  String _pattern = '칼라카타 마그니피코';
  DeskCustomizationModel() {
    _initializePrice();
  }
  void _initializePrice() {
    // 초기 가격 계산: 기본 legType 가격만 반영
    _accumulatedPrice = _legTypePrices[_legType] ?? 0;
    notifyListeners();
  }

  final Map<String, int> _legTypePrices = {
    'Type A': 170000,
    'Type B': 240000,
    'Type C': 300000,
  };
  final Map<String, Map<String, int>> _legTypeAndColorPrices = {
    'Type A': {
      '화이트': 0,
      '블랙': 50000,
    },
    'Type B': {
      '블랙': 0, // 예시: Type B에서 Black 선택 시 가격
      // Type B에 대한 다른 컬러와 가격 설정 가능
    },
    'Type C': {
      '화이트': 0, // 예시: Type C에서 White 선택 시 가격
      // 예시: Type C에서 Black 선택 시 가격
    },
  };
  List<String> getAvailableColors(String legType) {
    // _legTypeAndColorPrices 맵에서 주어진 레그 타입에 대한 색상 키들을 리스트로 반환
    // 해당 레그 타입에 대한 색상 정보가 없으면 빈 리스트 반환
    return _legTypeAndColorPrices[legType]?.keys.toList() ?? [];
  }

  final Map<String, String> _legTypeImages = {
    'Type A': 'assets/images/leg1.png',
    'Type B': 'assets/images/leg2.png',
    'Type C': 'assets/images/leg3.png',
    // 필요한 경우 추가 타입에 대한 이미지 경로를 계속 추가
  };
  final Map<String, Map<String, String>> _legTypeAndColorImages = {
    'Type A': {
      '화이트': 'assets/images/leg1.png',
      '블랙': 'assets/images/legA2.png',
    },
    'Type B': {
      '블랙': 'assets/images/leg2.png',
    },
    'Type C': {
      '화이트': 'assets/images/leg3.png',
      '블랙': 'assets/images/leg3.png',
    },
    // 필요에 따라 더 추가
  };
  String get currentLegImage => _legTypeImages[_legType]!;
  String get currentLegImage2 {
    // _legTypeAndColorImages 맵에서 현재 선택된 _legType과 _legColor에 해당하는 이미지 경로를 가져옵니다.
    // 레그 타입에 해당하는 맵이 없거나, 선택된 컬러에 해당하는 이미지 경로가 없는 경우 기본 이미지 경로를 반환할 수 있습니다.
    return _legTypeAndColorImages[_legType]?[_legColor] ??
        'assets/images/leg1.png';
  }

  String get currentPatternImage =>
      _patternImages[_pattern] ?? 'assets/images/default.png';

  final Map<String, String> _patternImages = {
    '칼라카타 마그니피코': 'assets/images/tp1.png',
    '르누아르': 'assets/images/tp2.png',
    '클래식 스테추아리오': 'assets/images/tp3.png',
    '엑스트라 스타투아리오': 'assets/images/tp4.png',
    '칼라카타 오로': 'assets/images/tp5.png',
  };
  void setPattern(String newPattern) {
    if (_pattern != newPattern) {
      _pattern = newPattern;
      _calculateTotalPrice(); // 새로운 패턴 가격 반영
      notifyListeners(); // UI 업데이트를 위해 리스너들에게 알림
    }
  }

  int _accumulatedPrice = 170000; // 기본 시작 가격으로 'Type A'의 가격을 사용합니다.

  // Getter 메서드들은 그대로 유지됩니다.
  String get legType => _legType;
  String get legColor => _legColor;

  String get pattern => _pattern;
  int get price => _accumulatedPrice;

  // 패턴 이름과 가격 매핑
  final Map<String, int> patternPrices = {
    '칼라카타 마그니피코': 10000,
    '르누아르': 20000,
    '클래식 스테추아리오': 30000,
    '엑스트라 스타투아리오': 40000,
    '칼라카타 오로': 50000,
  };
  // Setter 메서드들은 선택된 항목의 가격을 업데이트합니다.
  void _calculateTotalPrice() {
    // 기본 타입 가격 설정
    _accumulatedPrice = _legTypePrices[_legType] ?? 0;

    // 선택된 색상의 추가 가격 반영
    var colorPrices = _legTypeAndColorPrices[_legType] ?? {};
    _accumulatedPrice += colorPrices[_legColor] ?? 0;

    // 선택된 패턴의 추가 가격 반영
    _accumulatedPrice += patternPrices[_pattern] ?? 0;

    notifyListeners();
  }

  void setLegType(String newType) {
    if (_legType != newType) {
      _legType = newType;
      _calculateTotalPrice(); // 타입 변경 시 총 가격 다시 계산
    }
  }

  void setLegColor(String newColor) {
    if (_legColor != newColor &&
        _legTypeAndColorPrices[_legType]?.containsKey(newColor) == true) {
      _legColor = newColor;
      _calculateTotalPrice(); // 색상 선택 시 총 가격 다시 계산
    }
  }

  void resetSelection() {
    _legType = 'Type A';
    _legColor = '화이트';
    _pattern = '칼라카타 마그니피코';
    _calculateTotalPrice();
  }
}
