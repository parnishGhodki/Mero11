import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';

class MatchDetailWidget extends StatefulWidget {
  const MatchDetailWidget({Key key}) : super(key: key);
  @override
  createState() => _MatchDetailState();
}

class _MatchDetailState extends State<MatchDetailWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      matchVs(),
      Divider(height: 1),
      Expanded(child: matchInfoList())
    ]));
  }

  matchInfoList() =>
      ListView(physics: BouncingScrollPhysics(), children: <Widget>[
        matchInfo('Match', 'SA Vs IND'),
        matchInfo('Series', 'ICC Cricket World Cup'),
        matchInfo('Start Date', ''),
        matchInfo('Start Time', '15:00:00'),
        matchInfo('Venue', 'India'),
        matchInfo('Umpires', 'Martine'),
        matchInfo('Referee', 'Charls piter'),
        matchInfo('Match Format', ''),
        matchInfo('Location', 'India')
      ]);
}

matchInfo(String title, String description) => Column(children: <Widget>[
      Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title, style: TextStyle(color: Colors.black54)),
                SizedBox(width: 20),
                Flexible(child: Text(description))
              ])),
      Divider()
    ]);

matchVs() => Container(
    padding: EdgeInsets.all(10),
    height: 60,
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 30,
              height: 30,
              child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  backgroundImage: ExactAssetImage(profileImage))),
          Container(
              margin: EdgeInsets.only(left: 4),
              child: new Text('Team A',
                  style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(width: 10),
          Text('vs', style: TextStyle(fontSize: 18, color: Colors.red)),
          SizedBox(width: 10),
          Container(
              child: new Text('Team B',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold))),
          Container(
              margin: EdgeInsets.only(left: 4),
              width: 30,
              height: 30,
              child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  backgroundImage: ExactAssetImage(profileImage))),
          Expanded(child: Container()),
          Text('Time')
        ]));
