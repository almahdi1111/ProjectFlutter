import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thrawat_app/Display.dart';

import 'AddQustion.dart';

import 'Questions.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

      home: QuizPage(),

    );
  }
}


class QuizPage extends StatefulWidget {



  @override
  State<QuizPage> createState() => QuizPageState();
}



class QuizPageState extends State<QuizPage> {



  final List<Question> questionsList = [  Question('In school, Albert Einstein failed most of the subjects, except for physics and math?',false),
    Question('The FIFA World Cup 2022 will take place in Iran..', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
  ];

  void addnew(String question ,bool answer){
    final newQuestion=Question(
        question,
        answer
    );
    setState(() {
      questionsList.add(newQuestion);
    });
  }

  void startAddNewQuestion(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder:(_){
      return GestureDetector(
        onTap: (){},
        child: AddQuestion(addnew),
        behavior: HitTestBehavior.translucent,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        actions: [

          IconButton(onPressed: ()=>startAddNewQuestion(context),
              icon:Icon(Icons.add)
          )
        ],



      ),
      backgroundColor: Color(0xFF333333),
      body:SingleChildScrollView(
      child:Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [






        Play(questionsList),

      ],

    ),
    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
}

