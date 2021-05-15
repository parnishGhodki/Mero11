import 'package:cricketfantasy/model/contests_response.dart';
import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import 'clipper/create_team.dart';

class ContestInfoScreen extends StatelessWidget {
  final Contests contests;
  final String userid;

  ContestInfoScreen({this.contests, this.userid});

  List<String> test = ["1"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 1, title: Text('Contest Info')),
        body: Column(children: <Widget>[
          Card(
              child: Container(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(children: <Widget>[
                        getPriceList(context, contests),
                        SizedBox(height: 10),
                        progressBar(),
                      ])))),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: test.length /*temp*/,
                  itemBuilder: (context, index) {
                    return Material(
                        child: StickyHeader(
                            header: Container(
                                padding: EdgeInsets.all(5),
                                color: HexColor('#F5F5F5'),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(children: <Widget>[
                                        InkWell(
                                            child: Column(children: <Widget>[
                                          //Text(contestsList.elementAt(index).title),
                                          SizedBox(height: 1),
                                          //Text(contestsList.elementAt(index).description,
                                          /*style: TextStyle(
                                                  color: Colors.black54)*/
                                        ]))
                                      ])
                                    ])),
                            content:
                                Column(children: getContestsSubList(test))));
                  }))
        ]));
  }

  List<Widget> getContestsSubList(List<String> test /*temp*/) {
    var widgetList = List<Widget>();

    //for (int i = 0; i < 10; i++) {
    /*temp*/

    //}

    return widgetList;
  }

  progressBar() {
    var totalTeam = int.tryParse('12');
    var remainingTeam = int.tryParse('0');
    var per = (((totalTeam - remainingTeam) * 100) / totalTeam);
    return Container(
        height: 10,
        child: LinearGradientProgressbarView(progressbarPoint: per));
  }

  getPriceList(BuildContext context, Contests contests) {
    var remainingTeam = int.tryParse('9') ?? 0;
    return Container(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Container(
                child: Text('Prize Pool',
                    style: TextStyle(color: Colors.blueAccent))),
            SizedBox(height: 4),
            contests.winingAmount != null
                ? Text(contests.winingAmount,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                : Text("NA",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
          ])),
      GestureDetector(
          onTap: () => {},
          child: Column(children: <Widget>[
            Text('Winners',
                style: TextStyle(color: Colors.yellowAccent.shade700)),
            SizedBox(height: 4),
            Text('1', style: TextStyle(color: Colors.blue))
          ])),
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
            Text('Entry',
                style: TextStyle(color: Colors.green),
                textAlign: TextAlign.end),
            SizedBox(height: 8),
            remainingTeam != 0
                ? Container(
                    height: 30,
                    width: 70,
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.green.withOpacity(0.1),
                              offset: Offset(0, 0))
                        ]),
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            borderRadius: new BorderRadius.circular(4.0),
                            onTap: remainingTeam != 0
                                ? () => inviteCodeDialog(context, '200', '200')
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
                    children: <Widget>[Text('00')])
          ]))
    ]));
  }

  winnerCount() {
    return InkWell(onTap: () {}, child: Container());
  }
}

void inviteCodeDialog(BuildContext context, String entryFee, String balance) {
  var cashBonus = '';
  var unutilizedBalanceWinning =
      '${(double.tryParse(balance) + double.tryParse(balance)).toStringAsFixed(2)}';

  if ((double.tryParse(entryFee) * 0.20) < double.tryParse(balance)) {
    cashBonus = '${double.tryParse(entryFee) * 0.20}';
  } else {
    cashBonus = '${double.tryParse(balance)}';
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
                                                  Navigator.pop(context);
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

class PrizePoolWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {}
}
