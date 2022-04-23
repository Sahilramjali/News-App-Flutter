import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 5), () => route());
    setState(() {});
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((_) => const Homepage())));
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Color(0xff265999),
                ]),
            image: DecorationImage(
              image: AssetImage("assets/frame.png"),
              fit: BoxFit.fill,
            )),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Image(
                image: AssetImage("assets/splash.png"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "We show news for you",
                style: TextStyle(
                    color: Color(0xffb67929),
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                timer.cancel();
                route();
              },
              style: ElevatedButton.styleFrom(primary: const Color(0xffD5AD36)),
              child: const Text(
                "Skip",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white38),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
