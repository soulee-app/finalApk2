import 'package:flutter/material.dart';

class MentalStageQuiz extends StatefulWidget {
  const MentalStageQuiz({super.key});

  @override
  State<MentalStageQuiz> createState() => _MentalStageQuizState();
}

class _MentalStageQuizState extends State<MentalStageQuiz> {
  int result1 = 0;
  int result2 = 0;
  int result3 = 0;
  int result4 = 0;
  int currentQuestion = 0;

  final List<Map<String, Object>> questions = [
    //1
    {
      'question':
          '"Imagine you are in a crowded place, surrounded by your friends." How do you feel?',
      'answers': [
        {'text': 'I am having a great time. ', 'result': 1},
        {'text': 'I still feel lonely.', 'result': 2},
        {'text': ' I don\'t even have any friends to imagine.', 'result': 3},
        {'text': 'I am not good with crowds.', 'result': 4}
      ]
    },
    //2
    {
      'question':
          '"You\'re invited to a social gathering where you know only a few people." How do you feel about going?',
      'answers': [
        {'text': 'Excited to meet new people.', 'result': 1},
        {'text': 'Anxious but willing to try.', 'result': 2},
        {'text': 'I prefer to stay home.', 'result': 4},
        {'text': 'I feel overwhelmed just thinking about it.', 'result': 3}
      ]
    },
    //3
    {
      'question':
          '"You wake up in the morning and think about the day ahead." What is your first thought?',
      'answers': [
        {'text': 'I\'m ready to take on the day. ', 'result': 1},
        {'text': ' I wish I could stay in bed.', 'result': 3},
        {'text': 'I feel indifferent about it. ', 'result': 2},
        {'text': ' I\'m already exhausted.', 'result': 4}
      ]
    },
    //4
    {
      'question': '"You receive a compliment from someone." How do you react?',
      'answers': [
        {'text': 'I feel happy and grateful.', 'result': 1},
        {'text': 'I doubt if they really mean it.', 'result': 4},
        {'text': 'I feel awkward and don\'t know how to respond.', 'result': 2},
        {'text': 'I don\'t believe it at all. ', 'result': 3}
      ]
    },
    //5
    {
      'question':
          ' "You make a mistake at work or school." What is your response?',
      'answers': [
        {'text': 'Learn from it and move on.', 'result': 1},
        {'text': 'Feel embarrassed and worry about it.', 'result': 3},
        {'text': 'Blame myself harshly.', 'result': 4},
        {'text': 'Try to hide it.', 'result': 2}
      ]
    },
    //6
    {
      'question':
          'You have some time to yourself during the day." How do you spend it?',
      'answers': [
        {'text': ' Do something relaxing or fun.', 'result': 1},
        {'text': 'Catch up on tasks or work.', 'result': 2},
        {'text': 'Scroll through social media.', 'result': 4},
        {'text': ' Overthink about past events.', 'result': 3}
      ]
    },
    //7
    {
      'question':
          '"Someone cancels plans with you at the last minute." What is your immediate reaction?',
      'answers': [
        {'text': 'Feel ok and enjoy the free time.', 'result': 1},
        {'text': 'Feel a bit disappointed but understanding.', 'result': 4},
        {'text': 'Feel rejected and take it personally.', 'result': 2},
        {'text': 'Feel angry or frustrated.', 'result': 3}
      ]
    },
    //8
    {
      'question': '"You\'re about to try something new." How do you feel?',
      'answers': [
        {'text': 'Excited and open to the experience.', 'result': 1},
        {'text': 'Nervous but willing to give it a try.', 'result': 2},
        {'text': ' Anxious and unsure if I can do it. ', 'result': 4},
        {'text': 'I avoid trying new things. ', 'result': 3}
      ]
    },
    //9
    {
      'question':
          ' "You receive constructive criticism." How do you handle it?',
      'answers': [
        {'text': 'Appreciate the feedback and try to improve.', 'result': 1},
        {'text': 'Feel defensive but think about it later.', 'result': 4},
        {'text': 'Take it very personally and feel down.', 'result': 3},
        {'text': ' Ignore it and feel it was unjustified.', 'result': 2}
      ]
    },
    //10
    {
      'question': ' "You’re alone on a weekend." What do you do?',
      'answers': [
        {'text': 'Plan activities I enjoy.', 'result': 1},
        {'text': 'Use the time to rest.', 'result': 2},
        {'text': 'Feel lonely and sad.', 'result': 3},
        {'text': 'Feel anxious about being alone.', 'result': 4}
      ]
    },
    //11
    {
      'question':
          '"You notice changes in your mood recently." How do you feel about it?',
      'answers': [
        {'text': 'I’m aware and trying to understand why.', 'result': 4},
        {'text': 'It\'s confusing, but I manage.', 'result': 1},
        {'text': 'It\'s overwhelming and affecting my life.', 'result': 3},
        {'text': 'I ignore it and hope it passes.', 'result': 2}
      ]
    },
    //12
    {
      'question':
          ' "You\'re feeling overwhelmed with your responsibilities." What do you do?',
      'answers': [
        {'text': ' Make a plan and tackle things one at a time.', 'result': 1},
        {'text': 'Ask for help or support.', 'result': 4},
        {'text': ' Feel stressed and don\'t know where to start.', 'result': 2},
        {'text': 'Shut down and avoid everything.', 'result': 3}
      ]
    },
    //13
    {
      'question':
          '"You have an important event coming up." How do you feel about it?',
      'answers': [
        {'text': ' Excited and prepared.', 'result': 1},
        {'text': ' Nervous but hopeful. ', 'result': 4},
        {'text': ' Anxious and dreading it.', 'result': 3},
        {'text': 'I wish I could skip it.', 'result': 2}
      ]
    },
  ];

