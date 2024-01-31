import 'package:flutter/material.dart';
import 'package:resep_sedep/screens/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5)).then(
      (value) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Onboarding()),
            (route) => false);
      },
    );

    double screen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: screen * 0.9,
          height: screen * 0.9,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Logo.png'),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
