import 'package:flutter/material.dart';
import 'package:resep_sedep/screens/nav.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screen * 1,
              height: screen * 1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Onboarding.png'),
                      fit: BoxFit.cover)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Resep Sedep adalah solusi tepat bagi para penikmat hidangan sedap",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey, fontFamily: 'Poppins', fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: screen * 0.8,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF72A4AE),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    elevation: 10),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const Navbar(intialIndex: 0)),
                      (route) => false);
                },
                child: const Text(
                  "Mulai Masak",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
