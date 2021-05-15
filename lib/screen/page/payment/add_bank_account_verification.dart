import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cricketfantasy/util/extensions.dart';

class AddBankAccountVerificationScreen extends StatefulWidget {
  @override
  createState() => _AddBankAccountVerificationState();
}

class _AddBankAccountVerificationState extends State<AddBankAccountVerificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var _bankAccountNoController = new TextEditingController();
  var _accountNameController = new TextEditingController();
  var _bankNameController = new TextEditingController();
  var _IFSCCodeController = new TextEditingController();
  var _addressController = new TextEditingController();

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
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Bank passbook/cheque photo',
                            style: TextStyle(fontSize: 15))
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
                                Text('Upload account proof',
                                    style: TextStyle(color: Colors.white))
                              ])))),
              Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  child: widget.inputField(_bankAccountNoController,
                      labelText: 'Bank account no', keyboardType: TextInputType.text)),
              Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  child: widget.inputField(_accountNameController,
                      labelText: 'Account name', keyboardType: TextInputType.text)),
              Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  child: widget.inputField(_bankNameController,
                      labelText: 'Bank name', keyboardType: TextInputType.text)),
              Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  child: widget.inputField(_IFSCCodeController,
                      labelText: 'IFSC code', keyboardType: TextInputType.text)),
              Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  child: widget.inputField(_addressController,
                      labelText: 'Address', keyboardType: TextInputType.text)),
              SizedBox(height: 10),
              _panCardVerificationPress()
            ])));
  }

  _panCardVerificationPress() =>
      Align(alignment: Alignment.bottomCenter).customFloatForm(
          icon: Icons.navigate_next, isMini: false, qrCallback: () {});
}