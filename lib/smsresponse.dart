import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:project1/status%20page.dart';
import 'package:telephony/telephony.dart';

import 'home_screen.dart';

class smsresponse extends StatefulWidget {
  var code;
  var mobno;
  smsresponse({Key? mykey, this.code, this.mobno}) : super(key: mykey);

  @override
  State<smsresponse> createState() => _smsresponseState();
}

class _smsresponseState extends State<smsresponse> {
  final Telephony telephony = Telephony.instance;
  int TimeInSec = 100;
  String mobno = "";
  String code = "";
  String message = "";
  bool flag = true;

  late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _starttimer();
  }

  _starttimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      setState(() {
        if (TimeInSec > 0) {
          TimeInSec--;
        } else {
          timer.cancel();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => home_screen(
                        pageindex: 0,
                      )));
        }
      });
      final List<SmsMessage> messages = await telephony.getInboxSms(
        columns: [SmsColumn.ADDRESS, SmsColumn.BODY],
        sortOrder: [
          OrderBy(SmsColumn.DATE), // sort by date in descending order
        ], // limit the result to the last message only
      );

      final List<SmsMessage> filteredMessages = messages.where((message) {
        return message.address == "+91$mobno";
      }).toList();

      if (filteredMessages.isNotEmpty) {
        final SmsMessage lastMessage = filteredMessages.first;
        setState(() {
          message = lastMessage.body.toString();
        });
        if (message == code) {
          timer.cancel();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => status_page()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (widget.code != null && widget.mobno != null) {
        mobno = widget.mobno;
        code = widget.code;
        widget.mobno = null;
        widget.code = null;
      }
    });
    return Scaffold(
      body: Center(
        child: CircularPercentIndicator(
          radius: 100,
          lineWidth: 10,
          percent: TimeInSec.toDouble() / 100,
          progressColor: Colors.indigo,
          animation: true,
          animateFromLastPercent: true,
          center: Text(
            "$TimeInSec",
            style: TextStyle(color: Colors.indigo, fontSize: 80.0),
          ),
        ),
      ),
    );
  }
}
