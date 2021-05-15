import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';

class TeamWidget extends StatefulWidget {
  @override
  createState() => _TeamWidgetState();
}

class _TeamWidgetState extends State<TeamWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            onTap: () => Navigator.pushNamed(
                context, routeTeamPreview), //contest screen called
            child: Column(children: <Widget>[
              Text("Created Teams"),
            ])));
  }
}
