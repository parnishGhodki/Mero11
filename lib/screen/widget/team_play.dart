import 'package:cricketfantasy/screen/page/contests.dart';
import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:flutter/material.dart';
import 'matchtimer.dart';

class TeamPlayWidget extends StatefulWidget {
  final String matchStatus,
      seriesName,
      teamNameA,
      teamNameB,
      countryImageA,
      countryImageB,
      //totalContestJoin;
      date,
      time,
      userid;
  final int noOfContests;
  final Data1 match;

  final bool contestJoinShow;

  const TeamPlayWidget(
      {Key key,
      this.matchStatus,
      this.seriesName,
      this.teamNameA,
      this.teamNameB,
      this.countryImageA,
      this.countryImageB,
      this.noOfContests,
      this.date,
      this.time,
      this.contestJoinShow = false,
      this.match,
      this.userid})
      : super(key: key);

  @override
  createState() => _TeamPlayState();
}

class _TeamPlayState extends State<TeamPlayWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            onTap: () {
              print(widget.match.matchId);
              print(widget.userid);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContestsScreen(
                        match: widget.match, userid: widget.userid),
                  ));
            },
            onLongPress: () {
              //showModalBottomSheet<void>(
              //  context: context,
              //  builder: (BuildContext context) =>
              //      MatchDetailWidget()); //widget called
            },
            child: Column(children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle)),
                        Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: widget.matchStatus == "0"
                                ? Text("Upcoming")
                                : Text("Started"))
                      ])),
              Container(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Row(children: <Widget>[
                    Container(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            backgroundImage:
                                ExactAssetImage(widget.countryImageA))),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          Text(widget.seriesName,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black54)),
                          Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Text(widget.teamNameA,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)))),
                                    Text('vs',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.red)),
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(right: 8),
                                            child: Text(widget.teamNameB,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.end)))
                                  ])),
                          MatchTimerWidget(
                              dateStart: widget.date, timerStart: widget.time)
                        ])),
                    Container(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            backgroundImage:
                                ExactAssetImage(widget.countryImageB)))
                  ])),
              widget.contestJoinShow
                  ? Container(
                      padding:
                          const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                      child: Row(children: <Widget>[
                        Text(widget.noOfContests.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 3),
                        Text('Contests ',
                            style: TextStyle(color: Colors.blueGrey))
                      ]))
                  : Container()
            ])));
  }
}
