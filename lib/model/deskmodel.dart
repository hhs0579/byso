import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeskCustomizationModel with ChangeNotifier {
  String _legType = '사리넨';
  String _legColor = '선택안함';
  String _pattern = '선택안함';
  String shippingRegion = '선택안함';
  int currentPrice = 0;
  final List<Map<String, dynamic>> _selectionHistory = [];

  DeskCustomizationModel() {
    _initializePrice();
  }

  void _initializePrice() {
    _updateSelectionAndPrice();
  }

  void _updateSelectionAndPrice() {
    // 현재 선택 상태를 이력에 추가
    Map<String, dynamic> currentSelection = {
      'legType': _legType,
      'legColor': _legColor,
      'pattern': _pattern,
      'shippingRegion': shippingRegion,
      'price': currentPrice,
    };
    _selectionHistory.add(currentSelection);
    calculateTotalPrice();
  }

  List<String> getAvailableShippingRegions() {
    return shippingCosts.keys.toList();
  }

  final Map<String, int> shippingCosts = {
    '수도권': 90000,
    '비수도권': 140000,
    '도서,산간지역': 290000,
  };

  final Map<String, int> _legTypePrices = {
    '사리넨': 170000,
    '개트윅': 240000,
    '샹베리': 400000,
    '라고스': 400000,
    '디디모스': 400000
  };
  final Map<String, Map<String, int>> _legTypeAndColorPrices = {
    '사리넨': {
      '화이트': 0,
      '블랙': 0,
    },
    '개트윅': {
      '블랙': 0, // 예시: Type B에서 Black 선택 시 가격
      // Type B에 대한 다른 컬러와 가격 설정 가능
    },
    '샹베리': {
      '화이트': 0, // 예시: Type C에서 White 선택 시 가격
      '블랙': 0
      // 예시: Type C에서 Black 선택 시 가격
    },
    '라고스': {
      '브라운': 0, // 예시: Type C에서 White 선택 시 가격
      '블랙': 0
      // 예시: Type C에서 Black 선택 시 가격
    },
    '디디모스': {
      '화이트': 0, // 예시: Type C에서 White 선택 시 가격
      '블랙': 0
      // 예시: Type C에서 Black 선택 시 가격
    },
  };
  List<String> getAvailableColors(String legType) {
    // _legTypeAndColorPrices 맵에서 주어진 레그 타입에 대한 색상 키들을 리스트로 반환
    // 해당 레그 타입에 대한 색상 정보가 없으면 빈 리스트 반환
    return _legTypeAndColorPrices[legType]?.keys.toList() ?? [];
  }

  // 선택 변경 메서드
  void setLegType(String legType) {
    if (_legTypePrices.containsKey(legType)) {
      _legType = legType;
      _updateSelectionAndPrice();
    }
  }

  void setLegColor(String legColor) {
    _legColor = legColor;
    _updateSelectionAndPrice();
  }

  void setPattern(String pattern) {
    if (patternPrices.containsKey(pattern)) {
      _pattern = pattern;
      _updateSelectionAndPrice();
    }
  }

  void setShippingRegion(String shippingRegion) {
    if (shippingCosts.containsKey(shippingRegion)) {
      this.shippingRegion = shippingRegion; // 'this' 키워드를 사용하여 클래스 변수를 명확히 지정
      _updateSelectionAndPrice();
    }
  }

  // 선택 변경 메서드

  final Map<String, String> _legTypeImages = {
    '사리넨': 'assets/images/leg1.png',
    '개트윅': 'assets/images/leg2.png',
    '샹베리': 'assets/images/leg3.png',
    '라고스': 'assets/images/leg4.png',
    '디디모스': 'assets/images/leg5.png'
    // 필요한 경우 추가 타입에 대한 이미지 경로를 계속 추가
  };
  final Map<String, Map<String, String>> _legTypeAndColorImages = {
    '사리넨': {
      '화이트': 'assets/images/leg1.png',
      '블랙': 'assets/images/legA2.png',
    },
    '개트윅': {
      '블랙': 'assets/images/leg2.png',
    },
    '샹베리': {
      '화이트': 'assets/images/leg3.png',
      '블랙': 'assets/images/leg3-2.png',
    },
    '라고스': {
      '화이트': 'assets/images/leg4.png',
      '블랙': 'assets/images/leg4-2.png',
    },
    '디디모스': {
      '화이트': 'assets/images/leg5.png',
      '블랙': 'assets/images/leg5-2.png',
    },
    // 기타 레그 타입 및 컬러 조합에 대한 이미지 경로 추가...
  };
  final Map<String, Map<String, Map<String, String>>>
      legTypeColorToPatternImages = {
    '사리넨': {
      '화이트': {
        'None':
            'assets/images/leg1.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/tp1.png',
        '르누아르': 'assets/images/tp2.png',
        '클래식 스테추아리오': 'assets/images/tp3.png',
        '엑스트라 스타투아리오': 'assets/images/tp4.png',
        '칼라카타 오로': 'assets/images/tp5.png',
        '칼라카타 글로리': 'assets/images/tp6.png',
        // Add more patterns here
      },
      '블랙': {
        'None': 'assets/images/legA2.png',
        '칼라카타 마그니피코': 'assets/images/tp1-2.png',
        '르누아르': 'assets/images/tp2-2.png',
        '클래식 스테추아리오': 'assets/images/tp3-2.png',
        '엑스트라 스타투아리오': 'assets/images/tp4-2.png',
        '칼라카타 오로': 'assets/images/tp5-2.png',
        '칼라카타 글로리': 'assets/images/tp6-2.png',
        // Add more patterns here
      },
    },
    '개트윅': {
      '블랙': {
        'None':
            'assets/images/leg2.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/ta1.png',
        '르누아르': 'assets/images/ta2.png',
        '클래식 스테추아리오': 'assets/images/ta3.png',
        '엑스트라 스타투아리오': 'assets/images/ta4.png',
        '칼라카타 오로': 'assets/images/ta5.png',
        '칼라카타 글로리': 'assets/images/ta6.png',
        // Add more patterns here
      },
    },
    '샹베리': {
      '화이트': {
        'None':
            'assets/images/leg3.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/tb1.png',
        '르누아르': 'assets/images/tb2.png',
        '클래식 스테추아리오': 'assets/images/tb3.png',
        '엑스트라 스타투아리오': 'assets/images/tb4.png',
        '칼라카타 오로': 'assets/images/tb5.png',
        '칼라카타 글로리': 'assets/images/tb6.png',
        // Add more patterns here
      },
      '블랙': {
        'None': 'assets/images/leg3-2.png',
        '칼라카타 마그니피코': 'assets/images/tb1-2.png',
        '르누아르': 'assets/images/tb2-2.png',
        '클래식 스테추아리오': 'assets/images/tb3-2.png',
        '엑스트라 스타투아리오': 'assets/images/tb4-2.png',
        '칼라카타 오로': 'assets/images/tb5-2.png',
        '칼라카타 글로리': 'assets/images/tb6-2.png',
        // Add more patterns here
      },
    },
    '라고스': {
      '브라운': {
        'None':
            'assets/images/leg4.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/tc1.png',
        '르누아르': 'assets/images/tc2.png',
        '클래식 스테추아리오': 'assets/images/tc3.png',
        '엑스트라 스타투아리오': 'assets/images/tc4.png',
        '칼라카타 오로': 'assets/images/tc5.png',
        '칼라카타 글로리': 'assets/images/tc6.png',
        // Add more patterns here
      },
      '블랙': {
        'None': 'assets/images/leg4-2.png',
        '칼라카타 마그니피코': 'assets/images/tc1-2.png',
        '르누아르': 'assets/images/tc2-2.png',
        '클래식 스테추아리오': 'assets/images/tc3-2.png',
        '엑스트라 스타투아리오': 'assets/images/tc4-2.png',
        '칼라카타 오로': 'assets/images/tc5-2.png',
        '칼라카타 글로리': 'assets/images/tc6-2.png',
        // Add more patterns here
      },
    },
    '디디모스': {
      '화이트': {
        'None':
            'assets/images/leg5.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/td1.png',
        '르누아르': 'assets/images/td2.png',
        '클래식 스테추아리오': 'assets/images/td3.png',
        '엑스트라 스타투아리오': 'assets/images/td4.png',
        '칼라카타 오로': 'assets/images/td5.png',
        '칼라카타 글로리': 'assets/images/td6.png',
        // Add more patterns here
      },
      '블랙': {
        'None': 'assets/images/leg5-2.png',
        '칼라카타 마그니피코': 'assets/images/td1-2.png',
        '르누아르': 'assets/images/td2-2.png',
        '클래식 스테추아리오': 'assets/images/td3-2.png',
        '엑스트라 스타투아리오': 'assets/images/td4-2.png',
        '칼라카타 오로': 'assets/images/td5-2.png',
        '칼라카타 글로리': 'assets/images/td6-2.png',
        // Add more patterns here
      },
    },
    // Repeat for other leg types and colors
  };
  String get currentLegImage => _legTypeImages[_legType]!;

  String get currentPatternImage {
    // 레그 타입과 레그 컬러에 해당하는 패턴 이미지 맵을 찾습니다.
    final colorPatterns = legTypeColorToPatternImages[_legType]?[_legColor];
    if (colorPatterns != null) {
      // 현재 선택된 패턴에 해당하는 이미지 경로를 찾아 반환합니다.
      // 'None' 패턴일 경우에는 레그 타입과 레그 컬러에 기반한 기본 이미지를 반환합니다.
      return colorPatterns[_pattern] ?? colorPatterns['None']!;
    } else {
      // 특정 레그 타입과 컬러가 선택되었으나 패턴이 선택되지 않은 경우,
      // 레그 타입과 컬러에 맞는 기본 이미지를 보여줍니다.
      // 레그 타입과 컬러에 따른 기본 이미지가 없을 경우, 전체 기본 이미지를 반환합니다.
      return _legTypeAndColorImages[_legType]?[_legColor] ??
          'assets/images/leg1.png';
    }
  }

  List<String> getAvailablePatterns() {
    return patternPrices.keys.toList();
  }

  final Map<String, String> _patternImages = {
    '칼라카타 마그니피코': 'assets/images/p1.png',
    '르누아르': 'assets/images/p2.png',
    '클래식 스테추아리오': 'assets/images/p3.png',
    '엑스트라 스타투아리오': 'assets/images/p4.png',
    '칼라카타 오로': 'assets/images/p5.png',
    '칼라카타 글로리': 'assets/images/p6.png',
  };

  // 패턴 이미지 맵에 대한 getter 추가
  Map<String, String> get patternImages => _patternImages;

  final int _accumulatedPrice = 0; // 기본 시작 가격으로 'Type A'의 가격을 사용합니다.
  int get shippingCost => shippingCosts[shippingRegion] ?? 0;
  // Getter 메서드들은 그대로 유지됩니다.
  String get legType => _legType;
  String get legColor => _legColor;

  String get pattern => _pattern;
  int get price => _accumulatedPrice;

  // 패턴 이름과 가격 매핑
  final Map<String, int> patternPrices = {
    '칼라카타 마그니피코': 100000,
    '르누아르': 100000,
    '클래식 스테추아리오': 100000,
    '엑스트라 스타투아리오': 100000,
    '칼라카타 오로': 100000,
    '칼라카타 글로리': 100000
  };
  int getLegTypePrice() {
    return _legTypePrices[_legType] ?? 0;
  }

  // 레그 색상 가격을 반환합니다. (현재 예제에서는 추가 비용이 없음)
  int getLegColorPrice() {
    return _legTypeAndColorPrices[_legType]?[_legColor] ?? 0;
  }

  // 패턴 가격을 반환합니다.
  int getPatternPrice() {
    return patternPrices[_pattern] ?? 0;
  }

  // 배송비를 반환합니다.
  int getShippingCost() {
    return shippingCosts[shippingRegion] ?? 0;
  }

  String getCurrentPatternImage() {
    return _patternImages[_pattern] ??
        'assets/images/p1.png'; // 기본 이미지 경로를 설정해주세요
  }

  // Setter 메서드들은 선택된 항목의 가격을 업데이트합니다.

  void resetSelection() {
    _legType = '사리넨';
    _legColor = '선택안함';
    _pattern = '선택안함';
    shippingRegion = '선택안함';
    calculateTotalPrice();
  }

  void revertToPreviousSelection() {
    if (_selectionHistory.isNotEmpty) {
      // 마지막 선택 이력 제거
      _selectionHistory.removeLast();
      if (_selectionHistory.isNotEmpty) {
        // 이전 상태로 복원
        var previousSelection = _selectionHistory.last;
        _legType = previousSelection['legType'];
        _legColor = previousSelection['legColor'];
        _pattern = previousSelection['pattern'];
        shippingRegion = previousSelection['shippingRegion'];
        // 이전 선택에 따른 가격을 다시 계산
        calculateTotalPrice();
      } else {
        // 이력이 비었다면 초기 상태로 리셋
        resetToDefault();
      }
      notifyListeners();
    }
  }

  void resetToDefault() {
    // 기본 선택으로 리셋
    _legType = '사리넨';
    _legColor = '선택안함';
    _pattern = '선택안함';
    shippingRegion = '선택안함';
    // 기본 상태의 가격을 계산
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    // 현재 선택에 따라 가격 계산
    currentPrice = _legTypePrices[_legType] ?? 0;
    currentPrice += _legTypeAndColorPrices[_legType]?[_legColor] ?? 0;
    currentPrice += patternPrices[_pattern] ?? 0;
    currentPrice += shippingCosts[shippingRegion] ?? 0;
    // 가격 업데이트 통지
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
