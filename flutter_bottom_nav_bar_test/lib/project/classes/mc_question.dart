// import 'package:flutter/material.dart';

// import 'mc_answer.dart';

// class MCQuestion extends StatefulWidget {
//   Map<String, Object> question;

//   MCQuestion({super.key, required this.question});

//   @override
//   State<MCQuestion> createState() => _MCQuestionState();
// }

// class _MCQuestionState extends State<MCQuestion> {

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height / 4,
//           child: Center(
//             child: Text(
//               question['question'].toString(),
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         ...(_questions[0]['answers'] as List<Map<String, dynamic>>)
//             .map((e) => MCAnswer(
//                   answerText: e['answerText'],
//                   answerColor: e['score'] ? Colors.green : Colors.grey,
//                 ))
//       ],
//     );
//   }
// }
