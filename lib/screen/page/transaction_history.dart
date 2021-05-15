import 'package:cricketfantasy/model/transaction_response.dart';
import 'package:cricketfantasy/util/hexacolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class TransactionHistoryScreen extends StatefulWidget {
  @override
  createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistoryScreen> {
  var transactionResponse = List<TransactionResponse>();

  var transactionSectionList = List<TransactionSection>();
  bool isPopupOpen = false;
  var toDate = DateFormat('dd/MM/yyyy')
      .parse(DateFormat('dd/MM/yyyy').format(DateTime.now()));
  var fromDate = DateFormat('dd/MM/yyyy').parse(DateFormat('dd/MM/yyyy')
      .format(DateTime.now().subtract(Duration(days: 30))));
  var nowDate = DateFormat('dd/MM/yyyy')
      .parse(DateFormat('dd/MM/yyyy').format(DateTime.now()));
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    print(nowDate);
    getData();
    super.initState();
  }

  void getData() async {
    transactionResponse.add(TransactionResponse(
        transactionId: 'EX82331',
        type: 'RECEIVE',
        remark: 'Withdraw Cash',
        amount: '200',
        teamName: 'Ashwin',
        statusProcess: '1',
        statusCredit: '1',
        time: '20/12/1990,04:06:00 AM'));

    transactionResponse.forEach((data) {
      if (isMach(DateFormat('dd/MM/yyyy')
          .parse(data.time.split(',')[0])
          .millisecondsSinceEpoch
          .toString())) {
        transactionSectionList.forEach((tdate) {
          if (tdate.date ==
              DateFormat('dd/MM/yyyy')
                  .parse(data.time.split(',')[0])
                  .millisecondsSinceEpoch
                  .toString()) {
            tdate.transactionList.add(data);
          }
        });
      } else {
        var newList = TransactionSection();
        newList.date = DateFormat('dd/MM/yyyy')
            .parse(data.time.split(',')[0])
            .millisecondsSinceEpoch
            .toString();
        newList.transactionList = [data];
        transactionSectionList.add(newList);
      }
    });
    transactionSectionList
        .sort((a, b) => int.tryParse(b.date).compareTo(int.tryParse(a.date)));
  }

  bool isMach(String time) {
    bool isMach = false;
    transactionSectionList.forEach((tData) {
      if (tData.date == time) {
        isMach = true;
        return;
      }
    });
    return isMach;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
          appBar: AppBar(elevation: 1, title: Text('Transaction History')),
          key: _scaffoldKey,
          body: transaction()),
      isPopupOpen
          ? Container(
              child: Scaffold(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  body: SingleChildScrollView(
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                              child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Container(
                                      decoration: new BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              new BorderRadius.circular(4.0),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                offset: Offset(0, 1),
                                                blurRadius: 5.0)
                                          ]),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                                padding: EdgeInsets.all(16),
                                                child: Row(children: <Widget>[
                                                  Expanded(
                                                      child: Container(
                                                          child: Text(
                                                              'Selecte Date',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                  fontSize:
                                                                      18)))),
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          isPopupOpen = false;
                                                        });
                                                      },
                                                      child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          child: Icon(
                                                              LineIcons
                                                                  .closedCaptioning,
                                                              size: 20)))
                                                ])),
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: InkWell(
                                                    onTap: () {
                                                      showCupertinoModalPopup<
                                                              void>(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return _buildBottomPicker(
                                                                CupertinoDatePicker(
                                                                    mode: CupertinoDatePickerMode
                                                                        .date,
                                                                    initialDateTime:
                                                                        fromDate,
                                                                    onDateTimeChanged:
                                                                        (DateTime
                                                                            newDateTime) {
                                                                      setState(() =>
                                                                          fromDate =
                                                                              newDateTime);
                                                                    }));
                                                          });
                                                    },
                                                    child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                              child: Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              16,
                                                                          right:
                                                                              16),
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                        Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(top: 12),
                                                                            child: Text('From',
                                                                                style: TextStyle(
                                                                                  color: HexColor('#8C8C8C'),
                                                                                ))),
                                                                        Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 4),
                                                                            child: Text(DateFormat.yMMMMd().format(fromDate),
                                                                                style: TextStyle(
                                                                                  color: nowDate.difference(fromDate).inDays >= 0 && fromDate.difference(toDate).inDays <= 0 && toDate != fromDate ? Colors.black : Colors.black,
                                                                                ))),
                                                                        Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 12),
                                                                            child: Container(height: 1.2, color: HexColor('#8C8C8C')))
                                                                      ])))
                                                        ]))),
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: InkWell(
                                                    onTap: () {
                                                      showCupertinoModalPopup<
                                                              void>(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return _buildBottomPicker(
                                                                CupertinoDatePicker(
                                                                    mode: CupertinoDatePickerMode
                                                                        .date,
                                                                    initialDateTime:
                                                                        toDate,
                                                                    onDateTimeChanged:
                                                                        (DateTime
                                                                            newDateTime) {
                                                                      setState(() =>
                                                                          toDate =
                                                                              newDateTime);
                                                                    }));
                                                          });
                                                    },
                                                    child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                              child: Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              16,
                                                                          right:
                                                                              16),
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                        Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(top: 12),
                                                                            child: Text('To', style: TextStyle(color: HexColor('#8C8C8C')))),
                                                                        Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 4),
                                                                            child: Text(DateFormat.yMMMMd().format(toDate), style: TextStyle(color: nowDate.difference(toDate).inDays >= 0 && toDate.difference(fromDate).inDays >= 0 && toDate != fromDate ? Colors.black : Colors.black))),
                                                                        Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 12),
                                                                            child: Container(height: 1.2, color: HexColor('#8C8C8C')))
                                                                      ])))
                                                        ]))),
                                            SizedBox(height: 8),
                                            Container(
                                                width: double.infinity,
                                                child: Container(
                                                    height: 70,
                                                    padding: EdgeInsets.only(
                                                        left: 30,
                                                        right: 30,
                                                        bottom: 20,
                                                        top: 10),
                                                    child: Opacity(
                                                        opacity: fromDate.compareTo(
                                                                        toDate) >
                                                                    0 ||
                                                                toDate ==
                                                                    fromDate
                                                            ? 0.2
                                                            : 1.0,
                                                        child: Container(
                                                            decoration: new BoxDecoration(
                                                                color: HexColor(
                                                                    '#F5F5F5'),
                                                                borderRadius:
                                                                    new BorderRadius.circular(
                                                                        4.0)),
                                                            child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child: InkWell(
                                                                    borderRadius:
                                                                        new BorderRadius.circular(
                                                                            4.0),
                                                                    onTap:
                                                                        () async {
                                                                      if (fromDate.compareTo(toDate) >
                                                                              0 ||
                                                                          toDate ==
                                                                              fromDate) {
                                                                      } else {
                                                                        setState(
                                                                            () {
                                                                          isPopupOpen =
                                                                              false;
                                                                        });
                                                                      }
                                                                    },
                                                                    child: Center(
                                                                        child:
                                                                            Text('GET Invoice'.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)))))))))
                                          ]))))))))
          : SizedBox()
    ]);
  }

  _buildBottomPicker(Widget picker) {
    return Container(
        height: 216.0,
        padding: const EdgeInsets.only(top: 6.0),
        color: CupertinoColors.white,
        child: DefaultTextStyle(
            style:
                const TextStyle(color: CupertinoColors.black, fontSize: 22.0),
            child: GestureDetector(
                // Blocks taps from propagating to the modal sheet and popping.
                onTap: () {},
                child: SafeArea(top: false, child: picker))));
  }

  transaction() {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: transactionSectionList.length,
        itemBuilder: (context, index) {
          return StickyHeaderBuilder(
              builder: (BuildContext context, double stuckAmount) {
                return Container(
                    color: HexColor('#F5F5F5'),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                  '${DateFormat('dd MMM, yyyy').format(DateTime.fromMillisecondsSinceEpoch(int.tryParse(transactionSectionList[index].date)))}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)))
                        ]));
              },
              content: Column(children: <Widget>[
                Divider(height: 1),
                Container(
                    margin: EdgeInsets.all(16),
                    child: getSubList(transactionSectionList[index]))
              ]));
        });
  }

  Widget getSubList(TransactionSection data) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          data.transactionList[index].isExpanded = !isExpanded;
        });
      },
      children: data.transactionList
          .map<ExpansionPanel>((TransactionResponse transaction) {
        return ExpansionPanel(
            canTapOnHeader: true,
            isExpanded: transaction.isExpanded,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Row(children: <Widget>[
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                            transaction.type == 'RECEIVE'
                                ? '+ ₹ ${transaction.amount}'
                                : '- ₹ ${transaction.amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: transaction.type == 'RECEIVE'
                                  ? Colors.black
                                  : Colors.red,
                            )))),
                Text('${transaction.remark}',
                    style: TextStyle(color: Colors.black54))
              ]);
            },
            body: Column(children: <Widget>[
              Divider(height: 1),
              Container(
                  margin: EdgeInsets.all(16),
                  child: Column(children: <Widget>[
                    transaction.statusRequest != ''
                        ? Column(children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              transaction.statusRequest == '1'
                                                  ? Colors.blue.withOpacity(0.5)
                                                  : Colors.blue,
                                          border: Border.all(
                                              color: Colors.white, width: 2)),
                                      child: Icon(LineIcons.check,
                                          color: Colors.white, size: 12)),
                                  Expanded(
                                      child: Container(
                                          height: 2,
                                          color: transaction.statusProcess ==
                                                  '1'
                                              ? Colors.blue
                                              : Colors.grey.withOpacity(0.5))),
                                  Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: transaction.statusProcess ==
                                                  '1'
                                              ? Colors.blue
                                              : Colors.blue.withOpacity(0.5),
                                          border: Border.all(
                                              color: Colors.white, width: 2)),
                                      child: Icon(Icons.done,
                                          color: Colors.white, size: 12)),
                                  Expanded(
                                      child: Container(
                                          height: 2,
                                          color: transaction.statusCredit == '1'
                                              ? Colors.blue
                                              : Colors.grey.withOpacity(0.5))),
                                  Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: transaction.statusCredit == '1'
                                              ? Colors.blue
                                              : Colors.blue.withOpacity(0.5),
                                          border: Border.all(
                                              color: Colors.white, width: 2)),
                                      child: Icon(Icons.done,
                                          color: Colors.white, size: 12))
                                ]),
                            Container(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                          child: Container(
                                              width: 120,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Withdrawal\nRequested',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black54)))),
                                      Text('Withdrawal\nProcessed',
                                          textAlign: TextAlign.center,
                                          style:
                                              TextStyle(color: Colors.black54)),
                                      Expanded(
                                          child: Container(
                                              width: 120,
                                              alignment: Alignment.centerRight,
                                              child: Text('Amount\nCredited',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black54))))
                                    ]))
                          ])
                        : SizedBox(),
                    transaction.statusRequest != ''
                        ? Divider(height: 1)
                        : SizedBox(),
                    Container(
                        padding: EdgeInsets.only(
                            right: 16,
                            left: 16,
                            top: transaction.statusRequest != '' ? 16 : 8,
                            bottom: 8),
                        child: Row(children: <Widget>[
                          Container(
                              width: 120,
                              child: Text('Transaction id',
                                  style: TextStyle(color: Colors.black54))),
                          Container(child: Text(transaction.transactionId))
                        ])),
                    Container(
                        padding: EdgeInsets.only(
                            right: 16, left: 16, top: 8, bottom: 8),
                        child: Row(children: <Widget>[
                          Container(
                              width: 120,
                              child: Text('Transaction date',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ))),
                          Text(DateFormat('dd MMM, HH:mm:ss a').format(
                              DateFormat('dd/MM/yyyy,HH:mm:ss a')
                                  .parse(transaction.time)))
                        ])),
                    Container(
                        padding: EdgeInsets.only(
                            right: 16, left: 16, top: 8, bottom: 8),
                        child: Row(children: <Widget>[
                          Container(
                              width: 120,
                              child: Text('Team name',
                                  style: TextStyle(color: Colors.black54))),
                          Text(transaction.teamName)
                        ]))
                  ]))
            ]));
      }).toList(),
    );
  }
}
