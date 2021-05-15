import 'package:cricketfantasy/model/contests_response.dart';
import 'package:cricketfantasy/model/transaction_response.dart';
import 'package:cricketfantasy/screen/page/tab.dart';
import 'package:cricketfantasy/services/Transactions.dart';
import 'package:cricketfantasy/services/contests.dart';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import '../clipper/create_team.dart';
import '../contestInfo.dart';

Wallet wallet = Wallet();

class ContestsWidget extends StatelessWidget {
  final Contests contests;
  final String userid;
  final String matchid;
  const ContestsWidget({Key key, this.contests, this.userid, this.matchid})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContestInfoScreen(
                              contests: contests,
                              userid: userid,
                            ))),
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(children: <Widget>[
                      getPriceList(context, userid, matchid),
                      SizedBox(height: 10),
                      progressBar(100, 50),
                    ])))));
  }

  progressBar(int totalTeam, int remainingTeam) {
    var per = (((totalTeam - remainingTeam) * 100) / totalTeam);
    return Container(
        height: 10,
        child: LinearGradientProgressbarView(
          progressbarPoint: per,
        ));
  }

  getPriceList(BuildContext context, String userid, String matchid) {
    var remainingTeam = 10;
    return Container(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Container(
                child:
                    Text('Prize Pool', style: TextStyle(color: Colors.grey))),
            SizedBox(height: 4),
            contests.entryFee != null
                ? Text(contests.winingAmount,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                : Text("NA",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(161, 14, 41, 1)))
          ])),
      GestureDetector(
          onTap: () => {},
          child: Column(children: <Widget>[
            Text('Winners', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 4),
            Text(contests.contestSize, style: TextStyle(color: Colors.blue))
          ])),
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
            Text('Entry',
                style: TextStyle(color: Colors.grey), textAlign: TextAlign.end),
            SizedBox(height: 8),
            remainingTeam != 0
                ? Container(
                    height: 30,
                    width: 70,
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(161, 14, 41, 1),
                              offset: Offset(0, 0))
                        ]),
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            borderRadius: new BorderRadius.circular(4.0),
                            onTap: remainingTeam != 0
                                ? () async {
                                    wallet = await Bank().getWallet(userid);
                                    inviteCodeDialog(
                                        context,
                                        contests.entryFee,
                                        wallet,
                                        matchid,
                                        userid,
                                        contests.contestCode);
                                  }
                                : null,
                            child: Center(
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                  contests.entryFee != null
                                      ? Text(contests.entryFee)
                                      : Text("NA")
                                ])))))
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[Text(contests.meParticipate)])
          ]))
    ]));
  }

  winnerCount() {
    return InkWell(onTap: () {}, child: Container());
  }
}

void inviteCodeDialog(BuildContext context, String entryFee, Wallet wallet,
    String matchid, String userid, String contestcode) {
  entryFee = "290";
  var balance = "200";
  var cashBonus = '100';
  var unutilizedBalanceWinning =
      '${(double.tryParse(balance) + double.tryParse(balance)).toStringAsFixed(2)}';

  if ((double.tryParse(entryFee) * 0.20) < double.tryParse(balance)) {
    //cashBonus = '${double.tryParse(entryFee) * 0.20}';
  } else {
    //cashBonus = '${double.tryParse(balance)}';
  }
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext buildContext) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Container(
                        color: Colors.white,
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: <
                                Widget>[
                          Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                          Text('CONFIRMATION',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)),
                                          Text(
                                              'Unutilized Balance + Winning = ₹$unutilizedBalanceWinning',
                                              style: TextStyle(
                                                  color: Colors.black54))
                                        ])),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(LineIcons.closedCaptioning,
                                            size: 20, color: Colors.green))
                                  ])),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 16.0, right: 16),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Entry',
                                        style: TextStyle(color: Colors.green)),
                                    Text('₹$entryFee')
                                  ])),
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 16.0, right: 16, bottom: 8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Usable Cash Bonus',
                                        style:
                                            TextStyle(color: Colors.black54)),
                                    Text('-₹$cashBonus')
                                  ])),
                          Divider(height: 1),
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 8, left: 16.0, right: 16, bottom: 8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('To Pay',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green)),
                                    Text(
                                        '₹${(double.tryParse(entryFee) - double.tryParse(cashBonus)).toStringAsFixed(2)}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green))
                                  ])),
                          Container(
                              margin: EdgeInsets.only(
                                  left: 16.0, right: 16, bottom: 8),
                              child: Text(
                                  "By joining this contest, you accept FansyApp's T&C.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black54))),
                          Container(
                              height: 45,
                              child: Row(children: <Widget>[
                                Flexible(
                                    child: Container(
                                        decoration: new BoxDecoration(
                                            color: Colors.blue),
                                        child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        4.0),
                                                onTap: () async {
                                                  //a function is called to check whther a team is present or not
                                                  //else////////////////////////////////////////////////////////////////////
                                                  //
                                                  //
                                                  /*Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyTeamScreen(
                                                                  matchid:
                                                                      matchid,
                                                                  userid:
                                                                      userid),
                                                          fullscreenDialog:
                                                              true));*/
                                                  EnterContest enterContest =
                                                      EnterContest();
                                                  bool value =
                                                      await enterContest
                                                          .joinContest(userid,
                                                              contestcode);
                                                  print(value);
                                                  final status =
                                                      Provider.of<User>(context,
                                                          listen: false);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              TabScreen(
                                                                user: status,
                                                                index: 1,
                                                              )));
                                                },
                                                child: Center(
                                                    child: Text('JOIN CONTEST',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .white)))))))
                              ]))
                        ])))));
      });
}

class LinearGradientProgressbarView extends StatelessWidget {
  final double progressbarPoint;

  const LinearGradientProgressbarView({Key key, this.progressbarPoint = 0.0})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        child:
            Stack(alignment: AlignmentDirectional.centerEnd, children: <Widget>[
      ClipPath(
          clipper: LinearGradientTeamClipper(lead: 6.0),
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                Colors.green.shade50,
                Colors.green.withOpacity(0.5)
              ])))),
      ClipPath(
          clipper: LinearGradientTeamClipper(lead: 6.0),
          child: Container(
              width: ((MediaQuery.of(context).size.width - 32) *
                  (100 - progressbarPoint) /
                  100),
              color: HexColor('#ECECEC')))
    ]));
  }
}
