import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 1,
      ),
      // backgroundColor: Colors.redAccent,
      body: Container(
        // alignment: Alignment.center,
        child: Column(
          // alignment: Alignment.center,
          children: <Widget>[
            _getCard(),
          ],
        ),
      ),
    );
  }

  Column _getCard() {
    return Column(
      children: [
        Container(
          width: 400,
          // height: 200,
          margin: EdgeInsets.all(40.0),
          decoration: BoxDecoration(
            color: Colors.green,
            // borderRadius: BorderRadius.circular(12.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              Text("PARNISH HOTSHOT"),
              Divider(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("POINTS"),
                      Text("632.0"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _getAvatar(),
                      _getAvatar(),
                    ],
                  ),
                ],
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(12.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("WK "),
                        Text(" 2"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("WK "),
                        Text(" 2"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("WK "),
                        Text(" 2"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("WK "),
                        Text(" 2"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      margin: new EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
        border: Border.all(
          // color: Colors.redAccent,
          width: 1.5,
        ),
        image: DecorationImage(
          image: NetworkImage("https://picsum.photos/100/100"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
