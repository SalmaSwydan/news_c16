import 'package:flutter/material.dart';
import '../../core/resources/app_const/app_assest.dart';
import '../home/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: size.height * 0.32,
            child: Image.asset(
              AppAssets.news_logo,
              width: size.width * 0.8,
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            bottom: 60,
            child: Column(
              children: [
                Image.asset(
                  AppAssets.news_branding,
                  width: size.width * 0.45,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 10),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
