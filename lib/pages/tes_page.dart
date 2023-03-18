import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_flutter/pages/result_page.dart';

class TesPage extends StatefulWidget {
  TesPage({Key? key}) : super(key: key);

  @override
  State<TesPage> createState() => _TesPageState();
}

class _TesPageState extends State<TesPage> {
  final _controller = CountDownController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 138, 231),
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
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    'andrew',
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 160,
              width: 160,
              child: CountDownProgressIndicator(
                controller: _controller,
                valueColor: Colors.red,
                backgroundColor: Colors.white,
                initialPosition: 0,
                duration: 60,
                text: 'detik',
                onComplete: () => null,
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Warna Langit Sangat Cerah Adalah',
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResultPage(),
                ));
              },
              child: OptionWidget(
                optionChar: "A",
                optionDetail: "Biru",
                color: Colors.red,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: OptionWidget(
                optionChar: "B",
                optionDetail: "Merah",
                color: Colors.green,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: OptionWidget(
                optionChar: "C",
                optionDetail: "Putih",
                color: Colors.blue,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: OptionWidget(
                  optionChar: "D", optionDetail: "Hitam", color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String optionChar;
  final String optionDetail;
  final Color color;

  const OptionWidget({
    Key? key,
    required this.optionChar,
    required this.optionDetail,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(color: color),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                optionChar,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  optionDetail,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
