import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../widget/team_play.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Icon(LineIcons.trophy, size: 120),
      Text("You haven't joined any contests that are live"),
      SizedBox(height: 2),
      Text('Join contests for any of the upcoming matches',
          style: TextStyle(color: Colors.black54)),
      ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Text("");
            /*TeamPlayWidget(
                matchStatus: 'Match status',
                seriesName: 'Series name',
                teamNameA: 'Team A',
                teamNameB: 'Team B',
                countryImageA: profileImage,
                countryImageB: profileImage,
                contestJoinShow: true,
                noOfContests: 1);*/
          })
    ]));
  }
}
