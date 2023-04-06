import 'package:flutter/material.dart';
import 'dart:async';
import 'choose_cups_screen.dart';
import 'choose_rec_screen.dart';

class ChooseDeviceScreen extends StatefulWidget {
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  @override
  bool selectionC = false;
  bool selectionF = false;
  bool selectionD = false;
  String machine = '';

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "What coffee maker are you using?",
                key: Key("device_text"),
                style: TextStyle(
                  color: Color(0xff4C748B),
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Color(0xff4C748B), spreadRadius: 3),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: ElevatedButton(
                    key: Key("device_french"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size.fromHeight(2),
                      padding: EdgeInsets.all(20),
                    ),
                    onPressed: () {
                      setState(() {
                        selectionF = !selectionF;
                        selectionD = false;
                        machine = "French";
                      });
                    },
                    child: Text(
                      "French Press",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xff4C748B),
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Icon(Icons.check,
                        color: (selectionF ? Color(0xff4C748B) : Colors.white)))
              ],
            )),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Color(0xff4C748B), spreadRadius: 3),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 0),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: ElevatedButton(
                  key: Key("device_drip"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: Size.fromHeight(2),
                    padding: EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    setState(() {
                      selectionD = !selectionD;
                      selectionF = false;
                      machine = "Drip";
                    });
                  },
                  child: Text("Drip Machine",
                      style: TextStyle(
                          color: Color(0xff4C748B),
                          fontFamily: 'Montserrat',
                          fontSize: 14)),
                ),
              ),
              Expanded(
                  child: Icon(Icons.check,
                      color: (selectionD ? Color(0xff4C748B) : Colors.white)))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: ElevatedButton(
              key: Key("device_screen_continue"),
              onPressed: () {
                setState(() {
                  if (selectionF == true || selectionD == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChooseCupsScreen(machine: machine)));
                  }
                });
              },
              child: Text("Continue",
                  style: TextStyle(
                    color: (selectionF || selectionD
                        ? Color(0xffFFFFFF)
                        : Color(0xff757474)),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                  )),
              style: ElevatedButton.styleFrom(
                  primary: (selectionF || selectionD
                      ? Color(0xff4C748B)
                      : Color(0xffE2E2E2)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.all(20),
                  minimumSize: Size.fromHeight(2))),
        ),
      ],
    ));
  }
}
