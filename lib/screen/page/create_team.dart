import 'package:cricketfantasy/model/player_list.dart';
import 'package:cricketfantasy/screen/page/playerprofile.dart';
import 'package:cricketfantasy/screen/widget/create_team_progress_bar.dart';
import 'package:cricketfantasy/services/createTeam.dart';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:selectable_container/selectable_container.dart';

import 'choose_c_vc.dart';

List<bool> selected = List<bool>();

List<Data> playerList = List<Data>();
List<Data> batsmenList = List<Data>();
List<Data> wicketKeeperList = List<Data>();
List<Data> allRounderList = List<Data>();
List<Data> bowlerList = List<Data>();
List<Data> userbatsmenTeam = List<Data>();
List<Data> userwicketkeeperTeam = List<Data>();
List<Data> userbolwerTeam = List<Data>();
List<Data> userallRounderTeam = List<Data>();
int teamcount = 0;
int credits = 100;

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({Key key, this.matchid, this.userid})
      : super(key: key);
  final String matchid;
  final String userid;
  @override
  _CreateTeamScreenState createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();

    playerList.clear();
    batsmenList.clear();
    wicketKeeperList.clear();
    bowlerList.clear();
    allRounderList.clear();
    userallRounderTeam.clear();
    userbatsmenTeam.clear();
    userbolwerTeam.clear();
    userbatsmenTeam.clear();

    getPlayerList().then((response) {
      setState(() {
        playerList = response;
        print(playerList);
        setpSelection(playerList.length);
      });
    });
  }

  getPlayerList() async {
    GetPalyersList getPalyersList = GetPalyersList();
    List<Data> demo =
        await getPalyersList.getpalyersList(widget.matchid, widget.userid);
    if (demo != null) CreateChildList(demo);
    return demo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 1, title: Text('Create Team')),
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
                          if (teamcount == 11)
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChooseCVCScreen(
                                          batsmenList: userbatsmenTeam,
                                          bowlerList: userbolwerTeam,
                                          allRounderList: userallRounderTeam,
                                          wicketKeeperList:
                                              userwicketkeeperTeam,
                                          matchid: widget.matchid,
                                          userid: widget.userid,
                                        ),
                                    fullscreenDialog: true));
                        },
                        child: Center(
                            child: Text('Choose Captain and Vice-Captain')))))),
        body: Stack(alignment: AlignmentDirectional.bottomCenter, children: <
            Widget>[
          Column(children: <Widget>[
            Card(
                color: Color.fromRGBO(161, 14, 41, 1),
                elevation: 0.5,
                margin: EdgeInsets.all(0),
                child: Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(4),
                      child: Column(children: <Widget>[
                        Text('Max 7 players from a team',
                            style: TextStyle(color: Colors.black54)),
                        SizedBox(height: 5),
                        Text('30-4-2020',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ])),
                  Container(
                      padding: EdgeInsets.all(4),
                      child: Row(children: <Widget>[
                        Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  child: Text('Players',
                                      style: TextStyle(color: Colors.black54))),
                              Row(children: <Widget>[
                                Text(teamcount.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    )),
                                Text(' / 11',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ))
                              ])
                            ]),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('IND',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                            SizedBox(width: 5),
                            Container(
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.1),
                                    backgroundImage:
                                        ExactAssetImage(profileImage))),
                            Container(
                                margin: EdgeInsets.only(left: 3, right: 3),
                                child: Text('vs',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black))),
                            Container(
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.1),
                                    backgroundImage:
                                        ExactAssetImage(profileImage))),
                            SizedBox(width: 5),
                            Text('SA',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black))
                          ],
                        )),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('Credits',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  )),
                              Text(credits.toString(),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black))
                            ])
                      ])),
                  /*GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseCVCScreen(),
                                fullscreenDialog: true));
                      },
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text('Choose caption and vice captian',
                              style: TextStyle(color: Colors.blue))))*/
                  Container(
                      height: 40,
                      width: double.infinity,
                      padding: EdgeInsets.all(7),
                      child: CreateTeamProgressBarWidget(teamCount: teamcount))
                ])),
            Container(
                height: 40,
                child: TabBar(
                  unselectedLabelColor: Colors.black54,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: 'WK'),
                    Tab(text: 'BAT'),
                    Tab(text: 'AR'),
                    Tab(text: 'BOWL')
                  ],
                  controller: tabController,
                )),
            Flexible(
                child: TabBarView(
                    physics: BouncingScrollPhysics(
                      parent: PageScrollPhysics(),
                    ),
                    controller: tabController,
                    children: <Widget>[
                  wicketKeeperList != null
                      ? CreateList('Pick 1 Wicket - Keeper', wicketKeeperList)
                      : Text("    "),
                  batsmenList != null
                      ? CreateList('Pick 3 - 5 Batsmens', batsmenList)
                      : Text("    "),
                  allRounderList != null
                      ? CreateList('Pick 1 - 3 All Rounders', allRounderList)
                      : Text("    "),
                  bowlerList != null
                      ? CreateList('Pick 3 - 5 Bowlers', bowlerList)
                      : Text("    "),
                  /*CreateTeamSelectionWidget(
                    title: 'Pick 1 Wicket - Keeper',
                    playerlist: wicketKeeperList,
                  )
                  ,
                  CreateTeamSelectionWidget(
                      title: 'Pick 3 - 5 Batsmens', playerlist: batsmenList),
                  CreateTeamSelectionWidget(
                      title: 'Pick 1 - 3 All Rounders',
                      playerlist: allRounderList),
                  CreateTeamSelectionWidget(
                      title: 'Pick 3 - 5 Bowlers', playerlist: bowlerList)*/
                ]))
          ])
        ]));
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Widget CreateList(String title, List<Data> childplayerList) {
    return Column(children: <Widget>[
      Container(
          width: double.infinity,
          height: 40,
          color: HexColor('#F5F5F5'),
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 3, right: 3),
          child: Center(
              child: Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)))),
      Column(children: <Widget>[
        Container(
            padding: EdgeInsets.all(10),
            child: Row(children: <Widget>[
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('PLAYERS', style: TextStyle(fontSize: 12)),
                          ]))),
              Container(
                  width: 70,
                  child: Center(
                      child: Text('POINTS',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54)))),
              SizedBox(width: 5),
              Container(
                  width: 70,
                  child: Center(
                      child: Row(children: <Widget>[
                    Text('CREDIT',
                        style: TextStyle(fontSize: 12, color: Colors.black54)),
                    Icon(LineIcons.arrowDown, size: 20)
                  ]))),
              Container(width: 40)
            ])),
        Divider(height: 1)
      ]),
      Flexible(
          child:
              /*ListView(
              shrinkWrap: true,
              children: childplayerList.isNotEmpty
                  ? getPlayerSubList(childplayerList)
                  : <Widget>[Text("Loading")]))*/
              ListView.builder(
                  itemCount: childplayerList.length,
                  itemBuilder: (context, index) {
                    return playerCard(childplayerList[index]);
                  }))
    ]);
  }

  Widget playerCard(Data player) {
    bool value = false;
    return SelectableContainer(
        selected: value,
        onValueChanged: (newValue) {
          setState(() {
            value = newValue;
            if (teamcount < 11) {
              if (!selected[playerList.indexOf(player)]) {
                teamcount = teamcount + 1;
                //credits = credits - credit;
                if (player.role == "bat") {
                  userbatsmenTeam.add(player);
                } else if (player.role == "bowl") {
                  userbolwerTeam.add(player);
                } else if (player.role == "wk") {
                  userwicketkeeperTeam.add(player);
                } else {
                  userallRounderTeam.add(player);
                }
              } else {
                teamcount = teamcount - 1;
                //credits = credits - credit;
                if (player.role == "bat") {
                  userbatsmenTeam.remove(player);
                } else if (player.role == "bowl") {
                  userbolwerTeam.remove(player);
                } else if (player.role == "wk") {
                  userwicketkeeperTeam.remove(player);
                } else {
                  userallRounderTeam.remove(player);
                }
              }
              selected[playerList.indexOf(player)] =
                  !selected[playerList.indexOf(player)];
            } else if (teamcount == 11) {
              if (selected[playerList.indexOf(player)]) {
                teamcount = teamcount - 1;
                //credits = credits - credit;
                if (player.role == "bat") {
                  userbatsmenTeam.remove(player);
                } else if (player.role == "bowl") {
                  userbolwerTeam.remove(player);
                } else if (player.role == "wk") {
                  userwicketkeeperTeam.remove(player);
                } else {
                  userallRounderTeam.remove(player);
                }
                selected[playerList.indexOf(player)] =
                    !selected[playerList.indexOf(player)];
              }
            }
          });
        },
        padding: 0,
        child: Column(children: <Widget>[
          Container(
              color: !selected[playerList.indexOf(player)]
                  ? HexColor('#F5F5F5')
                  : Colors.green,
              padding: EdgeInsets.all(5),
              child: Row(children: <Widget>[
                Container(
                    child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayerProfileScreen(),
                                fullscreenDialog: true)),
                        child: Container(
                            width: 45,
                            height: 45,
                            child: CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(0.1),
                                backgroundImage:
                                    ExactAssetImage(profileImage))))),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(player.name, ///////////////player name
                                  style: TextStyle(fontSize: 14)),
                              Container(
                                  padding: EdgeInsets.only(top: 1),
                                  child: Text('', ////////////fixture
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54)))
                            ]))),
                Container(
                    width: 70,
                    child: Center(
                        child: Text(player.points.toString(),
                            style: TextStyle(
                                fontSize: 15, color: Colors.black54)))),
                SizedBox(width: 5),
                Container(
                    width: 70,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(player.credit.toString(),
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black54)),
                          SizedBox(width: 20)
                        ])),
                /*Center(
                    child: Container(
                  width: 40,
                  child: /*Icon(LineIcons.closedCaptioning, size: 20)*/
                      Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: _selected,
                    onChanged: (bool value) {
                      setState(() {
                        _selected = value;
                      });
                    },
                  ),
                ))*/
              ])),
          SizedBox(height: 0.3),
          Divider(height: 1, color: Colors.black12, thickness: 0.3)
        ]));
  }

  List<Widget> getPlayerSubList(List<Data> player1list) {
    var widgetList = List<Widget>();

    for (int i = 0; i < player1list.length; i++) {
      widgetList.add(playerCard(player1list.elementAt(i)));
    }

    return widgetList;
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}

void setpSelection(int length) {
  for (int i = 0; i < length; i++) {
    selected.add(false);
  }
}

void CreateChildList(List<Data> demo) {
  int i = 0;
  for (i = 0; i < demo.length; i++) {
    if (demo.elementAt(i).role == "bat") {
      batsmenList.add(demo.elementAt(i));
    } else if (demo.elementAt(i).role == "bowl") {
      bowlerList.add(demo.elementAt(i));
    } else if (demo.elementAt(i).role == "wk") {
      wicketKeeperList.add(demo.elementAt(i));
    } else {
      allRounderList.add(demo.elementAt(i));
    }
  }
}
