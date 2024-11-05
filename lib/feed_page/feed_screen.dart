// feed_screen.dart
import 'package:flutter/material.dart';
import 'component/feed_card.dart';

class FeedScreen extends StatelessWidget {
  final List<Map<String, dynamic>> feedItems = [
    {
      'imagePath': 'assets/Cover.png',
      'title': 'সংগঠন ছাত্রলীগকে নিষিদ্ধ করেছে সরকার। বুধবার',
      'source': 'JAMUNA TV',
      'time': '5M',
      'comments': '101',
      'likes': '58',
      'pending': 'PENDING',
      'aspectRatio': 16 / 9,
      'isVideo': false,
      'videoUrl': '',
    },
    {
      'imagePath': '',
      'title': 'Sample Video Post',
      'source': 'Some Source',
      'time': '10M',
      'comments': '20',
      'likes': '15',
      'pending': 'PENDING',
      'aspectRatio': 16 / 9,
      'isVideo': true,
      'videoUrl': 'assets/a.mp4',
    },
    {
      'imagePath': 'assets/Cover.png',
      'title': 'সংগঠন ছাত্রলীগকে নিষিদ্ধ করেছে সরকার। বুধবার',
      'source': 'JAMUNA TV',
      'time': '5M',
      'comments': '101',
      'likes': '58',
      'pending': 'PENDING',
      'aspectRatio': 3 / 2,
      'isVideo': false,
      'videoUrl': '',
    },
    {
      'imagePath': 'assets/Cover.png',
      'title': 'সংগঠন ছাত্রলীগকে নিষিদ্ধ করেছে সরকার। বুধবার',
      'source': 'JAMUNA TV',
      'time': '5M',
      'comments': '101',
      'likes': '58',
      'pending': 'PENDING',
      'aspectRatio': 1 / 1,
      'isVideo': false,
      'videoUrl': '',
    },
  ];

  FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: feedItems.length,
        itemBuilder: (context, index) {
          final item = feedItems[index];
          return Column(
            children: [
              FeedCard(
                imagePath: item['imagePath'],
                title: item['title'],
                source: item['source'],
                time: item['time'],
                comments: item['comments'],
                likes: item['likes'],
                pending: item['pending'],
                aspectRatio: item['aspectRatio'],
                isVideo: item['isVideo'],
                videoUrl: item['videoUrl'],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 3,
              ), // Add grey divider here
            ],
          );
        },
      ),
    );
  }
}
