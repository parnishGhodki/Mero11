import 'package:cricketfantasy/util/vars.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

class SliderWidget extends StatefulWidget {
  @override
  createState() => _SliderState();
}

class _SliderState extends State<SliderWidget> {
  var pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
          child: PageIndicatorContainer(
              indicatorColor: colorIndicator,
              indicatorSelectorColor: colorSelectorIndicator,
              length: 3,
              align: IndicatorAlign.bottom,
              child: PageView(
                  controller: pageController,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    SliderImageWidget(
                      image: 'assets/images/slider_1.png',
                      title: 'Select A Match',
                      description:
                          'Select any of the upcoming matches from any of the current or upcoming cricket series',
                    ),
                    SliderImageWidget(
                      image: 'assets/images/slider_2.png',
                      title: 'Join A Contest',
                      description:
                          'join any free or cash contest to win cash and the ultimate bragging rights to showoff your improvement in the free/Skill\ncontests on Fixturers!',
                    ),
                    SliderImageWidget(
                      image: 'assets/images/slider_3.png',
                      title: 'Create Your Team',
                      description:
                          'Use your sports knowledge and showcase your skills to create your team within a budget of 100 credits',
                    )
                  ])))
    ]);
  }
}

class SliderImageWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const SliderImageWidget(
      {Key key, this.image, this.title = '', this.description = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
          child: Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Image.asset(image))),
      Container(
          padding: EdgeInsets.only(top: 8),
          child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))),
      Container(
          padding: EdgeInsets.all(30),
          child: Text(description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black)))
    ]);
  }
}
