//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thrawat_app/Display.dart';
import 'package:thrawat_app/Questions.dart';

import 'main.dart';

class AddQuestion extends StatefulWidget {
  Function(String question, bool answer) addnew;

  AddQuestion(this.addnew);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final QuestionController = TextEditingController();

  final AnswerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Question'),
                controller: QuestionController,
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText:'enter 0 for false or 1 for true'),
                controller: AnswerController,
                // onChanged: (val) => amountInput = val,
              ),
              FlatButton(
                onPressed: () {
             if(QuestionController.text.isEmpty|| double.parse(AnswerController.text)!=0||double.parse(AnswerController.text)==1){
               print(QuestionController.text);
               return ;
             }

            if (double.parse(AnswerController.text)==1) {
               widget.addnew(QuestionController.text, true);
               print(QuestionController.text);
             }

            if (double.parse(AnswerController.text)==0) {
                 widget.addnew(QuestionController.text,false);
                 print(67);
               }
             }
                ,
                child: Text("Add Question"),
                textColor: Colors.purple,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
