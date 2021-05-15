import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:flutter/material.dart';
import 'package:cricketfantasy/util/extensions.dart';

class PanCardVerificationScreen extends StatefulWidget {
  @override
  createState() => _PanCardVerificationState();
}

class _PanCardVerificationState extends State<PanCardVerificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var _panCardNoController = new TextEditingController();
  var _panCardNameController = new TextEditingController();

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
          Container(
              color: HexColor('#F5F5F5'),
              padding: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Your pancard verification has been approved',
                        style: TextStyle(fontSize: 15, color: Colors.green))
                  ])),
          Container(
              margin: EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 8),
              child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.circular(4.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(0, 0.5),
                            blurRadius: 0.0)
                      ]),
                  child: InkWell(
                      onTap: () {},
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.attach_file, color: Colors.white),
                            Text('Upload pancard proof',
                                style: TextStyle(color: Colors.white))
                          ])))),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: widget.inputField(_panCardNoController,
                  labelText: 'Pancard no.', keyboardType: TextInputType.text)),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: widget.inputField(_panCardNameController,
                  labelText: 'Pancard name', keyboardType: TextInputType.text)),
          SizedBox(height: 10),
          _panCardVerificationPress()
        ])));
  }

  _panCardVerificationPress() =>
      Align(alignment: Alignment.bottomCenter).customFloatForm(
          icon: Icons.navigate_next, isMini: false, qrCallback: () {});
}
