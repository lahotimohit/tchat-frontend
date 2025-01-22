import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchat_frontend/api/login.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tchat_frontend/authentication/widgets/snackmessage.dart';
// import 'package:tchat_frontend/authentication/widgets/text_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tchat_frontend/authentication/validators/auth.dart';
// import 'package:country_picker/country_picker.dart';
// import 'package:tchat_frontend/home/screen/dashboard.dart';
import 'package:tchat_frontend/otp/screen/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _imageAnimation;
  late Animation<double> _welcomeTextAnimation;
  late Animation<double> _subtitleAnimation;
  late Animation<double> _emailFieldAnimation;
  late Animation<double> _phoneFieldAnimation;
  late Animation<double> _buttonAnimation;
  late Animation<double> _backButtonAnimation;
  final TextEditingController _emailController = TextEditingController();
  bool isLogin = false;
  String _countryCode = "";
  String _mobile = "";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );

    // Create staggered animations for each element
    _imageAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _backButtonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.6, curve: Curves.easeOut),
      ),
    );

    _welcomeTextAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.7, curve: Curves.easeOut),
      ),
    );

    _subtitleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
      ),
    );

    _emailFieldAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 0.9, curve: Curves.easeOut),
      ),
    );

    _phoneFieldAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    _buttonAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );

    // Start the animation after a short delay
    Future.delayed(const Duration(milliseconds: 200), () {
      _animationController.forward();
    });
  }

  void _onLogin(BuildContext context) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const OtpScreen()));
    // final String email = _emailController.text.trim();
    // final String code = _countryCode;
    // final String phone = _mobile;

    // AuthValidation auth = AuthValidation(email, phone, code);
    // final String response = auth.validation();

    // var connectivityResult = await Connectivity().checkConnectivity();
    // if (connectivityResult[0] == ConnectivityResult.none) {
    //   snackmessage(context, "Please check your internet connection");
    //   return;
    // } else if (response == "Success") {
    //   setState(() {
    //     isLogin = true;
    //   });
    //   showCupertinoDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => const Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );

    //   try {
    //     print("codeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee: ${code}");
    //     LoginAPI api = LoginAPI();
    //     final Map<String, dynamic> result =
    //         await api.dioLogin(email, code, phone);
    //     setState(() {
    //       isLogin = false;
    //     });
    //     Navigator.of(context).pop();

    //     if (result['code'] == 401) {
    //       snackmessage(context, result['error']);
    //     } else {
    //       snackmessage(context, result['msg']);
    //       Navigator.of(context)
    //           .push(MaterialPageRoute(builder: (ctx) => const OtpScreen()));
    //     }
    //   } catch (e) {
    //     setState(() {
    //       isLogin = false;
    //     });
    //     snackmessage(context, "Internal Server Error");
    //   }
    // } else {
    //   snackmessage(context, response);
    //   return;
    // }
  }

  @override
  void dispose() {
    // Make sure animations complete before disposing
    if (_animationController.status == AnimationStatus.forward ||
        _animationController.status == AnimationStatus.reverse) {
      _animationController.stop();
    }
    _animationController.dispose();
    super.dispose();
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       appBar: AppBar(),
  //       body: SingleChildScrollView(
  //         child: Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Center(
  //                   child: Image.asset("assets/images/logo.png",
  //                       width: 250, height: 250)),
  //               Text(
  //                 "Sign In",
  //                 style: TextStyle(
  //                     color: Theme.of(context).colorScheme.primary,
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold),
  //               ),
  //               const SizedBox(
  //                 height: 30,
  //               ),
  //               TextFieldWidget(
  //                   controller: _emailController,
  //                   labelText: "Enter Your Email",
  //                   obscureText: false),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   GestureDetector(
  //                       onTap: _showCountryPicker, // Show dialog on tap
  //                       child: Container(
  //                           padding: const EdgeInsets.symmetric(
  //                               horizontal: 8, vertical: 12),
  //                           decoration: BoxDecoration(
  //                             border: Border.all(color: Colors.grey),
  //                             borderRadius: BorderRadius.circular(5),
  //                           ),
  //                           child: Row(children: [
  //                             Text(
  //                               _selectedCountryFlag,
  //                               style: TextStyle(fontSize: 18),
  //                             ),
  //                             const SizedBox(width: 5),
  //                             Text(
  //                               _countryCodeController.text,
  //                               style: TextStyle(fontSize: 16),
  //                             ),
  //                           ]))),
  //                   // SizedBox(
  //                   //   width: MediaQuery.of(context).size.width * 0.25,
  //                   //   child: TextFieldWidget(
  //                   //       controller: _countryCodeController,
  //                   //       labelText: "Code",
  //                   //       obscureText: false),
  //                   // ),
  //                   const SizedBox(
  //                     width: 10,
  //                   ),
  //                   SizedBox(
  //                     width: MediaQuery.of(context).size.width * 0.63,
  //                     child: TextFieldWidget(
  //                         controller: _mobileController,
  //                         labelText: "Mobile Number",
  //                         obscureText: false),
  //                   )
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               Center(
  //                 child: SizedBox(
  //                   width: 250,
  //                   child: ElevatedButton(
  //                       onPressed: () {
  //                         _onLogin(context);
  //                       },
  //                       style: ElevatedButton.styleFrom(
  //                           backgroundColor:
  //                               Theme.of(context).colorScheme.primary,
  //                           foregroundColor:
  //                               Theme.of(context).colorScheme.surface),
  //                       child: const Text("Log In")),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ));
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  FadeTransition(
                    opacity: _imageAnimation,
                    child: Hero(
                      tag: 'background_image',
                      child: Image.asset(
                        'assets/images/auth_screen/2.png',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 8,
                    child: FadeTransition(
                      opacity: _backButtonAnimation,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _animationController.reverse().then((_) {
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FadeTransition(
                      opacity: _welcomeTextAnimation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.2),
                          end: Offset.zero,
                        ).animate(_welcomeTextAnimation),
                        child: Text(
                          'Welcome back!',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeTransition(
                      opacity: _subtitleAnimation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.2),
                          end: Offset.zero,
                        ).animate(_subtitleAnimation),
                        child: Text(
                          'Glad to see you, Again!',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),

                    // Email Field
                    const SizedBox(height: 32),
                    FadeTransition(
                      opacity: _emailFieldAnimation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.2),
                          end: Offset.zero,
                        ).animate(_emailFieldAnimation),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Phone Field with animation
                    FadeTransition(
                      opacity: _phoneFieldAnimation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.2),
                          end: Offset.zero,
                        ).animate(_phoneFieldAnimation),
                        child: IntlPhoneField(
                          decoration: InputDecoration(
                            hintText: 'Enter your mobile number',
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            _countryCode = phone.countryCode;
                            _mobile = phone.completeNumber;
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Login button with animation
                    FadeTransition(
                      opacity: _buttonAnimation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.2),
                          end: Offset.zero,
                        ).animate(_buttonAnimation),
                        child: ElevatedButton(
                          onPressed: () {
                            _onLogin(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
