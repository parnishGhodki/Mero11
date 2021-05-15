import 'dart:core';
import 'package:cricketfantasy/model/contests_response.dart';
import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/screen/page/contest_invite_code.dart';
import 'package:cricketfantasy/screen/page/create_contest_own.dart';
import 'package:cricketfantasy/screen/page/create_team.dart';
import 'package:cricketfantasy/screen/widget/contests.dart';
import 'package:cricketfantasy/services/contests.dart';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'myTeams.dart';

List<Contests> contestsList = List<Contests>();
String text = "Loading";

class ContestsScreen extends StatefulWidget {
  final Data1 match;
  final String userid;

  ContestsScreen({Key key, this.match, this.userid}) : super(key: key);
  @override
  createState() => _ContestsState();
}

class _ContestsState extends State<ContestsScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getContestList().then((response) {
      setState(() {
        contestsList = response;
        if (contestsList.isEmpty) {
          text = "No Contests Found";
        }
      });
    });
  }

  getContestList() async {
    GetContests getContests = GetContests();
    print(widget.userid + widget.match.matchId);
    return await getContests.getInfo(widget.userid, widget.match.matchId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(elevation: 1, title: Text('Contests')),
        bottomNavigationBar: Container(
            height: 40,
            child: Container(
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(4.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 0),
                          blurRadius: 0.0)
                    ]),
                child: Material(
                    color: Color.fromRGBO(161, 14, 41, 1),
                    child: InkWell(
                        borderRadius: new BorderRadius.circular(4.0),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateTeamScreen(
                                matchid: widget.match.matchId,
                                userid: widget.userid,
                              ),
                            )),
                        child: Center(child: Text('CREATE TEAM')))))),
        body: Column(children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              child: Expanded(
                  child: Row(children: <Widget>[
                Container(
                    width: 40,
                    height: 60,
                    child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.1),
                        backgroundImage:
                            ExactAssetImage(profileImage /*logo1*/))),
                Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text(widget.match.team1,
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text('vs', style: TextStyle(fontSize: 18, color: Colors.red)),
                Container(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text(widget.match.team2,
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Container(
                    width: 40,
                    height: 40,
                    child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.1),
                        backgroundImage:
                            ExactAssetImage(profileImage /*logo2*/)))
              ]))),
          Divider(height: 1),
          Container(
              height: 30,
              margin: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(4.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: Offset(0, 0.3))
                                ]),
                            child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                    borderRadius:
                                        new BorderRadius.circular(4.0),
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyTeamScreen(
                                                  matchid: widget.match.matchId,
                                                  userid: widget.userid,
                                                ),
                                            fullscreenDialog: true)),
                                    child: Container(
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8),
                                        child: Center(
                                            child: Text('My Teams',
                                                style: TextStyle(
                                                    color: Colors.black)))))))),
                    //SizedBox(width: 16),
                  ])),
          Container(
              height: 30,
              margin: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(4.0),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: Offset(0, 0.3))
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        borderRadius:
                                            new BorderRadius.circular(4.0),
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CreateContestOwnScreen(
                                                      match: widget.match,
                                                      userid: widget.userid,
                                                    ),
                                                fullscreenDialog: true)),
                                        child: Container(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Center(
                                                child: Text('Create Contest',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.black)))))),
                                Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        borderRadius:
                                            new BorderRadius.circular(4.0),
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ContestInviteCodeScreen(
                                                      match: widget.match,
                                                      userid: widget.userid,
                                                    ),
                                                fullscreenDialog: true)),
                                        child: Container(
                                            padding: EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Center(
                                                child: Text('Join Contest',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.black))))))
                              ])),
                      //SizedBox(width: 16),
                    )
                  ])),
          contestsList.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Material(
                            child: StickyHeader(
                                header: Container(
                                    padding: EdgeInsets.all(5),
                                    color: HexColor('#F5F5F5'),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Column(children: <Widget>[
                                            InkWell(
                                                child:
                                                    Column(children: <Widget>[
                                              //Text(contestsList.elementAt(index).title),
                                              SizedBox(height: 1),
                                              //Text(contestsList.elementAt(index).description,
                                              /*style: TextStyle(
                                                  color: Colors.black54)*/
                                            ]))
                                          ])
                                        ])),
                                content: Column(
                                    children: getContestsSubList(
                                        contestsList, widget.userid))));
                      }))
              : Text(text)
        ]));
  }
}

List<Widget> getContestsSubList(List<Contests> contestList, String userid) {
  var widgetList = List<Widget>();

  for (int i = 0; i < contestList.length; i++) {
    widgetList.add(ContestsWidget(
      contests: contestList.elementAt(i),
      userid: userid,
    ));
  }

  return widgetList;
}
