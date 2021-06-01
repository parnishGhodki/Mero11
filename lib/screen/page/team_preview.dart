import 'package:cricketfantasy/model/player_list.dart';
import 'package:cricketfantasy/screen/page/tab.dart';
import 'package:cricketfantasy/services/createTeam.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'playerprofile.dart';

enum CreateTeamPreviewType { regular, created }

class TeamPreviewScreen extends StatefulWidget {
  final List<Data> wkList;
  final List<Data> batList;
  final List<Data> arList;
  final List<Data> bowlList;
  final Data captain;
  final Data vicecaptain;
  final String userid;
  final String matchid;
  const TeamPreviewScreen(
      {Key key,
      this.arList,
      this.batList,
      this.bowlList,
      this.wkList,
      this.captain,
      this.vicecaptain,
      this.matchid,
      this.userid})
      : super(key: key);
  @override
  createState() => _TeamPreviewState();
}

class _TeamPreviewState extends State<TeamPreviewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: Stack(children: <Widget>[
          Scaffold(
              backgroundColor: Colors.transparent,
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
                              onTap: () async {
                                CreateTeam createteam = CreateTeam();
                                bool result = await createteam.createTeam(
                                    widget.wkList,
                                    widget.batList,
                                    widget.arList,
                                    widget.bowlList,
                                    widget.userid,
                                    widget.matchid,
                                    widget.captain.pid,
                                    widget.vicecaptain.pid);
                                if (result == true) {
                                  final status =
                                      Provider.of<User>(context, listen: false);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TabScreen(
                                                user: status,
                                                index: 1,
                                              ),
                                          fullscreenDialog: true));
                                } else {
                                  print("Try Again");
                                }
                              }, ///////////////team preview screen is called
                              child: Center(child: Text('Confirm')))))),
              body: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Opacity(
                        opacity: 0.1,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Image.asset(
                                'assets/images/cricket_ground.png',
                                fit: BoxFit.cover))),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 1),
                          Column(children: <Widget>[
                            matchHeader('WICKET - KEEPER'),
                            getTypeList(widget.wkList)
                          ]),
                          Column(children: <Widget>[
                            matchHeader('BATSMEN'),
                            getTypeList(widget.batList)
                          ]),
                          Column(children: <Widget>[
                            matchHeader('ALL-ROUNDERS'),
                            getTypeList(widget.arList),
                          ]),
                          Column(children: <Widget>[
                            matchHeader('BOWLERS'),
                            getTypeList(widget.bowlList)
                          ]),
                          SizedBox(height: 8)
                        ])
                  ])),
          Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Container(
                  height: AppBar().preferredSize.height,
                  child: Row(children: <Widget>[
                    Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                width: AppBar().preferredSize.height,
                                height: AppBar().preferredSize.height,
                                child:
                                    Icon(Icons.close, color: Colors.white)))),
                    Expanded(child: Container())
                  ])))
        ]));
  }

  matchHeader(String title) => Container(
      padding: EdgeInsets.only(bottom: 8, top: 4),
      child: Text(title, style: TextStyle(color: Colors.black)));

  Widget getTypeList(List<Data> list) {
    List<Widget> widgetList = List<Widget>();
    if (list != null)
      list.forEach((data) {
        widgetList.add(getPlayerView(data));
      });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: widgetList,
    );
  }

  Widget getPlayerView(Data player) {
    return Stack(children: <Widget>[
      Container(
          padding: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width > 360 ? 8 : 4),
              right: (MediaQuery.of(context).size.width > 360 ? 8 : 4)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayerProfileScreen(),
                            fullscreenDialog: true)),
                    child: Container(
                        width:
                            (MediaQuery.of(context).size.width > 360 ? 45 : 40),
                        height:
                            (MediaQuery.of(context).size.width > 360 ? 45 : 40),
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            backgroundImage: ExactAssetImage(profileImage)))),
                Container(
                    padding:
                        EdgeInsets.only(left: 6, top: 2, bottom: 2, right: 6),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(color: Color.fromRGBO(161, 14, 41, 1))
                        ]),
                    child: Center(
                        child: Text(player.name,
                            style: TextStyle(color: Colors.black)))),
                Container(
                    padding: EdgeInsets.all(4),
                    child: Center(
                        child: player.credit != null
                            ? Text(player.credit + ' Cr',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                            : Text("NA",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))))
              ])),
      Positioned(
          top: 0,
          left: 0,
          child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: new BorderRadius.circular(32.0),
                  border: new Border.all(width: 1.0, color: Colors.black12)),
              child: Container(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Center(child: Text('C')))))
    ]);
  }
}
