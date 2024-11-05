import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HobbyQuiz(),
  ));
}

class HobbyQuiz extends StatefulWidget {
  const HobbyQuiz({super.key});

  @override
  State<HobbyQuiz> createState() => _HobbyQuizState();
}

class _HobbyQuizState extends State<HobbyQuiz> {
  int _questionIndex = 0;
  final Map<int, int> _answers = {};
  final QuizResults _quizResults = QuizResults();

  final List<Map<String, dynamic>> quizQuestions = [
    {
      'question': 'How do you prefer to spend your time?',
      'answers': [
        {'text': 'Playing sports or working out', 'result': 1},
        {'text': 'Reading books or writing fanfiction', 'result': 2},
        {'text': 'Experimenting with new tech or coding', 'result': 3},
        {'text': 'Volunteering or attending a protest', 'result': 4},
      ],
    },
    {
      'question': 'What activity feels most rewarding to you?',
      'answers': [
        {'text': 'Completing a challenging workout', 'result': 1},
        {'text': 'Writing fanfiction or diving into fandoms', 'result': 2},
        {'text': 'Creating art or writing poetry', 'result': 4},
        {'text': 'Planning my next travel adventure', 'result': 3},
      ],
    },
    {
      'question': 'What do you usually spend your extra money on?',
      'answers': [
        {'text': 'Fitness gear or sports equipment', 'result': 1},
        {'text': 'Fandom merchandise or books', 'result': 2},
        {'text': 'New gadgets or apps', 'result': 3},
        {
          'text': 'Art supplies or ingredients for a creative dish',
          'result': 4
        },
      ],
    },
    {
      'question': 'Which of these brings you the most joy?',
      'answers': [
        {'text': 'Competing in sports or achieving fitness goals', 'result': 1},
        {
          'text': 'Writing fanfiction or exploring new fandom content',
          'result': 2
        },
        {
          'text': 'Solving tech problems or building something new',
          'result': 3
        },
        {'text': 'Volunteering for a cause you believe in', 'result': 4},
      ],
    },
    {
      'question': 'What’s your idea of a fun social activity?',
      'answers': [
        {
          'text': 'Competing in sports or working out with friends',
          'result': 1
        },
        {
          'text': 'Attending a fandom convention or fanfic writing session',
          'result': 2
        },
        {'text': 'Participating in a hackathon or tech event', 'result': 3},
        {
          'text': 'Joining a community rally or social movement event',
          'result': 4
        },
      ],
    },
    {
      'question': 'How do you prefer to relax?',
      'answers': [
        {'text': 'Going for a run or doing a workout', 'result': 1},
        {'text': 'Writing or reading fanfiction', 'result': 2},
        {'text': 'Exploring new gadgets or solving tech puzzles', 'result': 3},
        {'text': 'Spending time with your pet', 'result': 4},
      ],
    },
    {
      'question': 'What do you like to share with others?',
      'answers': [
        {'text': 'Fitness tips or workout routines', 'result': 1},
        {'text': 'Fandom theories or fanfiction', 'result': 2},
        {'text': 'Tech knowledge or fixing devices', 'result': 3},
        {'text': 'Stories about your pet', 'result': 4},
      ],
    },
    {
      'question': 'How do you enjoy expressing yourself?',
      'answers': [
        {'text': 'Competing in sports or physical challenges', 'result': 1},
        {'text': 'Writing stories or engaging in fandoms', 'result': 2},
        {'text': 'Coding or working with tech projects', 'result': 3},
        {'text': 'Painting, cooking, or writing poetry', 'result': 4},
      ],
    },
    {
      'question': 'What’s your idea of a fun time?',
      'answers': [
        {
          'text': 'Going hiking or participating in a sports retreat',
          'result': 1
        },
        {
          'text': 'Attending a fan convention or meeting fandom friends',
          'result': 2
        },
        {'text': 'Exploring a new country or trying local foods', 'result': 3},
        {'text': 'Spending time with your pet', 'result': 4},
      ],
    },
    {
      'question': 'What inspires you the most?',
      'answers': [
        {'text': 'Pushing yourself to new physical limits', 'result': 1},
        {
          'text': 'Creating stories or theories based on your favorite fandoms',
          'result': 2
        },
        {'text': 'Innovating with tech or creating new things', 'result': 3},
        {'text': 'Advocating for social justice or human rights', 'result': 4},
      ],
    },
  ];

  void _answerQuestion(int answerValue) {
    setState(() {
      _answers[_questionIndex] = answerValue;
      _quizResults.tallyResults(answerValue, _questionIndex + 1);
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _answers.clear();
      _quizResults.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personality Quiz')),
      body: _questionIndex < quizQuestions.length
          ? Quiz(
              questionIndex: _questionIndex,
              questions: quizQuestions,
              answerQuestion: _answerQuestion,
            )
          : Result(
              quizResults: _quizResults,
              resetQuiz: _resetQuiz,
            ),
    );
  }
}

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, dynamic>> questions;
  final Function(int) answerQuestion;

  const Quiz({
    super.key,
    required this.questionIndex,
    required this.questions,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Question with background image
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image:
                  AssetImage('assets/download.jpeg'), // Image for each question
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.black, // Set the border color
              width: 2.0, // Set the border width
            ),
            borderRadius: BorderRadius.circular(12.0), // Add a slight curve
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                questions[questionIndex]['question'] as String,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 2.0,
                      color: Colors.black,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        // Options (no background image here)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: (questions[questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map((answer) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () => answerQuestion(answer['result'] as int),
                      child: Text(answer['text'] as String),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class Result extends StatelessWidget {
  final QuizResults quizResults;
  final VoidCallback resetQuiz;

  const Result({super.key, required this.quizResults, required this.resetQuiz});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your Main Hobby: ${quizResults.getMainHobby()}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Your Sub Hobbies: ${quizResults.getSubHobbies().join(', ')}',
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: resetQuiz,
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}

class QuizResults {
  final Map<int, int> _results = {};

  void tallyResults(int result, int questionIndex) {
    _results[questionIndex] = result;
  }

  String getMainHobby() {
    // Logic to determine main hobby based on results
    // Here, we simply return a placeholder for demonstration
    return 'Main Hobby Placeholder';
  }

  List<String> getSubHobbies() {
    // Logic to determine sub hobbies based on results
    // Here, we simply return a placeholder for demonstration
    return ['Sub Hobby 1', 'Sub Hobby 2'];
  }

  void reset() {
    _results.clear();
  }
}
