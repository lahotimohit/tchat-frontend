import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:tchat_frontend/authentication/main.dart';
import 'package:tchat_frontend/authentication/screen/signup.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final Widget animationLottie = ClipOval(
    child: Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white, // Optional: background color for contrast
      ),
      child: Lottie.network(
        "https://lottie.host/5fce4540-030f-43f1-804a-6aa9ad3c9950/QMT3WC50rM.json",
        repeat: true,
        reverse: true,
        animate: true,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
  options: FlutterCarouselOptions(
    height: double.infinity,
    viewportFraction: 1.0,
    showIndicator: true,
    slideIndicator: CircularSlideIndicator(
    ),
  ),
  items: [1,2,3].map((i) {
    if(i==3) {
      
    }
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 100,),
                animationLottie,
                const SizedBox(height: 50,),
                Text("GET NOTIFIED",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )),
                const SizedBox(height: 20,),
                Text("Communicate with your friend in fast and reliable way.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color:Colors.white,
                  fontSize: 14,
                ),),
                if(i==3) ...[
                  const SizedBox(height: 40,),
                  OutlinedButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const AuthScreen()));
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                  ),
                  child: const Text("Continue",
                  style: TextStyle(color: Colors.white),),
                  )
                ]
              ],
            ),
          )
        );
      },
    );
  }).toList(),
);
  }
}