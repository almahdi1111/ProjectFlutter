//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:thrawat_app/Questions.dart';

import 'AddQustion.dart';

class Play extends StatefulWidget {
  List<Question> questionsList = [];

  Play(this.questionsList);

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  int count = 0;
  final tickIcon = Icon(
    Icons.check,
    color: Colors.green,
  );
  final crossIcon = Icon(
    Icons.clear,
    color: Colors.red,
  );
  List<Icon> iconList = [];
  bool first = true;

  check(selectAnswer) {
    if (selectAnswer == widget.questionsList[count].correctAnswer) {
      setState(() {
        iconList.add(tickIcon);
        if (count < widget.questionsList.length - 1)
          count++;
        else {
          count = 0;
        }
      });
    } else {
      setState(() {
        iconList.add(crossIcon);
        if (count < widget.questionsList.length - 1)
          count++;
        else
          count = 0;
      });
    }
  }

  checkRonge() {
    setState(() {
      iconList.add(crossIcon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 200,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                count == widget.questionsList.length - 1
                    ? "The Last Queston $count"
                    : "Queston ${count+1}",
                style: TextStyle(fontSize: 18, color: Colors.amber),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.questionsList[count].question,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
        ),

        Container(
            height: 140,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  RaisedButton(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'True',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      color: Colors.green,
                      onPressed: () {
                        check(true);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'False',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      color: Colors.red,
                      onPressed: () {
                        check(false);
                      }),
                  SizedBox(
                    height: 10,
                  ),
               Row(children: iconList),
                ]))
      ],
    );
  }
}
