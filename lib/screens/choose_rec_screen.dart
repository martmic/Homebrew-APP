import 'package:flutter/material.dart';
import 'package:homebrew/utils/coffee_tools.dart';
import 'dart:async';
import 'choose_device_screen.dart';
import 'choose_cups_screen.dart';

class ChooseRecScreen extends StatefulWidget {
  @override
  int userinput = 0;
  String machine = '';

  ChooseRecScreen({this.userinput, this.machine});

  _ChooseRecScreenState createState() => _ChooseRecScreenState();
}

class _ChooseRecScreenState extends State<ChooseRecScreen> {
  @override
  bool selectionA = false;
  String whichM = '';

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            key: Key("rec_back"),
            iconSize: 25,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChooseCupsScreen(machine: widget.machine)));
              });
            },
          ),
        ),
        SizedBox(height: 150),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "Recommended ",
            key: Key("rec_text"),
            style: TextStyle(
              color: Color(0xff4C748B),
              fontSize: 18,
              fontFamily: 'Montserrat',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          child: Text(
            (widget.machine == "French"
                    ? '${CoffeeTools.cups2F(widget.userinput).toInt()}'
                    : '${CoffeeTools.cups2D(widget.userinput).toInt()}') +
                (widget.machine == 'French'
                    ? " - course ground coffee"
                    : " - medium ground coffee") +
                "\n" +
                "${CoffeeTools.cups2grams(widget.userinput).toInt()}" +
                " - water",
            key: Key("rec_output"),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff4C748B),
              fontSize: 14,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "Enjoy your deliciouse coffee.",
            style: TextStyle(
              color: Color(0xff4C748B),
              fontSize: 10,
              fontFamily: 'Montserrat',
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 150),
        Container(
          padding: EdgeInsets.all(50),
          child: ElevatedButton(
              key: Key("rec_continue"),
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseDeviceScreen()));
                });
              },
              child: Text("Done",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                  )),
              style: ElevatedButton.styleFrom(
                  primary: (Color(0xff4C748B)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.all(20),
                  minimumSize: Size.fromHeight(2))),
        ),
      ],
    ));
  }
}
