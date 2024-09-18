class Test {
  String? id; // ID теста
  String title; // Название теста
  List<Question> questions; // Список вопросов

  Test({
    this.id,
    required this.title,
    required this.questions,
  });

  // Преобразование теста в Map для сохранения в Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((q) => q.toMap()).toList(), // Сохраняем вопросы
    };
  }

  // Преобразование данных из Firebase в объект Test
  factory Test.fromMap(Map<String, dynamic> map, String id) {
    return Test(
      id: id,
      title: map['title'],
      questions: List<Question>.from(
        map['questions'].map((questionMap) => Question.fromMap(questionMap)),
      ),
    );
  }
}

class Question {
  String questionText; // Вопрос
  List<String> answers; // Варианты ответов
  int correctAnswerIndex; // Индекс правильного ответа

  Question({
    required this.questionText,
    required this.answers,
    required this.correctAnswerIndex,
  });

  // Преобразование вопроса в Map для Firebase
  Map<String, dynamic> toMap() {
    return {
      'questionText': questionText,
      'answers': answers,
      'correctAnswerIndex': correctAnswerIndex,
    };
  }

  // Преобразование данных из Firebase в объект Question
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      questionText: map['questionText'],
      answers: List<String>.from(map['answers']),
      correctAnswerIndex: map['correctAnswerIndex'],
    );
  }
}