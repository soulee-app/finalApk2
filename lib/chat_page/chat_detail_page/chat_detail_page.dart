import 'package:flutter/material.dart';
import 'package:navbar/chat_page/component/custome_dot.dart';

import '../../profile_screen/widgets/custom_mask_widget.dart';

class ChatDetailPage extends StatelessWidget {
  final String title;

  const ChatDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        toolbarHeight: screenHeight * 0.08,
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.05),
                child: CustomMaskWidget(
                  image: 'assets/Souls.png',
                  height: screenWidth * 0.15, // Adjusted for dynamic size
                  width: screenWidth * 0.15,  // Adjusted for dynamic size
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.01), // Dynamic spacing
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.01,
                            vertical: screenHeight * 0.005,
                          ),
                          child: Row(
                            children: [
                              CustomDot(color: Colors.red),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                'Arya Mridul',
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.005,
                            vertical: screenHeight * 0.003,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Chat Updated/Profile.png',
                                height: screenWidth * 0.06,
                                width: screenWidth * 0.06,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.01,
                            vertical: screenHeight * 0.003,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Chat Updated/Calender.png',
                                height: screenWidth * 0.06,
                                width: screenWidth * 0.06,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              Text(
                                '1DAY',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/Chat Updated/Warning.png',
                        height: screenWidth * 0.06,
                        width: screenWidth * 0.06,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Chat Updated/Call.png',
                                height: screenWidth * 0.06,
                                width: screenWidth * 0.06,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              Image.asset(
                                'assets/Chat Updated/Video.png',
                                height: screenWidth * 0.06,
                                width: screenWidth * 0.06,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Icons/Comment.png',
                                height: screenWidth * 0.06,
                                width: screenWidth * 0.06,
                              ),
                              Text('5'),
                              Image.asset(
                                'assets/Chat_Filled.png',
                                height: screenWidth * 0.06,
                                width: screenWidth * 0.06,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                          child: Row(
                            children: [
                              SizedBox(
                                width: screenWidth * 0.08,
                                height: screenWidth * 0.06,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/Cover.png'),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              SizedBox(
                                width: screenWidth * 0.2,
                                child: Text(
                                  'Name of the song',
                                  maxLines: 2,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    message: "Hey! How are you?",
                    isMe: false,
                    imageUrl:
                    'https://icons.veryicon.com/png/o/internet--web/web-interface-flat/6606-male-user.png',
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    message: "I'm good, thanks! How about you?",
                    isMe: true,
                    imageUrl:
                    'https://icons.veryicon.com/png/o/internet--web/web-interface-flat/6606-male-user.png',
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    message: "Just working on a project.",
                    isMe: false,
                    imageUrl:
                    'https://icons.veryicon.com/png/o/internet--web/web-interface-flat/6606-male-user.png',
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    message: "Sounds interesting!",
                    isMe: true,
                    imageUrl:
                    'https://icons.veryicon.com/png/o/internet--web/web-interface-flat/6606-male-user.png',
                  ),
                ),
              ],
            ),
          ),
          const MessageInputBar(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String imageUrl;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment:
        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isMe)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 20,
              ),
            ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            constraints: const BoxConstraints(maxWidth: 250),
            child: Text(
              message,
              style: TextStyle(color: isMe ? Colors.white : Colors.black),
            ),
          ),
          if (isMe)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: 20,
              ),
            ),
        ],
      ),
    );
  }
}

class MessageInputBar extends StatefulWidget {
  const MessageInputBar({super.key});

  @override
  _MessageInputBarState createState() => _MessageInputBarState();
}

class _MessageInputBarState extends State<MessageInputBar> {
  final TextEditingController _controller = TextEditingController();
  bool _showExtraOptions = false;
  bool _isExpanded = false;

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      print("Sending message: ${_controller.text}");
      _controller.clear();
    }
  }

  void _toggleExtraOptions() {
    setState(() {
      _showExtraOptions = !_showExtraOptions;
    });
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Dynamic sizing
    final iconSize = screenWidth * 0.10; // for 50px
    final smallIconSize = screenWidth * 0.1;
    final smalliconSize = screenWidth * 0.055; // for 45px
    // for 45px
    final padding = screenWidth * 0.01; // for 8px
    final containerHeight = screenHeight * 0.055; // for 50px height
    final borderRadius =
    BorderRadius.circular(screenWidth * 0.04); // for 30px radius

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_showExtraOptions) ...[
            Row(
              children: [
                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(iconSize / 2),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Image.asset(
                      'assets/Chat Updated/Fortune Teller.png',
                      height: iconSize,
                      width: iconSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: padding),
                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(iconSize / 2),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/Chat Updated/NSFW.png',
                          height: iconSize,
                          width: iconSize,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: padding),
                Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(iconSize / 2),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Image.asset(
                      'assets/Chat Updated/Settings.png',
                      height: iconSize,
                      width: iconSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(),
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(iconSize / 1),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/Soulee Texts/Themes.png',
                      height: iconSize,
                      width: iconSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: padding),
            Row(
              children: [
                Material(
                  color: Colors.white,
                  borderRadius: borderRadius,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/Chat Updated/Books.png',
                          height: iconSize,
                          width: iconSize,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/Chat Updated/Music.png',
                          height: iconSize,
                          width: iconSize,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/Chat Updated/Movies.png',
                          height: iconSize,
                          width: iconSize,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: padding),
                Material(
                  color: Colors.white,
                  borderRadius: borderRadius,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/Chat Updated/Quiz.png',
                          height: iconSize,
                          width: iconSize,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/Chat Updated/Game.png',
                          height: iconSize,
                          width: iconSize,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Material(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(iconSize / 1),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/Chat Updated/Emoji.png',
                      height: iconSize,
                      width: iconSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: padding),
          ],
          if (!_isExpanded)
            GestureDetector(
              onTap: _toggleExtraOptions,
              child: Material(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                child: Icon(Icons.more_vert,
                    size: smallIconSize, color: Colors.black54),
              ),
            ),
          Row(
            children: [
              if (!_isExpanded)
                Flexible(
                  flex: 1,
                  child: Material(
                    color: Colors.white,
                    borderRadius: borderRadius,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/Chat Updated/Voice.png',
                            height: iconSize,
                            width: iconSize,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/Chat Updated/Photos.png',
                            height: iconSize,
                            width: iconSize,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/Chat Updated/Attachments.png',
                            height: iconSize,
                            width: iconSize,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (_isExpanded)
                GestureDetector(
                  onTap: _toggleExpanded,
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(Icons.arrow_back_ios,
                          size: smalliconSize, color: Colors.black54),
                    ),
                  ),
                ),
              SizedBox(width: padding),
              Expanded(
                flex: _isExpanded ? 5 : 1,
                child: SizedBox(
                  height: containerHeight,
                  child: TextField(
                    controller: _controller,
                    onTap: () {
                      if (!_isExpanded) _toggleExpanded();
                    },
                    decoration: InputDecoration(
                      hintText: "Say Hi...",
                      border: OutlineInputBorder(
                        borderRadius: borderRadius,
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
              ),
              SizedBox(width: padding),
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(iconSize / 2),
                child: InkWell(
                  onTap: _sendMessage,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/Soulee Texts/Send.png',
                      height: iconSize,
                      width: iconSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