  void answerQuestion(int result) {
    setState(() {
      if (result == 1) {
        result1++;
      } else if (result == 2) {
        result2++;
      } else if (result == 3) {
        result3++;
      } else if (result == 4) {
        result4++;
      }
      currentQuestion++;
    });
  }

  String getResult() {
    if (result1 >= result2 && result1 >= result3 && result1 >= result4) {
      return "1. You're Crushing It!\n"
          "Description: You're in a rizzler spot right now! Life's little bumps don't seem to slow you down, and you're handling things like a total slayer. Keep riding that wave and remember to treat yourself—you're absolutely slaying it!";
    } else if (result2 > result1 && result2 >= result3 && result2 >= result4) {
      return "2. You’re Feeling a Bit Wobbly\n"
          "Description: Life's throwing you some curveballs, and it's feeling a little wobbly RN. But guess what? You're not alone! Hit up your squad, treat yourself to a little serotonin boost, and know it’s okay to not be vibing 24/7.";
    } else if (result3 > result1 && result3 >= result2 && result3 >= result4) {
      return "3.  You’re on a Tough Ride Right Now\n"
          "Description: Big yikes, life’s feeling pretty heavy at the moment. You're on a bit of a roller coaster, and it's okay to let out a whole 'bruh' moment (or ten). Slide into the DMs of someone you trust—sometimes just spilling the tea can help lighten the load. You've got this, even if it feels like a flop era.";
    } else {
      return "4. You're Crushing It!\n"
          "You’re super in tune with how you're feeling, and that's low-key iconic! You're doing some major mental gymnastics to figure things out. Keep it 100, and remember—you don’t need to have all the answers RN. You're already doing great by just being woke about your feelings.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personality Quiz'),
      ),
      body: currentQuestion < questions.length
          ? Column(
              children: [
                // Question with background image
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/download.jpeg'), // Image for each question
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.black, // Set the border color
                      width: 2.0, // Set the border width
                    ),
                    borderRadius:
                        BorderRadius.circular(12.0), // Add a slight curve
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        questions[currentQuestion]['question'] as String,
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
                      children: (questions[currentQuestion]['answers']
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
                                    borderRadius: BorderRadius.circular(10.0)),
                                padding: const EdgeInsets.all(16.0),
                                textStyle: const TextStyle(fontSize: 16),
                              ),
                              onPressed: () =>
                                  answerQuestion(answer['result'] as int),
                              child: Text(answer['text'] as String),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                getResult(),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}

/**
 {
      'question': '',
      'answers': [
        {
          'text': '',
          'result': 
        },
        {
          'text': '',
          'result': 
        },
        {
          'text': '',
          'result': 
        },
        {
          'text': '',
          'result': 
        }
      ]
    },
 */