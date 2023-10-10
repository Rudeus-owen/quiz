
// import 'package:flutter/material.dart';
// import 'package:quiz/data/questions.dart';
// import 'package:quiz/questions-summary.dart';
// class ResultScreen extends StatelessWidget {
//   const ResultScreen({
//     super.key,
//     required this.chosenAnswers,
//   });
//   final List<String> chosenAnswers;

//   List<Map<String, Object >> getSummaryData(){
//     final List<Map<String,Object>> summary = [];
//   for (var i=0; i<chosenAnswers.length; i++){
//     summary.add({
//       'question_index':i,
//       "question": questions[i].text,
//       'correct_answer': chosenAnswers[i]
//     });
//   }
//   return summary;
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     final summaryData =getSummaryData();
//     final numTotalQuestions =questions.length;
//     final numCorrectQuestions =summaryData.where((data){
//       return data['user_answer'] == data ['correct_answer'];
//     }).length;
//     return SizedBox(
//       width: double.infinity,
//       child: Container(
//         margin: const EdgeInsets.all(40),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//              Text(
//               'You answer $numCorrectQuestions out of $numTotalQuestions questions corectly!',
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             QuestionsSummary(summaryData),
//             const SizedBox(
//               height:30
//             ),
//             TextButton(
//               onPressed: () {},
//               child: const Text('Restart Quiz!'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary/questions-summary.dart';
import 'package:quiz/start_screen.dart';
class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
     required this.OnRestart,
     required this.OnExit
    });
    final List<String> chosenAnswers;
    final void Function() OnRestart;
    final void Function() OnExit;
   
    List<Map<String, Object>> getSummaryData() {
      final List<Map<String, Object>> summary = [];
      for ( var i = 0; i < chosenAnswers.length; i++){
        summary.add({
          'question_index': i,
          'question' : questions[i].text,
          'correct_answer':questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        });
      }
      return summary;
    }
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style:GoogleFonts.ubuntu(
              color:Colors.white,
              fontSize:18,
              fontWeight:FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            
            ),
          
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            // TextButton(
            //   onPressed: () {},
            //   child: const Text(‘Restart Quiz’),
            // )
            OutlinedButton.icon  (
              onPressed: OnRestart,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),),
              const SizedBox(
                height:20,
              ),
            OutlinedButton.icon (
              onPressed:OnExit,
              style: OutlinedButton.styleFrom(
                 foregroundColor: Colors.white,
              ),
              icon:const Icon(Icons.exit_to_app_rounded),
              label: const Text("Exit")
            )
          ],
        ),
      ),
    );
  }
}




























