import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/trophy.png',
                width: 150,
              ),
              const SizedBox(height: 50),
              Text(
                'Hore !!! Nilai Kamu 100',
                style:
                    GoogleFonts.montserrat(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
