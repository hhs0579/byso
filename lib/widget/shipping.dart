import 'package:auto_size_text/auto_size_text.dart';
import 'package:byso/%08widget/number.dart';
import 'package:byso/model/deskmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShippingRegionPickerWidget extends StatelessWidget {
  const ShippingRegionPickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<DeskCustomizationModel>(context);
    final availableShippingRegions = model.getAvailableShippingRegions();

    // 자동으로 첫 번째 배송 옵션 선택 (조건에 따라)

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: availableShippingRegions.map((region) {
            bool isSelected = model.shippingRegion == region;
            return GestureDetector(
              onTap: () => model.setShippingRegion(region),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.white : Colors.black,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? Colors.black : Colors.grey,
                            ),
                          ),
                          child: isSelected
                              ? const Icon(Icons.check,
                                  size: 18, color: Colors.black)
                              : Container(),
                        ),
                        const SizedBox(width: 8),
                        AutoSizeText(region,
                            maxFontSize: 24,
                            style: TextStyle(
                                fontSize: 20.sp, color: Colors.white)),
                      ],
                    ),
                    AutoSizeText(
                      '+${formatPriceWithCommas(model.shippingCosts[region] ?? 0)}원',
                      maxFontSize: 24,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
