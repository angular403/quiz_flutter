import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_flutter/models/question_model.dart';
import 'package:quiz_flutter/pages/result_page.dart';

class TesPage extends StatefulWidget {
  final QuestionModel questionModel;
  final String username;
  TesPage({required this.questionModel, required this.username, Key? key})
      : super(key: key);

  @override
  State<TesPage> createState() => _TesPageState();
}

class _TesPageState extends State<TesPage> {
  final _controller = CountDownController();

  int index = 0;
  int result = 0;
  @override
  void initState() {
    print('USERNAME : ' + widget.username);
    print('QUESTIONS : ' + widget.questionModel.data.length.toString());
    super.initState();
  }

  void navigate(String optionChar) {
    setState(() {
      if (optionChar == (widget.questionModel.data[index].correctOption)) {
        result++;
      }
      index++;

      if (index == widget.questionModel.data.length) {
        Navigator.of(context)
            .push(MaterialPageRoute(
          builder: (context) => ResultPage(
            result: result,
          ),
        ))
            .then((value) {
          setState(() {});
        });

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 138, 231),
      body: SafeArea(
        child:  index < 10 ?  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${index + 1} / ${widget.questionModel.data.length.toString()}',
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    widget.username,
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
                onComplete: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => ResultPage(
                                result: result,
                              )))
                      .then((value) {
                    setState(() {});
                  });
                },
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.questionModel.data[index].question,
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
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => ResultPage(),
                // ));
                navigate('a');
              },
              child: OptionWidget(
                optionChar: "A",
                optionDetail: widget.questionModel.data[index].optionA,
                color: Colors.red,
              ),
            ),
            GestureDetector(
              onTap: () {
                navigate('b');
              },
              child: OptionWidget(
                optionChar: "B",
                optionDetail: widget.questionModel.data[index].optionB,
                color: Colors.green,
              ),
            ),
            GestureDetector(
              onTap: () {
                navigate('c');
              },
              child: OptionWidget(
                optionChar: "C",
                optionDetail: widget.questionModel.data[index].optionC,
                color: Colors.blue,
              ),
            ),
            GestureDetector(
              onTap: () {
                navigate('d');
              },
              child: OptionWidget(
                optionChar: "D",
                optionDetail: widget.questionModel.data[index].optionD,
                color: Colors.grey,
              ),
            ),
          ],
        ) : SizedBox(),
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
