import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _selectedIndex = 0;
  int _score = 0;

  final List<Color> _answerColor = [
    Colors.purple.shade600,
    Colors.blue,
    Colors.green.shade600,
    Colors.orange.shade400,
  ];

  final List<Map<String, Object>> _questions = [
    {
      "question": "Which programming languge is Flutter built on?",
      "answers": [
        {"answer": "Java", "score": 0},
        {"answer": "Kotlin", "score": 0},
        {"answer": "Dart", "score": 1},
        {"answer": "Python", "score": 0},
      ]
    },
    {
      "question": "Which city is the capital of Malaysia?",
      "answers": [
        {"answer": "Selangor", "score": 0},
        {"answer": "Kuala Lumpur", "score": 1},
        {"answer": "Cyberjaya", "score": 0},
        {"answer": "Penang", "score": 0},
      ]
    },
    {
      "question": "Which city is the capital of South Korea?",
      "answers": [
        {"answer": "Busan", "score": 0},
        {"answer": "Jeju", "score": 0},
        {"answer": "Daegu", "score": 0},
        {"answer": "Seoul", "score": 1},
      ]
    },
    {
      "question": "Which city is the capital of Malaysia?",
      "answers": [
        {"answer": "Selangor", "score": 0},
        {"answer": "Kuala Lumpur", "score": 1},
        {"answer": "Cyberjaya", "score": 0},
        {"answer": "Penang", "score": 0},
      ]
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _score += score;
      _selectedIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (_selectedIndex < _questions.length) ?
      Column(
        children: [
          SizedBox(height: 80),
          Icon(Icons.question_answer_rounded, size: 50, color: Colors.blue.shade800),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              _questions[_selectedIndex]["question"] as String,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.blue.shade800, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 30),
          ...(_questions[_selectedIndex]["answers"]
                  as List<Map<String, Object>>)
              .map((answer) => Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(_answerColor[_selectedIndex]),
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
                      ),
                      onPressed: () => _answerQuestion(answer["score"] as int),
                      child: Text(answer["answer"] as String),
                    ),
                  ),),
          SizedBox(height: 20),
                  Icon(Icons.pest_control_rodent, size: 50, color: Colors.brown)
        ],
      ) : Column(
        children : [
          Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text("You have completed the quiz!"),
                SizedBox(height: 20),
                Text("You scored $_score out of ${_questions.length}"),
                      ElevatedButton(
                        onPressed: _resetQuiz,
                        child: Text("Restart Quiz"),
                      ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
