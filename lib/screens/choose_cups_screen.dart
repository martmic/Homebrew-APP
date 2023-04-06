import 'package:flutter/material.dart';
import 'dart:async';
import 'choose_rec_screen.dart';
import 'choose_device_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

class ChooseCupsScreen extends StatefulWidget {
  @override
  String machine = '';
  ChooseCupsScreen({this.machine});

  _ChooseCupsScreenState createState() => _ChooseCupsScreenState();
}

class _ChooseCupsScreenState extends State<ChooseCupsScreen> {
  @override
  final _textController = TextEditingController();
  int userinput = 0;
  bool selectionA = false;

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            key: Key("cups_back"),
            iconSize: 25,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseDeviceScreen()));
              });
            },
          ),
        ),
        SizedBox(height: 100),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "How many cups would you like? ",
            key: Key("cups_text"),
            style: TextStyle(
              color: Color(0xff4C748B),
              fontSize: 18,
              fontFamily: 'Montserrat',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            key: Key("cups_input"),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Color(0xff4C748B),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color(0xff4C748B),
                  width: 2.0,
                ),
              ),
            ),
            controller: _textController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (val) {
              userinput = int.tryParse(val);
              if (userinput > 0) {
                selectionA = true;
              }
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: ElevatedButton(
              key: Key("cups_screen_continue"),
              onPressed: () {
                setState(() {
                  if (selectionA == true) {
                    _textController.text = '';
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseRecScreen(
                                userinput: userinput,
                                machine: widget.machine)));
                  } else {
                    throw ArgumentError();
                  }
                });
              },
              child: Text("Continue",
                  style: TextStyle(
                    color: (selectionA ? Color(0xffFFFFFF) : Color(0xff757474)),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                  )),
              style: ElevatedButton.styleFrom(
                  primary: (selectionA ? Color(0xff4C748B) : Color(0xffE2E2E2)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.all(20),
                  minimumSize: Size.fromHeight(2))),
        ),
        SizedBox(height: 100),
      ],
    ));
  }
}
