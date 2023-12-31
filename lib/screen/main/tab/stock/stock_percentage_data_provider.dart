import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/double_extensions.dart';

abstract mixin class StockPercentageDataProvider {
//추상화된 클래스에는 이 필드가 존재한다고 getter를 미리 명시해줄 수 있음
  int get currentPrice;

  int get yesterdayClosePrice;

  double get todayPercentage =>
      ((currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100)
          .toPrecision(2);

  String get todayPercentageString => "$symbol$todayPercentage%";

  bool get isPlus => currentPrice > yesterdayClosePrice;

  bool get isSame => currentPrice == yesterdayClosePrice;

  bool get isMinus => currentPrice < yesterdayClosePrice;

  String get symbol => isSame
      ? ""
      : isPlus
          ? "+"
          : "-";

  Color getTodayPercentageColor(BuildContext context) => isSame
      ? context.appColors.lessImportant
      : isPlus
          ? context.appColors.plus
          : context.appColors.minus;
}
