import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_flutter/pages/home_page.dart';

class ResultPage extends StatefulWidget {
  final int result;
  ResultPage({required this.result, Key? key}) : super(key: key);

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
                'Hore !!! Nilai Kamu ' + widget.result.toString(),
                style:
                    GoogleFonts.montserrat(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
                  },
                  icon: Icon(Icons.backspace),
                  label: Text('Back'))
            ],
          ),
        ),
      ),
    );
  }
}
