import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  int count = 0;
  List<Question> _questionBank = [
    Question(
        'India is a federal union comprising twenty-eight states and how many union territories?',
        '6',
        '8',
        '7',
        '9',
        '9'),
    Question('Which of the following is the capital of Arunachal Pradesh?',
        'Itanagar', 'Dispur', 'Imphal', 'Panaji', 'Itanagar'),
    Question(
        'What are the major languages spoken in Andhra Pradesh',
        'English and Telugu',
        'Telugu and Kannada',
        'Telugu and Urdu',
        'All of the above languages',
        'Telugu and Urdu'),
    Question('What is the state flower of Haryana?', 'Lotus', 'Rhododendron',
        'Golden Shower', 'Not declared', 'Lotus'),
    Question('In which state is the main language Khasi?', 'Mizoram',
        'Nagaland', ' Meghalaya', 'Tripura', ' Meghalaya'),
    Question('Which is the largest coffee producing state of India?',
        'Tamil Nadu', 'Karnataka', 'Kerala', 'Arunachal Pradesh', 'Karnataka'),
    Question('Which state has the largest population?', 'Uttar Pradesh',
        'Maharastra', ' Bihar', 'Andra Pradesh', 'Uttar Pradesh'),
    Question('Which state has the largest area?', 'Maharashtra',
        'Madhya Pradesh', 'Uttar Pradesh', 'Rajasthan', 'Rajasthan'),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
      count++;
    } else {
      count++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].ans;
  }

  String getOp1() {
    return _questionBank[_questionNumber].op1;
  }

  String getOp2() {
    return _questionBank[_questionNumber].op2;
  }

  String getOp3() {
    return _questionBank[_questionNumber].op3;
  }

  String getOp4() {
    return _questionBank[_questionNumber].op4;
  }

  // Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.
  bool isFinished() {
    if (count >= _questionBank.length) {
      print('end of questions');
      count = 0;
      return true;
    } else
      return false;
  }
  // Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

  //Step 4 Part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }
}
