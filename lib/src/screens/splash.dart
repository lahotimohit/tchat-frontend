import 'package:flutter/material.dart';
import 'package:tchat_frontend/src/animations/pageroute.dart';
import 'package:tchat_frontend/src/providers/splash_providers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/src/screens/auth.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
                              CustomText(
                                alignment: Alignment.center,
                                align: TextAlign.center,
                                size: 28,
                                text: sliderData[index]["title"]!,
                                weight: FontWeight.bold,
                              ),
                              const SizedBox(height: 8),
                              CustomText(
                                alignment: Alignment.center,
                                text: sliderData[index]["subtitle"]!,
                                align: TextAlign.center,
                                size: 15,
                                weight: FontWeight.w300,
                                color: grey,
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
                      createRoute(const AuthScreen())
                      );
                },
                child: const CustomText(
                  alignment: Alignment.center,
                  size: 18,
                  text: "Skip",
                  weight: FontWeight.w600,
                )),
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
        color: index == currentPage ? black : grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
