import 'package:cricketfantasy/screen/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import './util/route.dart' as route;
import './util/vars.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cricketfantasy/services/authenticate.dart';

void main() async {
  final Color red = Colors.red.shade900;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

  const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark);
  SystemChrome.setSystemUIOverlayStyle(dark);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
      title: appName,
      theme: ThemeData(
          brightness: Brightness.light,
          accentColor: Color.fromRGBO(161, 14, 41, 1),
          primaryColor: Color.fromRGBO(161, 14, 41, 1),
          primarySwatch: Colors.grey,
          fontFamily: quickFont),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: Wrapper(),
      initialRoute: '/',
      onGenerateRoute: route.Router.generateRoute);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: Authentication().user, initialData: null, child: materialApp);
  }
}
