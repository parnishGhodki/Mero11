import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:flutter/material.dart';
import 'package:cricketfantasy/util/extensions.dart';

class EmailVerificationScreen extends StatefulWidget {
  @override
  createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var _mobileController = new TextEditingController();
  var _emailController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(color: HexColor('#F5F5F5'),
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Your email and mobile are verified', style: TextStyle(fontSize: 15, color: Colors.green))
                      ])),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: widget.inputField(_mobileController,
                  labelText: 'Mobile', keyboardType: TextInputType.number)),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: widget.inputField(_emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress)),
          SizedBox(height: 10),
          _emailVerificationPress()
        ])));
  }

  _emailVerificationPress() =>
      Align(alignment: Alignment.bottomCenter).customFloatForm(
          icon: Icons.navigate_next, isMini: false, qrCallback: () {});
}
