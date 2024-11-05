// feed_card.dart
import 'package:flutter/material.dart';
import 'package:navbar/feed_page/comment_screen/chat_screen.dart';
import 'package:navbar/feed_page/component/feed_image_view.dart';
import '../../profile_screen/widgets/custom_mask_widget.dart';
import '../../profile_screen/widgets/custome_text.dart';
import '../../profile_screen/widgets/heading_text.dart';
import 'comment_button.dart';
// Import the custom video player

class FeedCard extends StatelessWidget {
  final String imagePath; // Path to the image or video
  final String title; // Title text
  final String source;
  final String time;
  final String comments;
  final String likes;
  final String pending;
  final double aspectRatio;
  final bool isVideo;
  final String videoUrl; // URL for the video

  const FeedCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.source,
    required this.time,
    required this.comments,
    required this.likes,
    required this.pending,
    required this.aspectRatio,
    this.isVideo = false,
    this.videoUrl = '', // Default to an empty string if not a video
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomMaskWidget(image: 'assets/Souls(1).png'),
                  Expanded(
                    child: HeadingText(
                      text: title,
                      textStyle: const TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomText(text: source, fontSize: 13),
                  const SizedBox(width: 5),
                  CustomText(text: time, fontSize: 13),
                  const SizedBox(width: 5),
                  SizedBox(
                    height: 34,
                    width: 34,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.people_outlined,
                        size: 20,
                      ),
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          padding: EdgeInsets.zero),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedImageView()));
          },
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: Material(
              color: Colors.blue,
              child: isVideo
                  ? const Text('data') // Use custom video player
                  : Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 10),
          child: Row(
            children: [
              CommentButton(
                  commentText: comments,
                  assetImagePath: 'assets/flowers/Rui.png'),
              const SizedBox(width: 5),
              CommentButton(
                commentText: likes,
                assetImagePath: 'assets/Icons/Comment.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommentScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(width: 5),
              const CommentButton(
                  commentText: 'Comming Soon',
                  iconData: Icons.currency_exchange_sharp),
              const Spacer(),
              const CommentButton(commentText: '8',assetImagePath: 'assets/Share.png',),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
      ],
    );
  }
}
