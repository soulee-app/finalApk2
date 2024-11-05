import 'package:flutter/material.dart';
import 'package:navbar/feed_page/comment_screen/component/comment_section.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  bool _isCommentsExpanded = false;

  // Sample comments list
  final List<String> comments = [
    "This is a great post!",
    "I totally agree with you!",
    "Amazing content, keep it up!",
    "Very informative, thanks for sharing!",
    "Love this post, can't wait for more!",
    "Interesting perspective!",
  ];

  void _toggleComments() {
    setState(() {
      _isCommentsExpanded = !_isCommentsExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              
              Row(
                children: [
                  Image.asset('assets/flowers/Shapla 1.png',height: 30,width: 30,),
                  Image.asset('assets/flowers/Orchid.png',height: 30,width: 30,),
                  Image.asset('assets/flowers/Golap 2.png',height: 30,width: 30,),
                  Icon(Icons.arrow_forward_ios,size: 20,),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up_off_alt_rounded,size: 20,))
                ],
              ),
              // Always visible single comment
              const CommentSection(),

              if (_isCommentsExpanded)
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    itemCount: 10, // Excluding the first comment
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: CommentSection(),
                      );
                    },
                  ),
                ),

              // Show/Hide Comments Button
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(0),
                color: Colors.grey.withOpacity(0.05),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/flowers/Rui.png',height: 30,width: 30,),
                          SizedBox(
                            height: 25,
                            child: VerticalDivider(
                              color: Colors.black,
                            ),
                          ),
                          Image.asset('assets/flowers/Surjo Mukhi.png',height: 30,width: 30,),
                          SizedBox(
                            height: 25,
                            child: VerticalDivider(
                              color: Colors.black,
                            ),
                          ),
                          Image.asset('assets/flowers/Ful.png',height: 30,width: 30,),

                        ],
                      ),
                      Icon(Icons.more_vert),

                      Spacer(),
                      SizedBox(
                        width: 80,
                        child: ElevatedButton(
                          onPressed: _toggleComments,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/Comment.png',height: 35,width: 35,color: Colors.white,),
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Text(
                                  _isCommentsExpanded ? 'Hide' : ' (35)',
                                  style: const TextStyle(fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomCommentInput(),
    );
  }

  Widget _buildBottomCommentInput() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.photo_camera, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
