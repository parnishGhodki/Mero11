import 'dart:async';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MatchTimerWidget extends StatefulWidget {
  final String dateStart;
  final String timerStart;
  final TimerType timerType;
  final double fontSize;
  final bool fontWeight;
  final Color color;

  const MatchTimerWidget({
    Key key,
    this.dateStart,
    this.timerStart,
    this.timerType = TimerType.isHomeScreen,
    this.fontSize = 14,
    this.fontWeight = true,
    this.color,
  }) : super(key: key);

  @override
  createState() => _MatchTimerState();
}

class _MatchTimerState extends State<MatchTimerWidget> {
  var timerCountDown;
  Color colors = Colors.blue;
  DateTime finalDate;
  Timer timer;
  bool isToday = false;

  @override
  void initState() {
    if (widget.color != null) {
      colors = widget.color;
    }
    finalDate = DateFormat('yyyy-MM-dd HH:mm:ss')
        .parse(widget.dateStart + " " + widget.timerStart);
    setTime();
    super.initState();
  }

  void setTime() {
    if (finalDate.difference(DateTime.now()).inSeconds < 0) {
      setState(() {
        timerCountDown = "LIVE" /*'00' + ' : ' + '00' + ' : ' + '00'*/;
      });
    } else {
      if (finalDate.difference(DateTime.now()).inHours < 24) {
        isToday = false;
        timer?.cancel();
        setJustTime();
        timer = new Timer(new Duration(seconds: 1), () {
          setJustTime();
          setTime();
        });
      } else {
        isToday = true;
        final date = DateFormat('yyyy-MM-dd').parse(widget.dateStart);
        final today = DateFormat('yyyy-MM-dd').parse(DateTime.now().toString());
        if (date.difference(today).inDays == 1) {
          timerCountDown = 'Tomorrow';
        } else {
          if (!mounted) return;
          setState(() {
            timerCountDown = DateFormat.E().format(date) +
                ', ' +
                DateFormat.d().format(date) +
                ' ' +
                DateFormat.MMM().format(date);
          });
        }
      }
    }
  }

  void setJustTime() {
    final seconds = finalDate.difference(DateTime.now()).inSeconds;
    if (!mounted) return;
    setState(() {
      timerCountDown = secondsToHoursMinutesSeconds(seconds);
    });
  }

  String secondsToHoursMinutesSeconds(int seconds) {
    var hourCount = seconds ~/ 3600;
    var minuteCount = (seconds % 3600) ~/ 60;
    var secondCount = (seconds % 3600) % 60;

    final finalHourText = hourCount < 10 ? '0$hourCount' : '$hourCount';
    final finalMinuteText = minuteCount < 10 ? '0$minuteCount' : '$minuteCount';
    final finalSecondText = secondCount < 10 ? '0$secondCount' : '$secondCount';
    var finalText =
        finalHourText + ' : ' + finalMinuteText + ' : ' + finalSecondText;
    if (widget.timerType == TimerType.isHomeScreen) {
      finalText =
          finalHourText + ' : ' + finalMinuteText + ' : ' + finalSecondText;
    } else if (widget.timerType == TimerType.isCreateTeam) {
      finalText =
          finalHourText + ' : ' + finalMinuteText + ' : ' + finalSecondText;
    }
    return finalText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(timerCountDown,
            style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight:
                  (widget.fontWeight ? FontWeight.bold : FontWeight.normal),
              color: (widget.timerType == TimerType.isHomeScreen)
                  ? !isToday
                      ? colors
                      : HexColor('#AAAFBC')
                  : colors,
            )));
  }
}

enum TimerType {
  isCreateTeam,
  isHomeScreen,
}
