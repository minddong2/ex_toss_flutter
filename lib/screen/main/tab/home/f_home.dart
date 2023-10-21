import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/w_rive_like_button.dart';
import 'package:fast_app_base/screen/main/tab/home/w_bank_account.dart';
import 'package:fast_app_base/screen/main/tab/home/w_toss_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:live_background/live_background.dart';
import 'package:live_background/widget/live_background_widget.dart';
import '../../../../common/widget/w_big_button.dart';
import '../../s_main.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          LiveBackgroundWidget(
            palette: Palette(colors: [Colors.red, Colors.green]),
            velocityX: 1,
            particleMaxSize: 20,
          ),
          RefreshIndicator(
            edgeOffset: TossAppBar.appBarHeight,
            onRefresh: () async {
              await sleepAsync(500.ms as int);
            },
            child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                    top: TossAppBar.appBarHeight,
                    bottom: MainScreenState.bottomNavigatorHeight),
                child: Column(
                  children: [
                    SizedBox(
                        height: 250,
                        width: 250,
                        child: RiveLikeButton(
                          isLike,
                          onTapLike: (isLike) {
                            setState(() {
                              this.isLike = isLike;
                            });
                          },
                        )),
                    BigButton(
                      "토스뱅크",
                      onTap: () {
                        context.showSnackbar("토스뱅크를 눌렀어요.test");
                      },
                    ),
                    height10,
                    RoundedContainer(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "자산".text.bold.white.make(),
                        height5,
                        ...bankAccounts
                            .map((e) => BankAccountWidget(e))
                            .toList(),
                      ],
                    )),
                  ],
                ).pSymmetric(
                    h: 20) //.animate().slideY(duration: 3000.ms).fadeIn(),
                ),
          ),
          const TossAppBar()
        ],
      ),
    );
  }
}
