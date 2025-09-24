class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
    
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();  // to shuffle the answers
    return shuffledList;
  }

}
