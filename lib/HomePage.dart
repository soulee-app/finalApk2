import 'package:flutter/material.dart';
import 'package:navbar/Feed/dotIndicator.dart';
import 'package:navbar/Notification/NotificationScreen.dart';
import 'package:navbar/RunningPage/runningPage.dart';
import 'package:navbar/chat_page/chat_page.dart';
import 'package:navbar/knot/knotMatching.dart';
import 'package:navbar/menu_page/menu_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const RunningPage(),
    const NotificationScreen(),
    const KnotMatchingPage(),
    const DotIndicatorPage(),
    const ChatPage(),
    const MenuScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            top: 160,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _pages[_selectedIndex],
            ),
          ),
          Column(
            children: [
              AppBar(
                title: Image.asset(
                  'assets/Logo.png',
                  height: 80,
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                actions: [
                  IconButton(
                    icon: Image.asset('assets/Post.png'),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset('assets/Search.png'),
                    onPressed: () {},
                  ),
                ],
              ),
              Container(
                height: 80,
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: IconButton(
                        icon: Image.asset(
                          _selectedIndex == 0
                              ? 'assets/Activity_Filled.png'
                              : 'assets/Activity.png',
                          height: 50,
                        ),
                        onPressed: () => _onItemTapped(0),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Image.asset(
                          _selectedIndex == 1
                              ? 'assets/Notification_Filled.png'
                              : 'assets/Notification.png',
                          height: 60,
                        ),
                        onPressed: () => _onItemTapped(1),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Image.asset(
                          _selectedIndex == 2
                              ? 'assets/Knot_Filled.png'
                              : 'assets/Knot.png',
                          height: 70,
                        ),
                        onPressed: () => _onItemTapped(2),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Image.asset(
                          _selectedIndex == 3
                              ? 'assets/Feed_Filled.png'
                              : 'assets/Feed.png',
                          height: 50,
                        ),
                        onPressed: () => _onItemTapped(3),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Image.asset(
                          _selectedIndex == 4
                              ? 'assets/Chat_Filled.png'
                              : 'assets/Chat.png',
                          height: 50,
                        ),
                        onPressed: () => _onItemTapped(4),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Image.asset(
                          _selectedIndex == 5
                              ? 'assets/Menu_Filled.png'
                              : 'assets/Menu.png',
                          height: 50,
                        ),
                        onPressed: () => _onItemTapped(5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
