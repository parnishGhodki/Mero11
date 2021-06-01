import 'package:cricketfantasy/screen/page/login.dart';
import 'package:cricketfantasy/screen/page/playerprofile.dart';
import 'package:cricketfantasy/screen/page/tab.dart';
import 'package:cricketfantasy/screen/payment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final status = Provider.of<User>(context);
    print(status.toString());

    // return either the Home or Authenticate widget
    if (status == null) {
      return LoginScreen();
    } else {
      return TabScreen(
        user: status,
        index: 0,
      );
    }
  }
}
