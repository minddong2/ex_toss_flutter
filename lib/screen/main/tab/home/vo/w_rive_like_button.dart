import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../../../common/common.dart';

class RiveLikeButton extends StatefulWidget {
  final bool isLike;
  final void Function(bool isLike) onTapLike;

  const RiveLikeButton(this.isLike, {required this.onTapLike, super.key});

  @override
  State<RiveLikeButton> createState() => _RiveLikeButtonState();
}

class _RiveLikeButtonState extends State<RiveLikeButton> {
  late StateMachineController controller;
  late SMIBool smiPressed;
  //StateMachineInput의 축약어
  late SMIBool smiHover;

  @override
  void didUpdateWidget(covariant RiveLikeButton oldWidget) {
    if(oldWidget.isLike != widget.isLike) {
        smiPressed.value = widget.isLike;
        smiHover.value = widget.isLike;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: (){
        widget.onTapLike(!widget.isLike);
      },
      child: RiveAnimation.asset(
        "$baseRivePath/light_like2.riv",
        stateMachines: ['State Machine 1'],
        onInit: (Artboard art) {
          controller = StateMachineController.fromArtboard(art, 'State Machine 1')!;
          controller.isActive = true;
          art.addController(controller);
          smiPressed = controller.findInput<bool>('Pressed') as SMIBool;
          smiHover = controller.findInput<bool>('Hover') as SMIBool;
        },
      ),
    );
  }
}
