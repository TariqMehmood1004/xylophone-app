import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/screens/entryPoint/entry_point.dart';

import 'components/animated_btn.dart';

class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  late RiveAnimationController _btnAnimationController;

  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/Backgrounds/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: const [
                          Text(
                            "Notio \nXylophone App",
                            style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "The xylophone is a musical instrument in the percussion family that consists of wooden bars struck by mallets. Like the glockenspiel, the xylophone essentially consists of a set of tuned wooden keys arranged in the fashion of the keyboard of a piano.",
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedBtn(
                          title: "Create a Custom",
                          btnAnimationController: _btnAnimationController,
                          press: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EntryPoint()));
                            _btnAnimationController.isActive = true;

                            // Future.delayed(
                            //   const Duration(milliseconds: 800),
                            //   () {
                            //     setState(() {
                            //       isShowSignInDialog = true;
                            //     });
                            //     showCustomDialog(
                            //       context,
                            //       onValue: (_) {
                            //         setState(() {
                            //           isShowSignInDialog = false;
                            //         });
                            //       },
                            //     );
                            //   },
                            // );
                          },
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
