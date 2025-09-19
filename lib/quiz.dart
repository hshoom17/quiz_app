import 'package:flutter/material.dart';
import 'home_page.dart';
import 'questions.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() 
  => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  } 
 
 
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomePage(switchScreen) ;

    if(activeScreen == 'questions-screen'){  // to change the screen to questions screen
      screenWidget = const Questions();
    }
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
            ],
          ),
        ),
        child: screenWidget,
        // child: activeScreen == 'start-screen'
        //     ? HomePage(switchScreen)
        //     : const Questions(),
      ),
    );
  }
}