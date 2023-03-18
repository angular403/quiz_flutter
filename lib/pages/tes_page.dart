import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TesPage extends StatefulWidget {
  TesPage({Key? key}) : super(key: key);

  @override
  State<TesPage> createState() => _TesPageState();
}

class _TesPageState extends State<TesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1/10',
                    style:
                        GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    'andrew',
                    style:
                        GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
             SizedBox(
                  height: 200,
                  width: 200,
                  child: CountDownProgressIndicator(
                    // controller: _controller,
                    valueColor: Colors.red,
                    backgroundColor: Colors.blue,
                    initialPosition: 0,
                    duration: 365,
                    timeFormatter: (seconds) {
                      return Duration(seconds: seconds)
                          .toString()
                          .split('.')[0]
                          .padLeft(8, '0');
                    },
                    text: 'hh:mm:ss',
                    onComplete: () => null,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
