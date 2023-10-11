import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/benefit/benefits_dummy.dart';
import 'package:fast_app_base/screen/main/tab/benefit/w_benefit_item.dart';
import 'package:fast_app_base/screen/main/tab/benefit/w_point_button.dart';
import 'package:flutter/material.dart';

class BenefitFragement extends StatefulWidget {
  const BenefitFragement({super.key});

  @override
  State<BenefitFragement> createState() => _BenefitFragementState();
}

class _BenefitFragementState extends State<BenefitFragement> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: MainScreenState.bottomNavigatorHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height30,
          "혜택".text.black.bold.size(18).make(),
          height30,
          const PointButton(point: 569),
          height20,
          "혜택 더 받기".text.black.bold.size(16).make(),
          ...benefitList.map((element) => BenefitItem(benefit: element)).toList(),
        ],
      ).pSymmetric(h: 20),
    );
  }
}
