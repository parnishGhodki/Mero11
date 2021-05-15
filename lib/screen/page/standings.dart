import 'package:cricketfantasy/screen/page/standigs/live.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'standigs/fixtures.dart';
import 'standigs/results.dart';
import 'package:cricketfantasy/util/extensions.dart';

class StandingsScreen extends StatefulWidget {
  final void Function() menuCallBack;
  final User user;

  const StandingsScreen({Key key, this.menuCallBack, this.user})
      : super(key: key);
  @override
  createState() => _StandingsState();
}

class _StandingsState extends State<StandingsScreen>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = new ScrollController();
  TabController controller;
  double _appBarHeight = 100.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            physics: BouncingScrollPhysics(),
            controller: _scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                widget.sliverAppBar(
                    _appBarBehavior,
                    [/*widget.drawerIcon(widget.menuCallBack)*/],
                    widget.flexibleSpaceBar('Standings')),
                SliverPersistentHeader(
                    pinned: true, delegate: PersistentHeader(controller))
              ];
            },
            body: TabBarView(controller: controller, children: <Widget>[
              FixturesScreen(),
              LiveScreen(),
              ResultsScreen()
            ])));
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final TabController controller;

  PersistentHeader(
    this.controller,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(children: <Widget>[
      Container(
          color: Colors.white,
          height: 40,
          child: TabBar(
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'Fixtures'),
              Tab(text: 'Live'),
              Tab(text: 'Results')
            ],
            controller: controller,
          )),
      Divider(height: 1)
    ]);
  }

  @override
  double get maxExtent => 41.0;

  @override
  double get minExtent => 41.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
