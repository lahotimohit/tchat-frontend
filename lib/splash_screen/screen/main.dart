import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/authentication/screen/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Map<String, String>> sliderData = [
    {
      "image": "assets/images/splash_screen/1.svg",
      "title": "Unlock the Power\nOf TChat",
      "subtitle":
          "Communicate with your friends in a fast,\nreliable and secure way."
    },
    {
      "image": "assets/images/splash_screen/2.svg",
      "title": "Keep Your Chats Private",
      "subtitle":
          "Prevent another party from taking screenshots, keep it confidential."
    },
    {
      "image": "assets/images/splash_screen/3.svg",
      "title": "Become a Part of Our Community",
      "subtitle": "Your privacy is our priority with end-to-end encryption."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: sliderData.length,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;

                      if (_pageController.position.haveDimensions) {
                        value = (_pageController.page ?? 0) - index;
                        value = (1 - value.abs()).clamp(0.0, 1.0);
                      }

                      return Opacity(
                        opacity: value,
                        child: Transform.scale(
                          scale: value,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                sliderData[index]["image"]!,
                                height: 308,
                                width: 308,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                sliderData[index]["title"]!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                sliderData[index]["subtitle"]!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                sliderData.length,
                (index) => buildDot(index, _currentPage),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const AuthScreen()));
              },
              child: const Text(
                "Skip",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index, int currentPage) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: index == currentPage ? 20 : 10,
      decoration: BoxDecoration(
        color: index == currentPage ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
