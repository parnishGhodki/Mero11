import 'package:cricketfantasy/model/player_list.dart';
import 'package:cricketfantasy/screen/page/create_team.dart';
import 'package:cricketfantasy/screen/page/team_preview.dart';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import 'package:selectable_container/selectable_container.dart';
import 'playerprofile.dart';

List<Data> allPalyersList = List<Data>();
List<bool> selected1 = List<bool>();
List<bool> selected2 = List<bool>();
Data c = null;
Data vc = null;

class ChooseCVCScreen extends StatefulWidget {
  final List<Data> wicketKeeperList;
  final List<Data> batsmenList;
  final List<Data> allRounderList;
  final List<Data> bowlerList;
  final String userid;
  final String matchid;
  ChooseCVCScreen(
      {Key key,
      this.allRounderList,
      this.batsmenList,
      this.bowlerList,
      this.wicketKeeperList,
      this.matchid,
      this.userid})
      : super(key: key);

  @override
  createState() => _ChooseCVCState();
}

class _ChooseCVCState extends State<ChooseCVCScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    allPalyersList.clear();
    c = null;
    vc = null;

    allPalyersList.addAll(batsmenList);
    allPalyersList.addAll(wicketKeeperList);
    allPalyersList.addAll(allRounderList);
    allPalyersList.addAll(bowlerList);

    setuplist(playerList.length);
  }

  void setuplist(int length) {
    for (int i = 0; i < length; i++) {
      selected1.add(false);
      selected2.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 1, title: Text('Choose C and VC')),
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TeamPreviewScreen(
                                        wkList: widget.wicketKeeperList,
                                        arList: widget.allRounderList,
                                        batList: widget.batsmenList,
                                        bowlList: widget.bowlerList,
                                        captain: c,
                                        vicecaptain: vc,
                                        userid: widget.userid,
                                        matchid: widget.matchid,
                                      ),
                                  fullscreenDialog: true));
                        }, ///////////////team preview screen is called
                        child: Center(child: Text('Team Preview')))))),
        key: _scaffoldKey,
        body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(8),
                child: Center(
                    child: Text('Choose your Captain and Vice Captain',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )))),
            Container(
                margin: EdgeInsets.all(8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Container(
                            width: 25,
                            height: 25,
                            child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                    border: new Border.all(
                                        width: 1.0, color: Colors.black)),
                                child: Center(
                                    child: Text('C',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))))),
                        Text(' gets 2x points',
                            style: TextStyle(color: Colors.black))
                      ]),
                      SizedBox(width: 8),
                      Row(children: <Widget>[
                        Container(
                            width: 25,
                            height: 25,
                            child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                    border: new Border.all(
                                        width: 1.0, color: Colors.black)),
                                child: Center(
                                    child: Text('VC',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black))))),
                        Text(' gets 1.5x points',
                            style: TextStyle(color: Colors.black))
                      ])
                    ]))
          ]),
          Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: allPalyersList.length,
                  itemBuilder: (context, index) => PlayerWidget(
                        allPalyersList.elementAt(index),
                      )))
        ]));
  }

  Widget PlayerWidget(Data player) {
    bool value = false;
    return SelectableContainer(
        selected: value,
        onValueChanged: (newValue) {
          setState(() {
            value = newValue;
            print(player);

            if (!selected1[allPalyersList.indexOf(player)]) {
              if (c == null) {
                if (!selected2[allPalyersList.indexOf(player)]) {
                  c = player;
                  selected1[allPalyersList.indexOf(player)] =
                      !selected1[playerList.indexOf(player)];
                }
              }
            } else {
              if (player == c) {
                c = null;
                selected1[allPalyersList.indexOf(player)] =
                    !selected1[playerList.indexOf(player)];
              }
            }

            if (!selected2[allPalyersList.indexOf(player)]) {
              if (vc == null) {
                if (!selected1[allPalyersList.indexOf(player)]) {
                  vc = player;
                  selected2[allPalyersList.indexOf(player)] =
                      !selected2[playerList.indexOf(player)];
                }
              }
            } else {
              if (player == vc) {
                vc = null;
                selected2[allPalyersList.indexOf(player)] =
                    !selected2[playerList.indexOf(player)];
              }
            }

            print(selected1[allPalyersList.indexOf(player)]);
            print(selected2[allPalyersList.indexOf(player)]);
          });
        },
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 0, bottom: 3),
                child: Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(5),
                      child: Row(children: <Widget>[
                        Container(
                            child: InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PlayerProfileScreen(),
                                        fullscreenDialog: true)),
                                child: Container(
                                    width: 45,
                                    height: 45,
                                    child: CircleAvatar(
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.1),
                                        backgroundImage:
                                            ExactAssetImage(profileImage))))),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(player.name,
                                          style: TextStyle(fontSize: 14)),
                                      Container(
                                          padding: EdgeInsets.only(top: 1),
                                          child: Text(" ",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black54)))
                                    ]))),
                        Container(
                            width: 70,
                            child: Center(
                                child: player.points != null
                                    ? Text(player.points.toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54))
                                    : Text("NA"))),
                        SizedBox(width: 5),
                        Container(
                          width: 25,
                          height: 25,
                          color: !selected1[allPalyersList.indexOf(player)]
                              ? Colors.white
                              : Colors.green.shade900,
                          child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(30.0),
                                  border: new Border.all(
                                      width: 1.0, color: Colors.black54)),
                              child: Center(
                                  child: Text('C',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54)))),
                        ),
                        SizedBox(width: 20),
                        Container(
                            width: 25,
                            height: 25,
                            color: !selected2[allPalyersList.indexOf(player)]
                                ? Colors.white
                                : Colors.blue.shade900,
                            child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                    border: new Border.all(
                                        width: 1.0, color: Colors.black54)),
                                child: Center(
                                    child: Text('VC',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54)))))
                      ])),
                  SizedBox(height: 0.3),
                  Divider(height: 1, color: Colors.black12, thickness: 0.3)
                ]))
          ],
        ));
  }
}
