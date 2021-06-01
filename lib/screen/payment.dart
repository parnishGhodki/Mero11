import 'package:cricketfantasy/model/schedule/cricket_schedule_response.dart';
import 'package:cricketfantasy/screen/page/create_team.dart';
import 'package:cricketfantasy/screen/widget/teamWidget.dart';
import 'package:cricketfantasy/services/joinContest.dart';
import 'package:cricketfantasy/services/payment.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  createState() => _PaymentState();
}

class _PaymentState extends State<PaymentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Future<void> initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 1, title: Text('Payment')),
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
                          Payment payment = Payment();
                          payment.initiatePayment('', '', '');

                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateTeamScreen(
                                        matchid: widget.matchid,
                                        userid: widget.userid,
                                      ),
                                  fullscreenDialog: true));*/
                        },
                        child: Center(child: Text('Create Team')))))),
        body:
            /*Container(
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
                        Payment payment = Payment();
                        payment.initiatePayment('', '', '');
                      },
                    ))))*/
            Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (String value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.

                    if (_formKey.currentState.validate()) {}
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}
