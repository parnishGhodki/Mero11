import 'dart:async';
import 'package:flutter/material.dart';

class OtpTimerWidget extends StatefulWidget {
  final void Function(bool isFinish) timeCallBack;

  const OtpTimerWidget({Key key, this.timeCallBack}) : super(key: key);
  @override
  createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimerWidget> {
  Timer timer;
  var timerSecond = 60;
  var timerChangeValue = '60';

  setSecondView() {
    timer?.cancel();
    timer = new Timer(new Duration(seconds: 1), () {
      if (timerSecond - 1 != -1) {
        timerSecond -= 1;
        timerChangeValue = '$timerSecond';
        if (timerChangeValue.length == 1) {
          timerChangeValue = '0$timerChangeValue';
        }
        setState(() {});
        setSecondView();
        if (timerSecond == 0) {
          timer?.cancel();
          widget.timeCallBack(true);
        }
      }
    });
  }

  @override
  void initState() {
    setSecondView();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('0:$timerChangeValue', textAlign: TextAlign.center));
  }
}
