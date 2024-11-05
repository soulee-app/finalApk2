import 'package:flutter/material.dart';
import 'package:navbar/profile_screen/widgets/custome_small_text.dart';
import 'package:navbar/profile_screen/widgets/feed_image.dart';
import 'package:navbar/profile_screen/widgets/life_mirror_widget.dart';
import 'package:navbar/profile_screen/widgets/small_widget_mask_image.dart';

import '../widgest/heading_text.dart';
import 'model/affliations.dart';



class SecondSlideScreen extends StatelessWidget {
  const SecondSlideScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> sampleList = [
      'https://media.istockphoto.com/id/623686024/photo/retro-vintage-clock-at-2-oclock.jpg?s=612x612&w=0&k=20&c=SXzikVZX2AJcpzfOSgc-EUpbRqQfeJcG8oW6GkegLnI=',
      'https://images.twinkl.co.uk/tw1n/image/private/t_630/u/ux/lever-1_ver_1.jpg',
      'https://images.twinkl.co.uk/tw1n/image/private/t_630/u/ux/lever-3_ver_1.jpg'
    ];

    List<AffiliationData> affiliations = [
      AffiliationData(
        text1: 'Text 1',
        text2: 'Description',
        image: 'assets/Souls(1).png',
        isNetworkImage: false,
      ),
      AffiliationData(
        text1: 'Text 2',
        text2: 'Description',
        image: 'https://gratisography.com/wp-content/uploads/2024/01/gratisography-cyber-kitty-800x525.jpg',
        isNetworkImage: true,
      ),
      AffiliationData(
        text1: 'Text 1',
        text2: 'Description',
        image: 'https://img.freepik.com/premium-photo/stylish-man-flat-vector-profile-picture-ai-generated_606187-310.jpg',
        isNetworkImage: true,
      ),
      AffiliationData(
        text1: 'Text 2',
        text2: 'Description',
        image: 'https://gratisography.com/wp-content/uploads/2024/10/gratisography-cool-cat-800x525.jpg',
        isNetworkImage: true,
      ),

    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: HeadingText(text: 'MEMORIES',),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sampleList.length,
                      itemBuilder: (context, index) {
                        final imageUrl = sampleList[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomSmallText(text: 'text'),
                                      SizedBox(width: 5),
                                      CustomSmallText(text: 'text'),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: SmallWidgetMaskImage(image: 'assets/Souls.png', isNetworkImage: false),
                                      ),
                                      SizedBox(width: 5),
                                      CustomSmallText(text: 'textABCD'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
                color: Colors.white,
                style: IconButton.styleFrom(
                  iconSize: 25,
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingText(text: 'ZONES',),
                HeadingText(text: 'MORE',),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 10,
                childAspectRatio: 2.2,
              ),
              itemCount: affiliations.length,
              itemBuilder: (context, index) {
                final data = affiliations[index];
                return LifeMirrorWidget(
                  image: data.image,
                  isNetworkImage: data.isNetworkImage,
                );
              },
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          ),
          const SizedBox(height: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeadingText(text: "FEED", fontSize: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: InstagramSearchGrid(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
