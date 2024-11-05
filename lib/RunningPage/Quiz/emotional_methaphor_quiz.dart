import 'package:flutter/material.dart';

class EmotionalMethaphorQuiz extends StatefulWidget {
  const EmotionalMethaphorQuiz({super.key});

  @override
  State<EmotionalMethaphorQuiz> createState() => _EmotionalMethaphorQuizState();
}

class _EmotionalMethaphorQuizState extends State<EmotionalMethaphorQuiz> {
  int result1 = 0;
  int result2 = 0;
  int result3 = 0;
  int currentQuestion = 0;

  final List<Map<String, Object>> questions = [
    //1
    {
      'question':
          'When you can sense that the other person is upset with something but isn\'t taking the initiative to tell you why, what do you usually do?',
      'answers': [
        {
          'text': 'Wait for them to bring it up when they feel ready',
          'result': 2
        },
        {'text': 'Ask them gently if anything\'s bothering them', 'result': 1},
        {'text': 'Get frustrated and demand to know what\'s wrong', 'result': 3}
      ]
    },
    //2
    {
      'question':
          'When someone shares their thoughts bout something, whether it\'s bout their day at work or a song they liked. What do you like to do typically?',
      'answers': [
        {'text': 'Listen to them, give nods or a generic answer', 'result': 2},
        {
          'text': 'Participate in the conversation with thoughtful comments',
          'result': 1
        },
        {
          'text': 'Wait for your turn to talk about your own experience',
          'result': 3
        }
      ]
    },
    //3
    {
      'question':
          'How do you feel about your loved one setting up some boundaries in the relationship you two share?',
      'answers': [
        {
          'text':
              'Every Individual can have their own set of personal boundaries and if I care for them i would respect the boundaries.',
          'result': 1
        },
        {
          'text':
              'When two people become close enough, such stuff as "boundaries" shouldn\'t be a thing to worry about.',
          'result': 3
        },
        {
          'text':
              'first I would try to define if the boundaries are logical enough to me. If they are i don\'t mind respecting it cause I care for them. ',
          'result': 2
        }
      ]
    },
    //4
    {
      'question': 'If they bring up a past mistake of you, how do you react?',
      'answers': [
        {
          'text':
              'Get a bit defensive and try not to take the conversation further',
          'result': 2
        },
        {
          'text': 'Acknowledge their feelings and discuss the issue ',
          'result': 1
        },
        {'text': 'Remind them of their own mistakes instead', 'result': 3}
      ]
    },
    //5
    {
      'question':
          'when you are very stressed how do you usually react towards others',
      'answers': [
        {
          'text':
              'Taking out on them without realising but feeling guilty later ',
          'result': 3
        },
        {'text': 'Try to remain calm and composed ', 'result': 1},
        {'text': 'Distance yourself to avoid interaction', 'result': 2}
      ]
    },
    //6
    {
      'question':
          'if someone cancels their plans with you at the very last minute how do you feel about it?',
      'answers': [
        {
          'text': 'Feel bad but understand that they may have a reason ',
          'result': 1
        },
        {
          'text': 'Hold grudge and stop responding to their texts ',
          'result': 2
        },
        {
          'text':
              'Think of doing the same to them in future to make it equal equal',
          'result': 3
        }
      ]
    },
    //7
    {
      'question':
          'How do you feel when your loved one expresses their needs and expectations from you?',
      'answers': [
        {'text': 'Overwhelmed I guess', 'result': 2},
        {'text': 'Open to hearing them and adjust if needed ', 'result': 1},
        {
          'text': 'Nah I prefer to stick to my own ways of doing things',
          'result': 3
        }
      ]
    },
    //8
    {
      'question': 'How do you handle conflict with your loved ones?',
      'answers': [
        {
          'text':
              'I calmly express my feelings and seek a resolution together.',
          'result': 1
        },
        {
          'text':
              'I argue my point anyhow possible and hope my partner understands.',
          'result': 2
        },
        {
          'text': 'I try to avoid the conflict or change the subject.',
          'result': 3
        }
      ]
    },
    //9
    {
      'question': 'How do you react when your partner criticizes you?',
      'answers': [
        {
          'text':
              ' I take time to reflect on their feedback and consider it thoughtfully.',
          'result': 1
        },
        {
          'text': ' I get defensive and explain why they are wrong.',
          'result': 3
        },
        {
          'text': ' I shut down and feel hurt without responding much.',
          'result': 2
        }
      ]
    },
    //10
    {
      'question':
          'How do you approach difficult conversations in your relationship?',
      'answers': [
        {
          'text':
              'I initiate them thoughtfully and focus on mutual understanding.',
          'result': 1
        },
        {
          'text':
              'I approach them with a sense of urgency to resolve issues quickly.',
          'result': 2
        },
        {
          'text': 'I avoid them for as long as possible to prevent conflict.',
          'result': 3
        }
      ]
    },
    {
      'question':
          'How do you deal with jealousy or insecurity in the relationship?',
      'answers': [
        {
          'text':
              'I communicate my feelings openly and try to understand the root cause.',
          'result': 1
        },
        {
          'text': 'I feel jealous but keep it to myself most of the time.',
          'result': 2
        },
        {
          'text': 'I avoid the conversation and let the feelings simmer.',
          'result': 3
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
      return " Looks like you are highly in tune with your emotions and have enough emotional capabilities to support someone and be there for them!";
    } else if (result2 > result1 && result2 >= result3) {
      return "You have a decent grasp of emotional intelligence but sometimes struggle with deeper emotional understanding or handling difficult situations. There may be room for improvement!";
    } else {
      return "You might have difficulty recognizing or managing emotions, both your own and your partner’s! Trying to develop more emotional awareness might help you in bringing stability in the relationship.";
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
