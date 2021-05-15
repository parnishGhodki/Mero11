import 'package:cricketfantasy/screen/page/contests.dart';
import 'package:cricketfantasy/screen/page/create_team.dart';
import 'package:cricketfantasy/screen/page/home.dart';
import 'package:cricketfantasy/screen/page/login.dart';
import 'package:cricketfantasy/screen/page/mobile.dart';
import 'package:cricketfantasy/screen/page/my_profile.dart';
import 'package:cricketfantasy/screen/page/otp.dart';
import 'package:cricketfantasy/screen/page/signup.dart';
import 'package:cricketfantasy/screen/page/splashscreen.dart';
import 'package:cricketfantasy/screen/page/tab.dart';
import 'package:cricketfantasy/screen/page/team_preview.dart';
import 'package:cricketfantasy/screen/page/transaction_history.dart';
import 'package:cricketfantasy/screen/wrapper.dart';
import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case routeLogin:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case routeMobile:
        return MaterialPageRoute(builder: (_) => MobileScreen());
      //case routeOTP:
      //return MaterialPageRoute(builder: (_) => OTPScreen());
      case routeSignUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case routeTab:
        return MaterialPageRoute(builder: (_) => TabScreen());
      case routeContests:
        return MaterialPageRoute(builder: (_) => ContestsScreen());
      case routeCreateTeam:
        return MaterialPageRoute(builder: (_) => CreateTeamScreen());
      case routeTeamPreview:
        return MaterialPageRoute(builder: (_) => TeamPreviewScreen());
      case routeMyProfile:
        return MaterialPageRoute(builder: (_) => MyProfileScreen());
      case routeTransactionHistory:
        return MaterialPageRoute(builder: (_) => TransactionHistoryScreen());

      default:
        return null;
    }
  }
}
