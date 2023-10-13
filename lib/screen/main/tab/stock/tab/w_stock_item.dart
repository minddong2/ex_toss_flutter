import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/num_extension.dart';
import 'package:fast_app_base/common/widget/w_empty_expanded.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/vo_stock.dart';
import 'package:flutter/material.dart';

class StockItem extends StatelessWidget {
  final Stock stock;
  const StockItem(this.stock, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
      children: [
        Image.asset(stock.stockImagePath, width: 50),
        width20,
        (stock.stockName).text.size(16).bold.make(),
        emptyExpanded,
        Column(crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          ///(오늘의 가격- 전날의 가격) %
          stock.todayPercentageString.text.color(stock.getPriceColor(context)).size(16).make(),
          "${stock.currentPrice.toComma()}원".text.color(context.appColors.lessImportant).make(),

        ],)
      ],
    ),);
  }
}
