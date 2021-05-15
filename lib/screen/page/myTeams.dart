import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/screen/page/create_team.dart';
import 'package:cricketfantasy/screen/widget/teamWidget.dart';
import 'package:cricketfantasy/services/joinContest.dart';
import 'package:flutter/material.dart';

/*class MyTeamScreen extends StatelessWidget {
  final Data1 match;
  final String userid;

  MyTeamScreen({this.match, this.userid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 1, title: Text('My Teams')),
        body: ListView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return TeamWidget();
            }));
  }
}*/

class MyTeamScreen extends StatefulWidget {
  final String matchid;
  final String userid;

  MyTeamScreen({this.matchid, this.userid});
  @override
  createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeamScreen> {
  @override
  Future<void> initState() {
    super.initState();
    getUserTeam(widget.userid, widget.matchid).then((response) {
      setState(() {
        print(response);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 1, title: Text('My Teams')),
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
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: new BorderRadius.circular(4.0),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateTeamScreen(
                                        matchid: widget.matchid,
                                        userid: widget.userid,
                                      ),
                                  fullscreenDialog: true));
                        },
                        child: Center(child: Text('Create Team')))))),
        body: ListView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return TeamWidget();
            }));
  }
}

getUserTeam(String userid, String matchid) async {
  JoinContest joinContest = JoinContest();
  await joinContest.getUserTeam(userid, matchid);
}
