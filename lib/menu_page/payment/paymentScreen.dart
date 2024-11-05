import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:navbar/menu_page/payment/mobile_banking_page.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isChecked = false;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<String> _backgroundImages = [
    'assets/payment/60tk/BG.png',
    'assets/payment/110tk/BG110.png',
    'assets/payment/150tk/BG.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_backgroundImages[_currentPage]),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 75,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/payment/60tk/Price.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 290,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/payment/60tk/Group 8.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/payment/60tk/Group 7.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 430,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/payment/60tk/Group 6.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 500,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/payment/60tk/Group 5.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 570,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/payment/60tk/Group 4.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned(
                        top: 75,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/payment/110tk/Price 110.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 290,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/payment/110tk/12.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/payment/110tk/13.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 430,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/payment/110tk/14.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 500,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/payment/110tk/15.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned(
                        top: 75,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/payment/150tk/Price.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 290,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/payment/150tk/17.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 360,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/payment/150tk/18.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 430,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/payment/150tk/19.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 500,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/payment/150tk/20.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 570,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/payment/150tk/21.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  height: 8.0,
                  width: _currentPage == index ? 12.0 : 8.0,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index ? Colors.redAccent : Colors.grey,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'TERMS AND CONDITIONS: LOREM IPSUM...',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 10,
                      ),
                      onPressed: isChecked
                          ? () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MobileBankingPage()));
                            }
                          : null,
                      child: const Text(
                        'SUBSCRIBE NOW',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
