import 'package:flutter/material.dart';
import 'package:cricketfantasy/util/extensions.dart';

class WithDrawScreen extends StatefulWidget {
  @override
  createState() => _WithDrawState();
}

class _WithDrawState extends State<WithDrawScreen> {
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
        appBar: AppBar(elevation: 1, title: Text('withdraw')),
        key: _scaffoldKey,
        body: Column(children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Your winnings'),
                    Text('Rs. 0', style: TextStyle(color: Colors.green))
                  ])),
          Divider(),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: widget.inputField(_inviteCodeController,
                  labelText: 'Rs. withdraw',
                  keyboardType: TextInputType.emailAddress)),
          Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 2),
              child: Text('min Rs. 200 and max Rs. 10, 000 allowed per day',
                  style: TextStyle(color: Colors.black54))),
          SizedBox(height: 10),
          _withDrawPress()
        ]));
  }

  _withDrawPress() =>
      Align(alignment: Alignment.bottomCenter).customFloatForm(
          icon: Icons.navigate_next,
          isMini: false,
          qrCallback: () {
          });
}
