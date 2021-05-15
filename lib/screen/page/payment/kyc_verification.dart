import 'package:flutter/material.dart';

import 'add_bank_account_verification.dart';
import 'email_verification.dart';
import 'pancard_verification.dart';

class KYCVerificationScreen extends StatefulWidget {
  @override
  createState() => _KYCVerificationState();
}

class _KYCVerificationState extends State<KYCVerificationScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;
  var isProsses = false;

  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(elevation: 1, title: Text('Account verification')),
        body: Column(children: <Widget>[
      Container(
          height: 40,
          color: Colors.white,
          child: new TabBar(
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              tabs: [
                Tab(text: 'Phone/Email'),
                Tab(text: 'Pancard'),
                Tab(text: 'Back Acount')
              ],
              controller: controller)),
      Divider(height: 1),
      Expanded(
          child: TabBarView(
              controller: controller,
              children: <Widget>[EmailVerificationScreen(), PanCardVerificationScreen(), AddBankAccountVerificationScreen()]))
    ]));
  }
}
