import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questions.dart';
class Question_Bank{
  int item = 0, answer = 0, right = 0, wrong = 0;
  List<Question> qobj = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  List<Widget> scorekeeper = [];
  String getQuestion(){
    return qobj[item].tanong;
  }

  bool getAnswer(){
    return qobj[item].sagot;
  }

  void nextItem() {
    if (item < 12) {
      item++;
    }
  }
  void nextAnswer(){
    if(answer<13) {
      answer++;
    }
  }

  void checkAnswer(bool A, BuildContext context){
    if(answer < 13) {
      if (getAnswer() == A) {
        scorekeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        right++;
      } else {
        scorekeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
        wrong++;
      }
      if(item < 12) {
        nextItem();
      }
      nextAnswer();
    }
    if(answer == 13 && item == 12){
      AlertPopUp(context);
    }
  }

  void AlertPopUp(BuildContext context) {
    Alert(
      context: context,
      title: 'QUIZ COMPLETE',
      desc: 'CORRECT $right\nIncorrect: $wrong',
      buttons:[
        DialogButton(
          child: Text(
            "RESTART",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
            ),
          ),
          onPressed: () {
            restart();
            (context as Element).markNeedsBuild();
            Navigator.pop(context);
          },
          width: 200
        ),
      ],
    ).show();
  }

  void restart() {
    item = 0;
    answer = 0;
    right = 0;
    wrong = 0;
    scorekeeper.clear();
  }
}

