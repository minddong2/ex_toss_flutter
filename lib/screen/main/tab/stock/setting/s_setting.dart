import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/data/prefs.dart';
import 'package:flutter/material.dart';


import 'w_switch_menu.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isPushOn = false;

  @override
  void initState() {
    isPushOn = Prefs.isPushOn.get()!;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: '설정'.text.make(),
      ),
      body: ListView(
          children: [
          //switch
            SwitchMenu('푸시 설정', isPushOn, onChanged: (isOn){
              Prefs.isPushOn.set(isOn);
              setState(() {
                isPushOn = isOn;
              });

      }),
      //slider
      //date time
      //number
      ],
    ),);
  }
}
