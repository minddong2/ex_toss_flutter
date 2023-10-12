import 'package:fast_app_base/screen/main/tab/stock/tab/vo_simple_stock.dart';

class PopularStock extends SimpleStock {
  final int yesterdayClosePrice;
  final int currentPrice;

  PopularStock({required this.yesterdayClosePrice, required this.currentPrice, required String stockName}) : super(stockName);
}
