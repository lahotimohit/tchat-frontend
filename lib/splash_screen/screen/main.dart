import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:tchat_frontend/splash_screen/widgets/splash_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: FlutterCarouselOptions(
        height: double.infinity,
        viewportFraction: 1.0,
        showIndicator: true,
        slideIndicator: CircularSlideIndicator(),
      ),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
                MainSplashWidget(i: i)
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
