import 'package:flutter/material.dart';
import 'package:navbar/RunningPage/Quiz/about_me_quiz.dart';
import 'package:navbar/RunningPage/Quiz/emotional_methaphor_quiz.dart';
import 'package:navbar/RunningPage/Quiz/hopeless_romance_quiz.dart';
import 'package:navbar/RunningPage/Quiz/mental_stage_quiz.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 15),
        children: [
          buildNavButton(
            context,
            title: '',
            imagePath: 'assets/n1.png',
            navigateTo: const AboutMeQuiz(),
            isRoundedLeft: false,
          ),
          buildNavButton(
            context,
            title: '',
            imagePath: 'assets/n2.png',
            navigateTo: const MentalStageQuiz(),
            isRoundedLeft: true,
          ),
          buildNavButton(
            context,
            title: '',
            imagePath: 'assets/n3.png',
            navigateTo: const HopelessRomanceQuiz(),
            isRoundedLeft: false,
          ),
          buildNavButton(
            context,
            title: '',
            imagePath: 'assets/n4.png',
            navigateTo: const EmotionalMethaphorQuiz(),
            isRoundedLeft: true,
          ),
          buildNavButton(
            context,
            title: '',
            imagePath: 'assets/n5.png',
            navigateTo: const EmotionalMethaphorQuiz(),
            isRoundedLeft: false,
          ),
          buildNavButton(
            context,
            title: '',
            imagePath: 'assets/06.png',
            navigateTo: const EmotionalMethaphorQuiz(),
            isRoundedLeft: false,
          ),
          buildNavButton(
            context,
            title: '',
            imagePath: 'assets/07.png',
            navigateTo: const EmotionalMethaphorQuiz(),
            isRoundedLeft: false,
          ),
          buildNavButton(
            context,
            title: '',
            imagePath: 'assets/08.png',
            navigateTo: const EmotionalMethaphorQuiz(),
            isRoundedLeft: false,
          ),
          buildNavButton(
            context,
            title: '',
            imagePath: 'assets/09.png',
            navigateTo: const EmotionalMethaphorQuiz(),
            isRoundedLeft: false,
          ),
          buildNavButton(
            context,
            title: '',
            imagePath: 'assets/10.png',
            navigateTo: const EmotionalMethaphorQuiz(),
            isRoundedLeft: false,
          ),
          buildNavButton(
            context,
            title: '',
            imagePath: 'assets/11.png',
            navigateTo: const EmotionalMethaphorQuiz(),
            isRoundedLeft: false,
          ),
          buildNavButton(
            context,
            title: '',
            imagePath: 'assets/12.png',
            navigateTo: const EmotionalMethaphorQuiz(),
            isRoundedLeft: false,
          ),
        ],
      ),
    );
  }

  Widget buildNavButton(BuildContext context,
      {required String title,
      required String imagePath,
      required Widget navigateTo,
      required bool isRoundedLeft}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigateTo),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 0),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: isRoundedLeft
              ? const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(2, 2),
                  blurRadius: 5,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
