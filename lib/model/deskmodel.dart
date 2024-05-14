import 'package:byso/%08widget/number.dart';
import 'package:byso/pages/custom1.dart';
import 'package:byso/pages/custom2.dart';
import 'package:byso/pages/custom3.dart';
import 'package:byso/pages/custom4.dart';
import 'package:byso/pages/custom5.dart';
import 'package:byso/pages/route.dart';
import 'package:byso/pages/route/customRoute1.dart';
import 'package:byso/pages/route/customRoute2.dart';
import 'package:byso/pages/route/customRoute3.dart';
import 'package:byso/pages/route/customRoute4.dart';
import 'package:byso/pages/route/customRoute5.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeskCustomizationModel with ChangeNotifier {
  String _legType = '사리넨(정원형)';
  String _legColor = '선택안함';
  String _pattern = '선택안함';
  String shippingRegion = '선택안함';
  int currentPrice = 0;
  String _selectedLength = '선택안함'; // Default value
  final List<Map<String, dynamic>> _selectionHistory = [];
  int _selectedGroup = 1;
  int get selectedGroup => _selectedGroup;
  DeskCustomizationModel() {
    _initializePrice();
  }

  void _initializePrice() {
    _updateSelectionAndPrice();
  }

  void _updateSelectionAndPrice() {
    calculateTotalPrice(); // 현재 선택에 따른 전체 가격을 다시 계산합니다.
    notifyListeners(); // 상태 변화를 알립니다.
  }

  void setSelectedLength(String length) {
    if (_lengthPricesByType[_legType]?.containsKey(length) ?? false) {
      _selectedLength = length;
      _updateSelectionAndPrice();
      notifyListeners();
    }
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
    '사리넨(정원형)': 700000,
    '사리넨(타원형)': 900000,
    '개트윅': 1100000,
    '샹베리': 1100000,
    '라고스': 1000000,
    '디디모스': 900000,
    '리프 다이닝': 900000
  };
  final Map<String, Map<String, int>> _legTypeAndColorPrices = {
    '사리넨(정원형)': {
      '화이트': 0,
      '블랙': 0,
    },
    '사리넨(타원형)': {
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
    '리프 다이닝': {
      '화이트': 0, // 예시: Type C에서 White 선택 시 가격

      // 예시: Type C에서 Black 선택 시 가격
    },
  };

  final Map<String, Map<String, int>> _lengthPricesByType = {
    '사리넨(정원형)': {
      '900mm': 816000,
      '1000mm': 965000,
      '1100mm': 1064000,
      '1200mm': 1263000,
      '1300mm': 1512000,
      '1400mm': 1761000,
      '1500mm': 2010000,
    },
    '사리넨(타원형)': {
      '1600mm': 1370000,
      '1700mm': 1470000,
      '1800mm': 1570000,
      '1900mm': 1670000,
      '2000mm': 1770000,
    },
    '개트윅': {
      '1600mm': 1370000,
      '1700mm': 1470000,
      '1800mm': 1570000,
      '1900mm': 1670000,
      '2000mm': 1770000,
    },
    '샹베리': {
      '1600mm': 1370000,
      '1700mm': 1470000,
      '1800mm': 1570000,
      '1900mm': 1670000,
      '2000mm': 1770000,
    },
    '라고스': {
      '1600mm': 1370000,
      '1700mm': 1470000,
      '1800mm': 1570000,
      '1900mm': 1670000,
      '2000mm': 1770000,
    },
    '디디모스': {
      '1600mm': 1370000,
      '1700mm': 1470000,
      '1800mm': 1570000,
      '1900mm': 1670000,
      '2000mm': 1770000,
    },
    '리프 다이닝': {
      '1600mm': 1370000,
      '1700mm': 1470000,
      '1800mm': 1570000,
      '1900mm': 1670000,
      '2000mm': 1770000,
    },
  };
  void calculateTotalPrice() {
    int price = 0;

    // 각 선택 항목에 대한 가격을 계산합니다.
    price += getLegTypePrice();
    price += getLegColorPrice();
    price += getPatternPrice();
    price += getShippingCost();
    price += getLengthPrice(); // 추가: 선택된 길이에 따른 가격을 포함합니다.

    currentPrice = price; // 최종 계산된 가격을 현재 가격으로 업데이트합니다.
    notifyListeners(); // 상태 변화를 알립니다.
  }

  bool get isLengthSelected => selectedLength != '선택안함';
  bool get isShippingSelected => shippingRegion != '선택안함';
// 각 선택 항목에 대한 가격을 반환하는 메서드들을 정의합니다.
  int getLegTypePrice() {
    // 다리 유형이 '선택안함'이거나 설정되지 않았을 경우 0을 반환
    if (_legType == '선택안함' || _legType.isEmpty) {
      return 0;
    }
    return _legTypePrices[_legType] ?? 0;
  }

  int getLegColorPrice() {
    // 다리 색상이 '선택안함'이거나 설정되지 않았을 경우 0을 반환
    if (_legColor == '선택안함' || _legColor.isEmpty) {
      return 0;
    }
    return _legTypeAndColorPrices[_legType]?[_legColor] ?? 0;
  }

  int getPatternPrice() {
    // 패턴이 '선택안함'이거나 설정되지 않았을 경우 0을 반환
    if (_pattern == '선택안함' || _pattern.isEmpty) {
      return 0;
    }
    return patternPrices[_pattern] ?? 0;
  }

  int getShippingCost() {
    // 배송 지역이 '선택안함'이거나 설정되지 않았을 경우 0을 반환
    if (shippingRegion == '선택안함' || shippingRegion.isEmpty) {
      return 0;
    }
    return shippingCosts[shippingRegion] ?? 0;
  }

  int getLengthPrice() {
    // 선택된 길이가 없거나 '선택안함'과 같은 조건을 검사
    if (_selectedLength.isEmpty || _selectedLength == '선택안함') {
      return 0; // 길이가 선택되지 않았다면 0을 반환
    } else {
      return _lengthPricesByType[_legType]?[_selectedLength] ?? 0;
    }
  }

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

  void setPattern(String pattern, int group) {
    if (patternPrices.containsKey(pattern)) {
      _pattern = pattern;
      _selectedGroup = group;
      _updateSelectionAndPrice();
    }
  }

  void setShippingRegion(String shippingRegion) {
    if (shippingCosts.containsKey(shippingRegion)) {
      this.shippingRegion = shippingRegion; // 'this' 키워드를 사용하여 클래스 변수를 명확히 지정
      _updateSelectionAndPrice();
    }
  }

  List<String> getAvailableLengths() {
    // 현재 선택된 레그 타입에 따라 길이 목록 반환
    return _lengthPricesByType[_legType]?.keys.toList() ?? [];
  }

  // 선택 변경 메서드
  String getLengthPriceInfo(String length) {
    // 현재 선택된 레그 타입에 맞는 가격 정보 사용
    final price = _lengthPricesByType[_legType]?[length];
    if (price != null) {
      // 가격 정보가 있으면 포맷팅하여 반환
      return '${formatPriceWithCommas(price)}원';
    } else {
      return '가격 정보 없음';
    }
  }

  final Map<String, String> _legTypeImages = {
    '사리넨(정원형)': 'assets/images/leg1.png',
    '사리넨(타원형)': 'assets/images/leg6.png',
    '개트윅': 'assets/images/leg2.png',
    '샹베리': 'assets/images/leg3.png',
    '라고스': 'assets/images/leg4.png',
    '디디모스': 'assets/images/leg5.png',
    '리프 다이닝': 'assets/images/leg7.png'
    // 필요한 경우 추가 타입에 대한 이미지 경로를 계속 추가
  };
  final Map<String, Map<String, String>> _legTypeAndColorImages = {
    '사리넨(정원형)': {
      '화이트': 'assets/images/leg1.png',
      '블랙': 'assets/images/legA2.png',
    },
    '사리넨(타원형)': {
      '화이트': 'assets/images/leg6.png',
      '블랙': 'assets/images/leg6-2.png',
    },
    '개트윅': {
      '블랙': 'assets/images/leg2.png',
    },
    '샹베리': {
      '화이트': 'assets/images/leg3.png',
      '블랙': 'assets/images/leg3-2.png',
    },  
    '라고스': {
      '브라운': 'assets/images/leg4.png',
      '블랙': 'assets/images/leg4-2.png',
    },
    '디디모스': {
      '화이트': 'assets/images/leg5.png',
      '블랙': 'assets/images/leg5-2.png',
    },
    '리프 다이닝': {
      '화이트': 'assets/images/leg7.png',
    },
    // 기타 레그 타입 및 컬러 조합에 대한 이미지 경로 추가...
  };
  final Map<String, Map<String, Map<String, String>>>
      legTypeColorToPatternImages = {
    '사리넨(정원형)': {
      '화이트': {
        'None':
            'assets/images/leg1.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/te1.png',
        '르누아르': 'assets/images/te2.png',
        '클래식 스테추아리오': 'assets/images/te3.png',
        '엑스트라 스타투아리오': 'assets/images/te4.png',
        '칼라카타 오로': 'assets/images/te5.png',
        '칼라카타 글로리': 'assets/images/te6.png',
        '비앙코': 'assets/images/te7.png',
        '아라베스카토': 'assets/images/te8.png',
        '스타투아리오': 'assets/images/te9.png',
        '네로 마퀴니아': 'assets/images/te10.png',
        '기타': 'assets/images/te1.png',
        // Add more patterns here
      },
      '블랙': {
        'None': 'assets/images/legA2.png',
        '칼라카타 마그니피코': 'assets/images/te1-2.png',
        '르누아르': 'assets/images/te2-2.png',
        '클래식 스테추아리오': 'assets/images/te3-2.png',
        '엑스트라 스타투아리오': 'assets/images/te4-2.png',
        '칼라카타 오로': 'assets/images/te5-2.png',
        '칼라카타 글로리': 'assets/images/te6-2.png',
        '비앙코': 'assets/images/te7-2.png',
        '아라베스카토': 'assets/images/te8-2.png',
        '스타투아리오': 'assets/images/te9-2.png',
        '네로 마퀴니아': 'assets/images/te10-2.png',
        '기타': 'assets/images/te1-2.png',
        // Add more patterns here
      },
    },
    '사리넨(타원형)': {
      '화이트': {
        'None':
            'assets/images/leg6.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/tp1.png',
        '르누아르': 'assets/images/tp2.png',
        '클래식 스테추아리오': 'assets/images/tp3.png',
        '엑스트라 스타투아리오': 'assets/images/tp4.png',
        '칼라카타 오로': 'assets/images/tp5.png',
        '칼라카타 글로리': 'assets/images/tp6.png',
        '비앙코': 'assets/images/tp7.png',
        '아라베스카토': 'assets/images/tp8.png',
        '스타투아리오': 'assets/images/tp9.png',
        '네로 마퀴니아': 'assets/images/tp10.png',
        '기타': 'assets/images/tp1.png',
        // Add more patterns here
      },
      '블랙': {
        'None': 'assets/images/leg6-2.png',
        '칼라카타 마그니피코': 'assets/images/tp1-2.png',
        '르누아르': 'assets/images/tp2-2.png',
        '클래식 스테추아리오': 'assets/images/tp3-2.png',
        '엑스트라 스타투아리오': 'assets/images/tp4-2.png',
        '칼라카타 오로': 'assets/images/tp5-2.png',
        '칼라카타 글로리': 'assets/images/tp6-2.png',
        '비앙코': 'assets/images/tp7-2.png',
        '아라베스카토': 'assets/images/tp8-2.png',
        '스타투아리오': 'assets/images/tp9-2.png',
        '네로 마퀴니아': 'assets/images/tp10-2.png',
        '기타': 'assets/images/tp1-2.png',
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
        '비앙코': 'assets/images/ta7.png',
        '아라베스카토': 'assets/images/ta8.png',
        '스타투아리오': 'assets/images/ta9.png',
        '네로 마퀴니아': 'assets/images/ta10.png',
        '기타': 'assets/images/ta1.png',
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
        '비앙코': 'assets/images/tb7.png',
        '아라베스카토': 'assets/images/tb8.png',
        '스타투아리오': 'assets/images/tb9.png',
        '네로 마퀴니아': 'assets/images/tb10.png',
        '기타': 'assets/images/tb1.png',
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
        '비앙코': 'assets/images/tb7-2.png',
        '아라베스카토': 'assets/images/tb8-2.png',
        '스타투아리오': 'assets/images/tb9-2.png',
        '네로 마퀴니아': 'assets/images/tb10-2.png',
        '기타': 'assets/images/tb1-2.png',
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
        '비앙코': 'assets/images/tc7.png',
        '아라베스카토': 'assets/images/tc8.png',
        '스타투아리오': 'assets/images/tc9.png',
        '네로 마퀴니아': 'assets/images/tc10.png',
        '기타': 'assets/images/tc1.png',
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
        '비앙코': 'assets/images/tc7-2.png',
        '아라베스카토': 'assets/images/tc8-2.png',
        '스타투아리오': 'assets/images/tc9-2.png',
        '네로 마퀴니아': 'assets/images/tc10-2.png',
        '기타': 'assets/images/tc1-2.png',
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
        '비앙코': 'assets/images/td7.png',
        '아라베스카토': 'assets/images/td8.png',
        '스타투아리오': 'assets/images/td9.png',
        '네로 마퀴니아': 'assets/images/td10.png',
        '기타': 'assets/images/td1.png',
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
        '비앙코': 'assets/images/td7-2.png',
        '아라베스카토': 'assets/images/td8-2.png',
        '스타투아리오': 'assets/images/td9-2.png',
        '네로 마퀴니아': 'assets/images/td10-2.png',
        '기타': 'assets/images/td1-2.png',
        // Add more patterns here
      },
    },
    '리프 다이닝': {
      '화이트': {
        'None':
            'assets/images/leg7.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/tf1.png',
        '르누아르': 'assets/images/tf2.png',
        '클래식 스테추아리오': 'assets/images/tf3.png',
        '엑스트라 스타투아리오': 'assets/images/tf4.png',
        '칼라카타 오로': 'assets/images/tf5.png',
        '칼라카타 글로리': 'assets/images/tf6.png',
        '비앙코': 'assets/images/tf7.png',
        '아라베스카토': 'assets/images/tf8.png',
        '스타투아리오': 'assets/images/tf9.png',
        '네로 마퀴니아': 'assets/images/tf10.png',
        '기타': 'assets/images/tf1.png',
        // Add more patterns here
      },
    },
    // Repeat for other leg types and colors
  };

  final Map<String, Map<String, Map<String, String>>>
      legTypeColorToPatternImages2 = {
    '사리넨(정원형)': {
      '화이트': {
        'None':
            'assets/images/leg1.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/ca1.png',
        '르누아르': 'assets/images/ca2.png',
        '클래식 스테추아리오': 'assets/images/ca3.png',
        '엑스트라 스타투아리오': 'assets/images/ca4.png',
        '칼라카타 오로': 'assets/images/ca5.png',
        '칼라카타 글로리': 'assets/images/ca6.png',
        '비앙코': 'assets/images/ca7.png',
        '아라베스카토': 'assets/images/ca8.png',
        '스타투아리오': 'assets/images/ca9.png',
        '네로 마퀴니아': 'assets/images/ca10.png',
        '기타': 'assets/images/ca1.png',
        // Add more patterns here
      },
      '블랙': {
        'None': 'assets/images/legA2.png',
        '칼라카타 마그니피코': 'assets/images/ca1-2.png',
        '르누아르': 'assets/images/ca2-2.png',
        '클래식 스테추아리오': 'assets/images/ca3-2.png',
        '엑스트라 스타투아리오': 'assets/images/ca4-2.png',
        '칼라카타 오로': 'assets/images/ca5-2.png',
        '칼라카타 글로리': 'assets/images/ca6-2.png',
        '비앙코': 'assets/images/ca7-2.png',
        '아라베스카토': 'assets/images/ca8-2.png',
        '스타투아리오': 'assets/images/ca9-2.png',
        '네로 마퀴니아': 'assets/images/ca10-2.png',
        '기타': 'assets/images/ca1-2.png',
        // Add more patterns here
      },
    },
    '사리넨(타원형)': {
      '화이트': {
        'None':
            'assets/images/leg6.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/cb1.png',
        '르누아르': 'assets/images/cb2.png',
        '클래식 스테추아리오': 'assets/images/cb3.png',
        '엑스트라 스타투아리오': 'assets/images/cb4.png',
        '칼라카타 오로': 'assets/images/cb5.png',
        '칼라카타 글로리': 'assets/images/cb6.png',
        '비앙코': 'assets/images/cb7.png',
        '아라베스카토': 'assets/images/cb8.png',
        '스타투아리오': 'assets/images/cb9.png',
        '네로 마퀴니아': 'assets/images/cb10.png',
        '기타': 'assets/images/cb1.png',
        // Add more patterns here
      },
      '블랙': {
        'None': 'assets/images/leg6-2.png',
        '칼라카타 마그니피코': 'assets/images/cb1-2.png',
        '르누아르': 'assets/images/cb2-2.png',
        '클래식 스테추아리오': 'assets/images/cb3-2.png',
        '엑스트라 스타투아리오': 'assets/images/cb4-2.png',
        '칼라카타 오로': 'assets/images/cb5-2.png',
        '칼라카타 글로리': 'assets/images/cb6-2.png',
        '비앙코': 'assets/images/cb7-2.png',
        '아라베스카토': 'assets/images/cb8-2.png',
        '스타투아리오': 'assets/images/cb9-2.png',
        '네로 마퀴니아': 'assets/images/cb10-2.png',
        '기타': 'assets/images/cb1-2.png',

        // Add more patterns here
      },
    },
    '개트윅': {
      '블랙': {
        'None':
            'assets/images/leg2.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/cc1.png',
        '르누아르': 'assets/images/cc2.png',
        '클래식 스테추아리오': 'assets/images/cc3.png',
        '엑스트라 스타투아리오': 'assets/images/cc4.png',
        '칼라카타 오로': 'assets/images/cc5.png',
        '칼라카타 글로리': 'assets/images/cc6.png',
        '비앙코': 'assets/images/cc7.png',
        '아라베스카토': 'assets/images/cc8.png',
        '스타투아리오': 'assets/images/cc9.png',
        '네로 마퀴니아': 'assets/images/cc10.png',
        '기타': 'assets/images/cc1.png',
        // Add more patterns here
      },
    },
    '샹베리': {
      '화이트': {
        'None':
            'assets/images/leg3.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/cd1.png',
        '르누아르': 'assets/images/cd2.png',
        '클래식 스테추아리오': 'assets/images/cd3.png',
        '엑스트라 스타투아리오': 'assets/images/cd4.png',
        '칼라카타 오로': 'assets/images/cd5.png',
        '칼라카타 글로리': 'assets/images/cd6.png',
        '비앙코': 'assets/images/cd7.png',
        '아라베스카토': 'assets/images/cd8.png',
        '스타투아리오': 'assets/images/cd9.png',
        '네로 마퀴니아': 'assets/images/cd10.png',
        '기타': 'assets/images/cd1.png',
        // Add more patterns here
      },
      '블랙': {
        'None': 'assets/images/leg3-2.png',
        '칼라카타 마그니피코': 'assets/images/cd1-2.png',
        '르누아르': 'assets/images/cd2-2.png',
        '클래식 스테추아리오': 'assets/images/cd3-2.png',
        '엑스트라 스타투아리오': 'assets/images/cd4-2.png',
        '칼라카타 오로': 'assets/images/cd5-2.png',
        '칼라카타 글로리': 'assets/images/cd6-2.png',
        '비앙코': 'assets/images/cd7-2.png',
        '아라베스카토': 'assets/images/cd8-2.png',
        '스타투아리오': 'assets/images/cd9-2.png',
        '네로 마퀴니아': 'assets/images/cd10-2.png',
        '기타': 'assets/images/cd1-2.png',
        // Add more patterns here
      },
    },
    '라고스': {
      '브라운': {
        'None':
            'assets/images/leg4.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/ce1.png',
        '르누아르': 'assets/images/ce2.png',
        '클래식 스테추아리오': 'assets/images/ce3.png',
        '엑스트라 스타투아리오': 'assets/images/ce4.png',
        '칼라카타 오로': 'assets/images/ce5.png',
        '칼라카타 글로리': 'assets/images/ce6.png',
        '비앙코': 'assets/images/ce7.png',
        '아라베스카토': 'assets/images/ce8.png',
        '스타투아리오': 'assets/images/ce9.png',
        '네로 마퀴니아': 'assets/images/ce10.png',
        '기타': 'assets/images/ce1.png',
        // Add more patterns here
      },
      '블랙': {
        'None': 'assets/images/leg4-2.png',
        '칼라카타 마그니피코': 'assets/images/ce1-2.png',
        '르누아르': 'assets/images/ce2-2.png',
        '클래식 스테추아리오': 'assets/images/ce3-2.png',
        '엑스트라 스타투아리오': 'assets/images/tc4-2.png',
        '칼라카타 오로': 'assets/images/ce5-2.png',
        '칼라카타 글로리': 'assets/images/ce6-2.png',
        '비앙코': 'assets/images/ce7-2.png',
        '아라베스카토': 'assets/images/ce8-2.png',
        '스타투아리오': 'assets/images/ce9-2.png',
        '네로 마퀴니아': 'assets/images/ce10-2.png',
        '기타': 'assets/images/ce1-2.png',
        // Add more patterns here
      },
    },
    '디디모스': {
      '화이트': {
        'None':
            'assets/images/leg5.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/cf1.png',
        '르누아르': 'assets/images/cf2.png',
        '클래식 스테추아리오': 'assets/images/cf3.png',
        '엑스트라 스타투아리오': 'assets/images/cf4.png',
        '칼라카타 오로': 'assets/images/cf5.png',
        '칼라카타 글로리': 'assets/images/cf6.png',
        '비앙코': 'assets/images/cf7.png',
        '아라베스카토': 'assets/images/cf8.png',
        '스타투아리오': 'assets/images/cf9.png',
        '네로 마퀴니아': 'assets/images/cf10.png',
        '기타': 'assets/images/cf1.png',
        // Add more patterns here
      },
      '블랙': {
        'None': 'assets/images/leg5-2.png',
        '칼라카타 마그니피코': 'assets/images/cf1-2.png',
        '르누아르': 'assets/images/cf2-2.png',
        '클래식 스테추아리오': 'assets/images/cf3-2.png',
        '엑스트라 스타투아리오': 'assets/images/cf4-2.png',
        '칼라카타 오로': 'assets/images/cf5-2.png',
        '칼라카타 글로리': 'assets/images/cf6-2.png',
        '비앙코': 'assets/images/cf7-2.png',
        '아라베스카토': 'assets/images/cf8-2.png',
        '스타투아리오': 'assets/images/cf9-2.png',
        '네로 마퀴니아': 'assets/images/cf10-2.png',
        '기타': 'assets/images/cf1-2.png',
        // Add more patterns here
      },
    },
    '리프 다이닝': {
      '화이트': {
        'None':
            'assets/images/leg7.png', // Default image when no pattern is selected
        '칼라카타 마그니피코': 'assets/images/cg1.png',
        '르누아르': 'assets/images/cg2.png',
        '클래식 스테추아리오': 'assets/images/cg3.png',
        '엑스트라 스타투아리오': 'assets/images/cg4.png',
        '칼라카타 오로': 'assets/images/cg5.png',
        '칼라카타 글로리': 'assets/images/cg6.png',
        '비앙코': 'assets/images/cg7.png',
        '아라베스카토': 'assets/images/cg8.png',
        '스타투아리오': 'assets/images/cg9.png',
        '네로 마퀴니아': 'assets/images/cg10.png',
        '기타': 'assets/images/cg1.png',
        // Add more patterns here
      },
    },
    // Repeat for other leg types and colors
  };

  String get currentLegImage => _legTypeImages[_legType]!;
  String get selectedLength => _selectedLength;

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

  String get currentPatternImage2 {
    // Directly return the default image based on the leg type and leg color.
    // This ignores any specific pattern and provides a simpler method.
    return _legTypeAndColorImages[_legType]?[_legColor] ??
        'assets/images/leg1.png';
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
    '비앙코': 'assets/images/p7.png',
    '아라베스카토': 'assets/images/p8.png',
    '스타투아리오': 'assets/images/p9.png',
    '네로 마퀴니아': 'assets/images/p10.png',
    '기타': 'assets/images/p11.png',
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
    '칼라카타 마그니피코': 0,
    '르누아르': 0,
    '클래식 스테추아리오': 0,
    '엑스트라 스타투아리오': 0,
    '칼라카타 오로': 0,
    '칼라카타 글로리': 0,
    '비앙코': 100000,
    '아라베스카토': 300000,
    '스타투아리오': 200000,
    '네로 마퀴니아': 200000,
    '기타': 0
  };

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

  void revertAndResetSelections(BuildContext context, int step) {
    // 단계에 따른 조건을 설정하여, 선택한 단계 이후의 모든 선택을 초기화합니다.
    switch (step) {
      case 1:
        _legColor = '선택안함';
        _pattern = '선택안함';
        shippingRegion = '선택안함';
        _selectedLength = '선택안함';
        break;
      case 2:
        _legColor = '선택안함';
        _pattern = '선택안함';
        shippingRegion = '선택안함';
        _selectedLength = '선택안함';
        break;
      case 3:
        _pattern = '선택안함';
        shippingRegion = '선택안함';
        _selectedLength = '선택안함';
        break;
      case 4:
        shippingRegion = '선택안함';
        _selectedLength = '선택안함';
        break;
      // 이하 생략
    }
    // 이 외의 경우에는, step이 5 이상인 경우, 모든 선택을 유지합니다.

    calculateTotalPrice();
    notifyListeners();
    // 여기에 화면 전환 로직을 추가합니다.
    Widget nextPage;
    switch (step) {
      case 1:
        nextPage = const customRoute1(); // StepOnePage는 예제이며, 실제 구현 필요
        break;
      case 2:
        nextPage = const customRoute2(); // StepTwoPage는 예제이며, 실제 구현 필요
        break;
      case 3:
        nextPage = const customRoute3(); // StepThreePage는 예제이며, 실제 구현 필요
        break;
      case 4:
        nextPage = const customRoute4(); // StepFourPage는 예제이며, 실제 구현 필요
        break;
      default:
        nextPage = const customRoute5(); // HomePage는 사용자를 메인 페이지로 돌려보내는 예제
    }

    // Navigator를 사용하여 nextPage로 화면 전환
    Navigator.of(context).pushReplacement(
      createRoute(
        nextPage,
      ),
    );
  }

  void revertToPreviousSelection() {
    if (_selectionHistory.isNotEmpty) {
      // 현재 상태를 제거
      _selectionHistory.removeLast();
      _selectionHistory.removeLast();
      // 제거 후 _selectionHistory가 여전히 비어있지 않다면, 이전 상태로 복원
      if (_selectionHistory.isNotEmpty) {
        var previousSelection = _selectionHistory.last;
        _legType = previousSelection['legType'];
        _legColor = previousSelection['legColor'];
        _pattern = previousSelection['pattern'];
        shippingRegion = previousSelection['shippingRegion'] ?? '선택안함';
        _selectedLength = previousSelection['selectedLength'] ?? '선택안함';
      } else {
        // _selectionHistory가 비어있다면, 모든 선택을 기본값으로 리셋
        resetToDefault();
      }
      calculateTotalPrice();
      notifyListeners();
    }
  }

  String get getCurrentPatternImage2 {
    // 패턴이 선택되지 않았거나 기본값일 경우, 기본 이미지 경로 반환

    // 패턴이 선택되었을 때, 해당하는 이미지 경로를 반환
    // legTypeColorToPatternImages2 맵을 사용
    return legTypeColorToPatternImages2[_legType]?[_legColor]?[_pattern] ??
        'assets/images/leg1.png';
  }

  // 패턴을 설정하는 메소드에서 패턴 변경 시 notifyListeners()를 호출하여
  // 관찰자에게 상태 변경을 알리는 부분은 동일하게 유지됩니다.

  // 나머지 클래스 구현...

  void resetToDefault() {
    // 기본 선택으로 리셋
    _legType = '사리넨(정원형)';
    _legColor = '선택안함';
    _pattern = '선택안함';
    shippingRegion = '선택안함';
    _selectedLength = '선택안함';
    // 기본 상태의 가격을 계산
    calculateTotalPrice();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
