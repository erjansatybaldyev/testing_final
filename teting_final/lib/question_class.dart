class QuestionClass {
  final String questionText;
  final bool questionAnswer;
  QuestionClass({this.questionText, this.questionAnswer});
}

class QuestionBank {
  List<QuestionClass> questionBrain = [
    QuestionClass(
        questionText: 'Эки күн катарынан жамгыр жаашы мүмкүнбү?',
        questionAnswer: false),
    QuestionClass(
        questionText:
            'Эки адам беш партиядан шашки ойнойт. Ар бири беш жолудан утту. Бул мүмкүнбү?',
        questionAnswer: true),
    QuestionClass(
        questionText: 'Кыргызстанда 7 облус барбы?', questionAnswer: true),
    QuestionClass(
        questionText: 'Aйгул китеп окуушту жаман коробу?',
        questionAnswer: true),
    QuestionClass(questionText: 'Сиз жаман адамсызбы?', questionAnswer: false),
  ];
}
