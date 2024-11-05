import 'package:flutter/material.dart';

class MatchedPage extends StatelessWidget {
  const MatchedPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  Image.asset('assets/knot/soulee.png', height: 60),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: const Text(
                            "KNOTS",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset('assets/knot/Knot.png', height: 30),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 150,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: const Text(
                            "CONNECTIONS",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                // Soul 1 Avatar (Top)
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/knot/souls 1.png'),
                  ),
                ),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Column(
                      children: [
                        buildStaticQuizOption(
                            'assets/knot/n1.png', screenWidth),
                        buildStaticQuizOption(
                            'assets/knot/n2.png', screenWidth),
                        buildStaticQuizOption(
                            'assets/knot/n3.png', screenWidth),
                        buildStaticQuizOption(
                            'assets/knot/n4.png', screenWidth),
                      ],
                    ),
                    Positioned(
                      right: 10,
                      top: 70,
                      child: Container(
                        color: Colors.yellow,
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "MATCHED 80%",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Soul 2 Avatar (Bottom)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/knot/souls 2.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.yellow,
                        child: const Text(
                          "ARYA MRIDUL",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.yellow,
                        child: const Text(
                          "26",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent),
                        child: const Column(
                          children: [
                            Text("TEXT"),
                            SizedBox(height: 5),
                            Text(
                              "04:59",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent),
                        child: const Text("KNOT REPORT"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStaticQuizOption(String imagePath, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Opacity(
        opacity: 0.4,
        child: Image.asset(
          imagePath,
          width: screenWidth,
          height: 80,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
