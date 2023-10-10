//Statefulwidget's methonds
//initState()
//build()
//setState()
//dispose()

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/answer_button.dart';

import 'package:quiz/data/questions.dart';
// import 'package:quiz/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
 
  @override
State<QuestionsScreen> createState(){
  return _QuestionsScreenState();
}
}

class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex =0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(context){
    final currentQuestion = questions [currentQuestionIndex];
   
  return SizedBox(
    width:double.infinity,
    child:Container(
      margin: const EdgeInsets.all(40) ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
           Text(
            currentQuestion.text,
            style:GoogleFonts.ubuntu(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 201, 153, 251),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height:30),
          //spread operator
    
          ...currentQuestion.getShuffledAnswers().map((answer){
           return AnswerButton(
            answerText: answer,
            onTap: (){
              answerQuestion(answer);
            }
            ,);
          })
        ]
      ),
    )
  );
  }
}