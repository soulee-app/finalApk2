import 'package:flutter/material.dart';

class AboutMeQuiz extends StatefulWidget {
  const AboutMeQuiz({super.key});

  @override
  State<AboutMeQuiz> createState() => _AboutMeQuizState();
}

class _AboutMeQuizState extends State<AboutMeQuiz> {
  int result1 = 0;
  int result2 = 0;
  int result3 = 0;
  int currentQuestion = 0;

  final List<Map<String, Object>> questions = [
    //1
    {
      'question': 'I\'m having free time, I\'d prefer -',
      'answers': [
        {
          'text': 'staying in and spending quality time with Myself',
          'result': 1
        },
        {'text': 'going out and having fun with my friends', 'result': 2},
        {'text': 'I like both, depends on my mood ', 'result': 3}
      ]
    },
    //2
    {
      'question':
          'suppose you had a hectic week. how would you like to spend your weekend?',
      'answers': [
        {
          'text': 'I would chill in my room and binge movies and shows',
          'result': 1
        },
        {'text': 'I would meet my friends and have a good time', 'result': 2},
        {'text': 'I would spend quality time with my family ', 'result': 3}
      ]
    },
    //3
    {
      'question':
          'your institution arranged a sports event. which of the following would you enjoy more?',
      'answers': [
        {'text': 'indoor games like Uno cards Ludo', 'result': 1},
        {'text': 'outdoor games like cricket football badminton ', 'result': 2},
        {
          'text': 'doesn\'t really matter, I prefer being an audience.',
          'result': 3
        }
      ]
    },
    //4
    {
      'question': 'I feel like dancing when-',
      'answers': [
        {'text': 'I am alone ', 'result': 1},
        {'text': 'I am with my friends', 'result': 3},
        {'text': 'In occasions like a wedding etc.', 'result': 2}
      ]
    },
    //5
    {
      'question':
          'imagine there has been a fight online. in this case which of the following role will you play?',
      'answers': [
        {'text': 'I would engage in drama.', 'result': 2},
        {
          'text':
              'I would add fuel to the fire and instigate others to engage in the drama.',
          'result': 3
        },
        {
          'text': 'Dnone of this really bothers me so I will stay neutral.',
          'result': 1
        }
      ]
    },
    //6
    {
      'question': 'which kind of weather goes with your personality the most? ',
      'answers': [
        {'text': 'bright sunny summer or spring morning', 'result': 2},
        {'text': 'gloomy winter morning or rainy day', 'result': 1},
        {'text': 'a cozy fall afternoon', 'result': 3}
      ]
    },
    //7
    {
      'question': 'which one describes you?',
      'answers': [
        {'text': 'I think about past all the time', 'result': 1},
        {'text': 'I focus on the present ', 'result': 3},
        {'text': 'I worry about the future', 'result': 2}
      ]
    },
    //8
    {
      'question':
          'imagine you\'re having a mental breakdown. which of the following set of activities comforts you the most? ',
      'answers': [
        {
          'text': 'music, sleep, selfcare,  giving time to yourself',
          'result': 1
        },
        {
          'text': 'social gathering, hangout with friends, clubbing ',
          'result': 2
        },
        {'text': 'rant online, hangout alone, gym, solo date', 'result': 3}
      ]
    },
    //9
    {
      'question':
          'what is your favourite kind of travel destination and activity?',
      'answers': [
        {'text': ' mountain trekking with friends', 'result': 3},
        {'text': ' watching sunset at sea beach in a solo trip', 'result': 1},
        {'text': 'camping with random strangers in a forest', 'result': 2}
      ]
    },
    //10
    {
      'question': 'if you were given an opportunity to become famous -',
      'answers': [
        {'text': 'yes I would love to', 'result': 2},
        {'text': 'no thanks I will pass', 'result': 1},
        {'text': 'I don\'t know man maybe I will give it a shot.', 'result': 3}
      ]
    },
    //11
    {
      'question':
          'you have a deadline. how would you like to finish the task? ',
      'answers': [
        {'text': 'I would finish it timely in daytime', 'result': 3},
        {
          'text':
              'I would procrastinate your last moment and somehow complete it  at night',
          'result': 2
        },
        {'text': 'I would finish it long before the deadline', 'result': 3}
      ]
    },
    //12
    {
      'question':
          ' let\'s say your favourite artist is visiting your city. will you attend his concert? ',
      'answers': [
        {'text': 'of course at any cost', 'result': 2},
        {
          'text':
              'it\'s really doesn\'t matter that much. I might or I might not',
          'result': 3
        },
        {
          'text':
              'YouTube performance sounds better than life performance. I would brother enjoy from my room',
          'result': 1
        }
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
      }
      currentQuestion++;
    });
  }

  String getResult() {
    if (result1 >= result2 && result1 >= result3) {
      return " You enjoy introspective time and prioritizes self-care. you are independent and find comfort in solitude. you seem to prefer a calmer environment and might be more analytical.";
    } else if (result2 > result1 && result2 >= result3) {
      return "You thrive in social situations and enjoy spending time with friends and family. You are energetic and outgoing, seeking excitement and social interaction.";
    } else {
      return "You adapt to situations and can enjoy both social interaction and solitude. You might be open-minded and flexible, comfortable with different scenarios.";
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


/*
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
        }
      ]
    },
*/