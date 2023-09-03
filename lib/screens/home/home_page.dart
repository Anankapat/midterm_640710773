// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

// TODO: ใส่รหัสนักศึกษาที่ค่าสตริงนี้
const studentId = '640710773';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedAnswer;
  bool isAnswered = false;
  int currentQuestionIndex = 0; // Index ของคำถามปัจจุบัน
  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['London', 'Berlin', 'Paris', 'Madrid'],
      'correctAnswer': 'Paris',
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'options': ['Earth', 'Mars', 'Venus', 'Jupiter'],
      'correctAnswer': 'Mars',
    },
    {
      'question': 'What is 2 + 2?',
      'options': ['3', '4', '5', '6'],
      'correctAnswer': '4',
    },
  ];
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_colorful.jpg"),
              opacity: 0.6,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Good Morning',
                  textAlign: TextAlign.center, style: textTheme.headlineMedium),
              Text(studentId,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
              Spacer(),
              _buildQuizView(),
              Spacer(),
              _buildButtonPanel(),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  _buildQuizView() {
    if (currentQuestionIndex < questions.length) {
      final question = questions[currentQuestionIndex];
      final questionText = question['question'] as String;
      final options = question['options'] as List<String>;

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 7,
              blurRadius: 12,
              offset: Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Question ${currentQuestionIndex + 1}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      color: Colors.black,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 7,
                        blurRadius: 12,
                        offset: Offset(0, 10), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      questionText,
                      style: TextStyle(fontSize: 40.0, color: Colors.white,),
                    ),
                  ),
                ),

              SizedBox(height: 20.0),
              ...options.map((option) => ElevatedButton(
                onPressed: () {
                  // Check if the question is already answered
                  if (!isAnswered) {
                    setState(() {
                      selectedAnswer = option;
                      isAnswered = true;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 3.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: selectedAnswer == option
                              ? Colors.green
                              : Colors.transparent,
                        ),
                        Row(
                          children: [
                            Text(option, style: TextStyle(fontSize: 16.0), ),
                          ],
                        ),
                        Icon(Icons.abc),
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      );
    }
  }

  _buildButtonPanel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (currentQuestionIndex > 0)
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentQuestionIndex--;
              });
            },
            child: Text('Previous'),
          ),
        if (currentQuestionIndex < questions.length - 1)
          ElevatedButton(
            onPressed: () {
              setState(() {
                currentQuestionIndex++;
              });
            },
            child: Text('Next'),
          ),
      ],
    );

  }
}
