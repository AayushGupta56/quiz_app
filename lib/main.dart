import 'package:flutter/material.dart';
import 'package:quizzler/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HOME(),
    );
  }
}

class HOME extends StatefulWidget {
  const HOME({Key? key}) : super(key: key);

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  @override
  List<Icon> score = [];
  QuizBrain qb = QuizBrain();
  void checkAnswer(bool userAnswer) {
    bool correctAnswer = qb.getAnswer();
    setState(() {
      if (correctAnswer == userAnswer) {
        score.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        score.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      bool check = qb.isFinished();
      print(check);
      if (check == true) {
        Alert(
          context: context,
          type: AlertType.warning,
          title: "RFLUTTER ALERT",
          desc: "Flutter is more awesome with RFlutter Alert.",
          buttons: [
            DialogButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                qb.restart();
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
            DialogButton(
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              //onPressed: () => Navigator.pop(context),
              onPressed: () {
                Navigator.pop(context);
                qb.restart();
              },
              gradient: LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]),
            )
          ],
        ).show();
      } else
        qb.nextQuestion();
    });
  }

  // Question q1 = Question(que: 'a', ans: true);

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent[700],
        centerTitle: true,
        title: Text(
          'Quiz',
          style: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        qb.getQuestion(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    //padding: EdgeInsets.all(10),
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            checkAnswer(true);
                          });
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow),
                        ),
                        style: TextButton.styleFrom(
                          // padding: EdgeInsets.all(30),
                          backgroundColor: Colors.green[700],
                          minimumSize: Size.fromHeight(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    //padding: EdgeInsets.all(10),
                    padding: EdgeInsets.fromLTRB(5, 3, 5, 5),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            checkAnswer(false);
                          });
                        },
                        child: Text(
                          'No',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          //padding: EdgeInsets.all(10),
                          backgroundColor: Colors.red[700],
                          minimumSize: Size.fromHeight(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue[900],
                  child: Row(
                    children: score,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

int ab = 5;
//another way of doing it

// import 'package:flutter/material.dart';
// import 'package:quizzler/quizbrain.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
//
// void main() {
//   runApp(MaterialApp(home: MyApp()));
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   List<Icon> score = [];
//   void checkAnswer(bool userAnswer) {
//     bool correctAnswer = qb.getAnswer();
//     setState(() {
//       if (correctAnswer == userAnswer) {
//         score.add(
//           Icon(
//             Icons.check,
//             color: Colors.green,
//           ),
//         );
//       } else {
//         score.add(
//           Icon(
//             Icons.close,
//             color: Colors.red,
//           ),
//         );
//       }
//       bool check = qb.isFinished();
//       print(check);
//       if (check == true) {
//         Alert(
//           context: context,
//           title: 'Finished!',
//           desc: 'You\'ve reached the end of the quiz.',
//         ).show();
//       } else
//         qb.nextQuestion();
//     });
//   }
//
//   QuizBrain qb = QuizBrain();
//   // Question q1 = Question(que: 'a', ans: true);
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       appBar: AppBar(
//         backgroundColor: Colors.blue[800],
//         centerTitle: true,
//         title: Text('Quiz'),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             // crossAxisAlignment: CrossAxisAlignment.stretch,
//             //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Expanded(
//                 flex: 5,
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Center(
//                     child: Text(
//                       qb.getQuestion(),
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.yellow,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 0,
//                 child: Padding(
//                   //padding: EdgeInsets.all(10),
//                   padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
//                   child: Center(
//                     child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           checkAnswer(true);
//                         });
//                       },
//                       child: Text(
//                         'Yes',
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.yellow),
//                       ),
//                       style: TextButton.styleFrom(
//                         // padding: EdgeInsets.all(30),
//                         backgroundColor: Colors.green[700],
//                         minimumSize: Size.fromHeight(50),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 0,
//                 child: Padding(
//                   //padding: EdgeInsets.all(10),
//                   padding: EdgeInsets.fromLTRB(5, 3, 5, 5),
//                   child: Center(
//                     child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           checkAnswer(false);
//                         });
//                       },
//                       child: Text(
//                         'No',
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.yellow,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       style: TextButton.styleFrom(
//                         //padding: EdgeInsets.all(10),
//                         backgroundColor: Colors.red[700],
//                         minimumSize: Size.fromHeight(50),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Row(
//                 children: score,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

int xy = 6;
////wrong one before not knowing scaffold should be under build

// import 'package:flutter/material.dart';
// import 'package:quizzler/quizbrain.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   List<Icon> score = [];
//   void checkAnswer(bool userAnswer) {
//     bool correctAnswer = qb.getAnswer();
//     setState(() {
//       if (correctAnswer == userAnswer) {
//         score.add(
//           Icon(
//             Icons.check,
//             color: Colors.green,
//           ),
//         );
//       } else {
//         score.add(
//           Icon(
//             Icons.close,
//             color: Colors.red,
//           ),
//         );
//       }
//       bool check = qb.isFinished();
//       print(check);
//       if (check == true) {
//         Alert(
//           context: context,
//           type: AlertType.error,
//           title: "RFLUTTER ALERT",
//           desc: "Flutter is more awesome with RFlutter Alert.",
//           buttons: [
//             DialogButton(
//               child: Text(
//                 "COOL",
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               ),
//               onPressed: () => Navigator.pop(context),
//               width: 120,
//             )
//           ],
//         ).show();
//       } else
//         qb.nextQuestion();
//     });
//   }
//
//   QuizBrain qb = QuizBrain();
//   // Question q1 = Question(que: 'a', ans: true);
//
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey[900],
//         appBar: AppBar(
//           backgroundColor: Colors.blue[800],
//           centerTitle: true,
//           title: Text('Quiz'),
//         ),
//         body: SafeArea(
//           child: Center(
//             child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.stretch,
//               //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Expanded(
//                   flex: 5,
//                   child: Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Center(
//                       child: Text(
//                         qb.getQuestion(),
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.yellow,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 0,
//                   child: Padding(
//                     //padding: EdgeInsets.all(10),
//                     padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
//                     child: Center(
//                       child: TextButton(
//                         onPressed: () {
//                           setState(() {
//                             checkAnswer(true);
//                           });
//                         },
//                         child: Text(
//                           'Yes',
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.yellow),
//                         ),
//                         style: TextButton.styleFrom(
//                           // padding: EdgeInsets.all(30),
//                           backgroundColor: Colors.green[700],
//                           minimumSize: Size.fromHeight(50),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 0,
//                   child: Padding(
//                     //padding: EdgeInsets.all(10),
//                     padding: EdgeInsets.fromLTRB(5, 3, 5, 5),
//                     child: Center(
//                       child: TextButton(
//                         onPressed: () {
//                           setState(() {
//                             checkAnswer(false);
//                           });
//                         },
//                         child: Text(
//                           'No',
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.yellow,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         style: TextButton.styleFrom(
//                           //padding: EdgeInsets.all(10),
//                           backgroundColor: Colors.red[700],
//                           minimumSize: Size.fromHeight(50),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   children: score,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
