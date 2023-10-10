import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/enum/enum_nav_ani.dart';

class NoitificationDialog extends DialogWidget {
  final List<TossNotification> notifications;

  NoitificationDialog(this.notifications, {super.key, super.animation = NavAni.Bottom});

  @override
  DialogState<NoitificationDialog> createState() => _NoitificationDialogState();
}

class _NoitificationDialogState extends DialogState<NoitificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...widget.notifications
              .map((element) => NotificationItemWidget(
                    notification: element,
                    onTap: () {
                      //Nav.pop(context);
                      widget.hide();
                    },
                  ))
              .toList()
        ],
      ),
    );
  }
}
