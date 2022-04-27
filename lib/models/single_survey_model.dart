class SingleSurvey {
  String? id;
  String? title;
  List<Questions>? questions;
  List<Answers>? answers;

  SingleSurvey({this.id, this.title, this.questions, this.answers});

  SingleSurvey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? id;
  String? content;

  Questions({this.id, this.content});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    return data;
  }
}

class Answers {
  String? userId;
  String? surveyId;
  String? questionId;
  String? userAnswer;

  Answers({this.userId, this.surveyId, this.questionId, this.userAnswer});

  Answers.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    surveyId = json['surveyId'];
    questionId = json['questionId'];
    userAnswer = json['userAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['surveyId'] = this.surveyId;
    data['questionId'] = this.questionId;
    data['userAnswer'] = this.userAnswer;
    return data;
  }
}


// class SingleSurvey {
//   final String surveyId;
//   final String title;
//   final String q;
//   final List<Questions> questions;
//   final List<Answers> answers;

//   const SingleSurvey({
//     required this.surveyId,
//     required this.title,
//     required this.q,
//     required this.questions,
//     required this.answers,
//   });

//   factory SingleSurvey.fromJson(Map<String, dynamic> json) {
//     return SingleSurvey(
//       surveyId: json['id'],
//       title: json['title'],
//       q: json['questions']['id'],
//       questions: <Questions>[],
//       answers: <Answers>[],
//     );
//   }
// }

// class Questions {
//   final String questionId;
//   final String question;

//   Questions({
//     required this.questionId,
//     required this.question,
//   });

//   factory Questions.fromJson(Map<String, dynamic> json) {
//     return Questions(
//       questionId: json['questions']['id'],
//       question: json['questions']['content'],
//     );
//   }
// }

// class Answers {
//   final String userId;
//   final String surveyId;
//   final String questionId;
//   final String userAnswer;

//   Answers({
//     required this.userId,
//     required this.surveyId,
//     required this.questionId,
//     required this.userAnswer,
//   });

//   factory Answers.fromJson(Map<String, dynamic> json) {
//     return Answers(
//       userId: json['answers']['userId'],
//       surveyId: json['answers']['surveyId'],
//       questionId: json['answers']['questionId'],
//       userAnswer: json['answers']['userAnswer'],
//     );
//   }
// }
