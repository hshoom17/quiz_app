import 'package:flutter/material.dart';
import 'home_page.dart';
import 'questions_screen.dart';
import 'data/questions.dart';
import 'results_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() 
  => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
      selectedAnswers.clear();
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers.clear();
    });
  } 

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        
        activeScreen = 'results-screen';
      });
    }
  }
 
 
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomePage(switchScreen) ;

    if(activeScreen == 'questions-screen'){  // to change the screen to questions screen
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if(activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
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