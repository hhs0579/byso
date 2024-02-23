import 'package:flutter/material.dart';

class DeskCustomizationModel with ChangeNotifier {
  String _legType = 'Type A';
  String _legColor = 'Black';
  String _topColor = 'White';
  String _pattern = 'None';

  final Map<String, int> _legTypePrices = {
    'Type A': 170000,
    'Type B': 240000,
    'Type C': 300000,
  };
  final Map<String, int> _legColorPrices = {'Black': 50000, 'White': 55000};
  final Map<String, int> _topColorPrices = {
    'White': 100000,
    'Black': 100000,
    'Brown': 120000,
    'Grey': 120000
  };
  final Map<String, int> _patternPrices = {
    'None': 0,
    'Pattern 1': 50000,
    'Pattern 2': 50000,
    'Pattern 3': 50000
    
  };
final Map<String, String> _legTypeImages = {
  'Type A': 'assets/images/leg1.png',
  'Type B': 'assets/images/leg2.png',
  'Type C': 'assets/images/leg3.png',
  // 필요한 경우 추가 타입에 대한 이미지 경로를 계속 추가
};

String get currentLegImage => _legTypeImages[_legType]!;
  int _accumulatedPrice = 170000; // 기본 시작 가격으로 'Type A'의 가격을 사용합니다.

  // Getter 메서드들은 그대로 유지됩니다.
  String get legType => _legType;
  String get legColor => _legColor;
  String get topColor => _topColor;
  String get pattern => _pattern;
  int get price => _accumulatedPrice;

  // Setter 메서드들은 선택된 항목의 가격을 업데이트합니다.
  void setLegType(String newType) {
    if (_legType != newType) {
      _updatePrice(_legTypePrices[_legType]!, _legTypePrices[newType]!);
      _legType = newType;
      notifyListeners();
    }
  }

  void setLegColor(String newColor) {
    if (_legColor != newColor) {
      _updatePrice(_legColorPrices[_legColor]!, _legColorPrices[newColor]!);
      _legColor = newColor;
      notifyListeners();
    }
  }

  void setTopColor(String newColor) {
    if (_topColor != newColor) {
      _updatePrice(_topColorPrices[_topColor]!, _topColorPrices[newColor]!);
      _topColor = newColor;
      notifyListeners();
    }
  }

  void setPattern(String newPattern) {
    if (_pattern != newPattern) {
      _updatePrice(_patternPrices[_pattern]!, _patternPrices[newPattern]!);
      _pattern = newPattern;
      notifyListeners();
    }
  }

  // 이 메서드는 이전 가격을 빼고 새로운 가격을 더합니다.
  void _updatePrice(int oldPrice, int newPrice) {
    _accumulatedPrice -= oldPrice;
    _accumulatedPrice += newPrice;
  }

  // 선택을 재설정하거나 초기화할 필요가 있을 경우 사용합니다.
  void resetSelection() {
    _legType = 'Type A';
    _legColor = 'Black';
    _topColor = 'White';
    _pattern = 'None';
    _accumulatedPrice = _legTypePrices['Type A']!; // 초기 가격으로 재설정
    notifyListeners();
  }
}
