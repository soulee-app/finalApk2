import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:navbar/all_profile_screen/profile_screen/postpage.dart';
import 'package:navbar/all_profile_screen/profile_screen/sceond_slid_screen.dart';
import 'package:navbar/all_profile_screen/profile_screen/widgets/custom_appbar.dart';
import 'package:navbar/all_profile_screen/profile_screen/widgets/custom_text_button.dart';
import 'package:widget_mask/widget_mask.dart';
import '../../widgest/custom_text.dart';
import 'first_slide_screen.dart';
import 'add_memory_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final PageController _profilePageController = PageController();
  final PageController _contentPageController = PageController();
  double _currentProfilePage = 0;
  double _currentContentPage = 0;

  @override
  void dispose() {
    _profilePageController.dispose();
    _contentPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            height: screenHeight * 0.35,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Cover.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.03,
            left: 0,
            right: 0,
            child: const CustomAppbar(),
          ),
          Positioned(
            top: screenHeight * 0.27,
            child: Column(
              children: [
                SizedBox(
                  height: screenWidth * 0.32,
                  width: screenWidth * 0.32,
                  child: PageView(
                    controller: _profilePageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentProfilePage = index.toDouble();
                      });
                    },
                    children: [
                      WidgetMask(
                        childSaveLayer: true,
                        blendMode: BlendMode.srcATop,
                        mask: Image.asset(
                          'assets/img.png',
                          fit: BoxFit.contain,
                        ),
                        child: Image.asset(
                          'assets/Deformed Circle.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      WidgetMask(
                        childSaveLayer: true,
                        blendMode: BlendMode.srcATop,
                        mask: Image.asset(
                          'assets/Souls(1).png',
                          fit: BoxFit.contain,
                        ),
                        child: Image.asset(
                          'assets/Deformed Circle.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                DotsIndicator(
                  dotsCount: 2,
                  position: _currentProfilePage,
                  decorator: DotsDecorator(
                    shape: const CircleBorder(),
                    size: Size(screenWidth * 0.03, screenWidth * 0.03),
                    activeSize: Size(screenWidth * 0.03, screenWidth * 0.03),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    color: Colors.grey,
                    activeColor: const Color(0xFFFF675C),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.33,
            left: screenWidth * 0.32,
            child: Row(
              children: [
                const CustomText(text: 'Tanbir Hossain',icon: Icons.person,),
                SizedBox(width: screenWidth * 0.01),
                const CustomText(text: '24',icon: Icons.cake,),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.38,
            left: screenWidth * 0.27,
            child: Row(
              children: [
                const CustomText(text: 'Fur parcent',icon: Icons.pets,),
                SizedBox(width: screenWidth * 0.01),
                const CustomText(text: 'Female',icon: Icons.female,),
                SizedBox(width: screenWidth * 0.01),
                const CustomText(text: 'June 4',icon: Icons.calendar_month,),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.45,
            left: screenWidth * 0.24,
            child: Row(
              children: [
                CustomTextButton(
                  text: 'Post',
                  icon: Icons.upload,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PostPage()),
                    );
                  },
                ),
                SizedBox(width: screenWidth * 0.02),
                CustomTextButton(
                  text: 'Add A Memory',
                  icon: Icons.image,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddMemoryPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                DotsIndicator(
                  dotsCount: 2,
                  position: _currentContentPage,
                  decorator: DotsDecorator(
                    size: Size.square(screenWidth * 0.03),
                    activeSize: Size(screenWidth * 0.03, screenWidth * 0.03),
                    activeColor: const Color(0xFFFF675C),
                    color: Colors.grey,
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.47,
                  width: screenWidth,
                  child: PageView(
                    controller: _contentPageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentContentPage = index.toDouble();
                      });
                    },
                    children: const [
                      FirstSlideScreen(),
                      SecondSlideScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
