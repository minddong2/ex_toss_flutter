import 'package:fast_app_base/common/data/app_preferences.dart';
import 'package:fast_app_base/common/data/preference/item/preference_item.dart';
import 'package:fast_app_base/common/data/preference/item/rx_preference_item.dart';
import 'package:fast_app_base/common/data/preference/item/rxn_preference_item.dart';
import 'package:fast_app_base/common/theme/custom_theme.dart';
import 'package:get/get_rx/get_rx.dart';

class Prefs {
  static final appTheme = PreferenceItem<CustomTheme>('appTheme', CustomTheme.light);
  static final isPushOn = PreferenceItem<bool>('isPushOn', false);
  static final isPushOnRx = RxPreferenceItem<bool, RxBool>('isPushOnRx', false);
  static final sliderPosition = RxPreferenceItem<double, RxDouble>('sliderPosition', 0.0);
  static final birthday = RxnPreferenceItem<DateTime, Rxn<DateTime>>('birthday');
  static final number = RxPreferenceItem<int, RxInt>('number', 0);

}
