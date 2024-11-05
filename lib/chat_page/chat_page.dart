import 'package:flutter/material.dart';
import 'package:navbar/profile_screen/widgets/custome_small_text.dart';
import '../profile_screen/widgets/custom_mask_widget.dart';
import '../profile_screen/widgets/heading_text.dart';
import 'chat_detail_page/chat_detail_page.dart';
import 'component/chat_text.dart';
import 'component/custom_icon_button.dart';
import 'component/custome_dot.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  // Method to build individual chat tiles
  Widget buildChatTile(
      BuildContext context, {
        required String title,
        required String subtitle,
        required String trailingText,
        required Color dotColor,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Material(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 70,
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(title: title),
                ),
              );
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            leading: const CustomMaskWidget(
                image: 'assets/img.png', height: 50, width: 50),
            title: Row(
              children: [
                Flexible(
                  child: HeadingText(
                    text: title,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                CustomDot(color: dotColor),
                const SizedBox(width: 5),
                const CustomIconButton(imagePath: 'assets/flowers/Rui.png'),
                const SizedBox(width: 5),
                const CustomIconButton(imagePath: 'assets/flowers/Poddo.png'),
              ],
            ),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: ChatText(
                    text: subtitle,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.check, color: Colors.white),
                const SizedBox(width: 5),
                Image.asset(
                  'assets/knot/Knot.png',
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                const HeadingText(
                  text: '55%',
                  textStyle: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
            trailing: Container(
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/Cover.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: CustomSmallText(
                  text: trailingText,
                  backgroundColor: Colors.grey.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildChatTile(
                  context,
                  title: 'Tanbir',
                  subtitle: 'Hey, How are you?',
                  trailingText: 'See More',
                  dotColor: Colors.redAccent,
                ),
                buildChatTile(
                  context,
                  title: 'Tanbir',
                  subtitle: 'Hello!',
                  trailingText: 'More Info',
                  dotColor: Colors.white,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
