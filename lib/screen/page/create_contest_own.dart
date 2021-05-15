import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/screen/page/contests.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cricketfantasy/util/extensions.dart';
import 'package:cricketfantasy/services/contests.dart';

class CreateContestOwnScreen extends StatefulWidget {
  final Data1 match;
  final String userid;
  const CreateContestOwnScreen({Key key, this.match, this.userid})
      : super(key: key);
  @override
  createState() => _CreateContestOwnState();
}

class _CreateContestOwnState extends State<CreateContestOwnScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _contestNameController = new TextEditingController();
  var _totalWinningAmountController = new TextEditingController();
  var _contestSizeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 1, title: Text('Make your own Contest')),
        key: _scaffoldKey,
        body: contestsData());
  }

  Widget contestsData() {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      SizedBox(height: 10),
      Text('Entry per team',
          style: TextStyle(color: Colors.blue, fontSize: 18)),
      SizedBox(height: 1),
      Text('Entry is calculated based on total prize amount & contest size',
          textAlign: TextAlign.center, style: TextStyle(color: Colors.black54)),
      SizedBox(height: 30),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: widget.inputField(_contestNameController,
                labelText: 'Give your contest name',
                keyboardType: TextInputType.emailAddress)),
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: widget.inputField(_totalWinningAmountController,
                labelText: 'Entry Fee (Rs.)',
                keyboardType: TextInputType.emailAddress)),
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Text('Min 0')),
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: widget.inputField(_contestSizeController,
                labelText: 'Contest size',
                keyboardType: TextInputType.emailAddress)),
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Text('Min 2')),
      ]),
      SizedBox(height: 10),
      Column(children: <Widget>[_createOwnContestPress()])
    ]));
  }

  _createOwnContestPress() =>
      Align(alignment: Alignment.bottomCenter).customFloatForm(
          icon: Icons.navigate_next,
          isMini: false,
          qrCallback: () async {
            CreateContest createContest = CreateContest();
            bool result = await createContest.createContest(
                widget.userid,
                widget.match.matchId,
                _contestNameController.text,
                _totalWinningAmountController.text,
                _contestSizeController.text);
            if (result == true) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContestsScreen(
                        match: widget.match, userid: "2" /*widget.userid*/),
                  ));
            } else {
              print("TRY AGAIN");
            }
          });
}
