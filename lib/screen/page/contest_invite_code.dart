import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:flutter/material.dart';
import 'package:cricketfantasy/util/extensions.dart';
import 'package:line_icons/line_icons.dart';

class ContestInviteCodeScreen extends StatefulWidget {
  final Data1 match;
  final String userid;

  ContestInviteCodeScreen({this.match, this.userid});

  @override
  createState() => _ContestInviteCodeState();
}

class _ContestInviteCodeState extends State<ContestInviteCodeScreen> {
  var _inviteCodeController = new TextEditingController();

  var inviteCode = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 1, title: Text('Invite Code')),
        key: _scaffoldKey,
        body: Column(children: <Widget>[
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                  'If you have a contest invite code, enter it and join.')),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: widget.inputField(_inviteCodeController,
                  labelText: 'Invite code',
                  keyboardType: TextInputType.emailAddress)),
          SizedBox(height: 10),
          _inviteCodePress()
        ]));
  }

  _inviteCodePress() =>
      Align(alignment: Alignment.bottomCenter).customFloatForm(
          icon: Icons.navigate_next,
          isMini: false,
          qrCallback: () {
            inviteCodeDialog('200', '200');
          });

  void inviteCodeDialog(String entryFee, String balance) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          child: Icon(
                                              LineIcons.closedCaptioning,
                                              size: 20,
                                              color: Colors.red))
                                    ])),
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 16.0, right: 16),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Entry',
                                          style:
                                              TextStyle(color: Colors.black54)),
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
                                              color: Colors.blue.shade900),
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
                                                      child: Text(
                                                          'JOIN CONTEST',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .white)))))))
                                ]))
                          ])))));
        });
  }
}
