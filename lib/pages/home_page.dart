import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_flutter/models/question_model.dart';
import 'package:quiz_flutter/pages/tes_page.dart';
import 'package:http/http.dart' as myHtpp;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late QuestionModel questionsModel;

  TextEditingController usernameController = TextEditingController();

  final String url =
      "https://script.google.com/macros/s/AKfycbwv_2qbK_51bsg5PMVv8lxRTIdsGEgF1mcuTrpW4af9-s7Amei0DvFUcflPXl6TNC7eow/exec";
  void getAllData(String username) async {
    try {
      var response = await myHtpp.get(Uri.parse(url));
      questionsModel = QuestionModel.fromJson(json.decode(response.body));
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TesPage(
            username: username,
            questionModel: questionsModel,
          ),
        ),
      );
    } catch (e) {
      print('Error' + e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 138, 231),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text Quiz
              Text(
                'YUK QUIZ',
                style: GoogleFonts.montserrat(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
              // TextFormField
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      hintText: "Masukan Username",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              // Button

              ElevatedButton(
                onPressed: () {
                  getAllData(usernameController.text);
                },
                child: const Text(
                  'M U L A I',
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(150, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
