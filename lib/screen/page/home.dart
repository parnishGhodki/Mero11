import 'dart:ui';
import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/model/userInfo.dart';
import 'package:cricketfantasy/screen/page/my_profile.dart';
import 'package:cricketfantasy/screen/widget/team_play.dart';
import 'package:cricketfantasy/services/fixtures.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cricketfantasy/util/extensions.dart';
import 'package:cricketfantasy/services/authenticate.dart';
import 'package:provider/provider.dart';

List<Data1> matchList = List<Data1>();

class HomeScreen extends StatefulWidget {
  final User user;
  final userInfo userinfo;
  final void Function() menuCallBack;
  String userid = "2";
  //final void Function() notification;

  HomeScreen({Key key, this.menuCallBack, this.user, this.userinfo})
      : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  double _appBarHeight = 100.0;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoginProgress = false;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Future<void> initState() {
    super.initState();
    if (widget.userinfo.data != null) {
      print("Executed");
      getMatchList().then((response) {
        setState(() {
          print(matchList);
          matchList = response;
        });
      });
    } else {
      print("Not Executed");
    }
  }

  getMatchList() async {
    fixtureResponse fixtureresponse = fixtureResponse();
    UserData userData = UserData();
    return await fixtureresponse.getFixtures(widget.userinfo.data.userId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
          key: _scaffoldKey,
          body: RefreshIndicator(
              displacement: 100,
              key: _refreshIndicatorKey,
              onRefresh: () async {},
              child:
                  CustomScrollView(physics: BouncingScrollPhysics(), slivers: <
                      Widget>[
                widget.sliverAppBar(
                    _appBarBehavior,
                    [
                      //widget.notificationIcon(widget.menuCallBack),
                      widget.drawerIcon(widget.menuCallBack),
                    ],
                    widget.flexibleSpaceBar(appName)),
                matchList.isNotEmpty
                    ? SliverList(
                        delegate: new SliverChildBuilderDelegate(
                            (context, index) => TeamPlayWidget(
                                  matchStatus:
                                      matchList.elementAt(index).matchStarted,
                                  seriesName:
                                      "IPL" /*matchList.elementAt(index).league*/,
                                  teamNameA: matchList.elementAt(index).team1,
                                  teamNameB: matchList.elementAt(index).team2,
                                  countryImageA:
                                      "assets/images/user_profile.png" /*temp*/,
                                  countryImageB:
                                      "assets/images/user_profile.png" /*temp*/,
                                  contestJoinShow: true /*temp*/,
                                  noOfContests:
                                      matchList.elementAt(index).noOfContest,
                                  date:
                                      getDate(matchList.elementAt(index).date),
                                  time: getTime(matchList
                                      .elementAt(index)
                                      .dateTimeGMT) /*matchList.elementAt(index).dateTimeGMT*/,
                                  match: matchList.elementAt(index),
                                  userid: widget.userid /*userinfo.userId*/,
                                ),
                            childCount: matchList.length /*matchList.length*/),
                      )
                    : SliverList(
                        delegate: new SliverChildBuilderDelegate(
                            (context, index) => TeamPlayWidget(
                                  matchStatus: "",
                                  seriesName: '',
                                  teamNameA: "",
                                  teamNameB: "",
                                  countryImageA:
                                      "assets/images/user_profile.png" /*temp*/,
                                  countryImageB:
                                      "assets/images/user_profile.png" /*temp*/,
                                  contestJoinShow: true /*temp*/,
                                  noOfContests: 0,
                                  date: "",
                                  time:
                                      "20:00:00" /*matchList.elementAt(index).dateTimeGMT*/,
                                ),
                            childCount: 0 /*matchList.length*/),
                      )
              ]))),
    ]);
  }
}

enum AppBarBehavior { normal, pinned, floating, snapping }

String getDate(String date) {
  return date.substring(0, 10);
}

String getTime(String time) {
  return time.substring(11, 19);
}
