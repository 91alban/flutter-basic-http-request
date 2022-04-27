import 'package:e_check_survey/services/api_service.dart';
import 'package:flutter/material.dart';
import '../../models/single_survey_model.dart';

class SingleSurveyScreen extends StatefulWidget {
  final String surveyId;
  SingleSurveyScreen({
    required this.surveyId,
  });

  @override
  State<SingleSurveyScreen> createState() => _SingleSurveyScreenState();
}

class _SingleSurveyScreenState extends State<SingleSurveyScreen> {
  late Future<SingleSurvey> futureSingleSurvey =
      ApiServices.getSingleSurvey(widget.surveyId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Single Survey')),
      body: SingleChildScrollView(
        child: FutureBuilder<SingleSurvey>(
          future: futureSingleSurvey,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final singleSurvey = snapshot.data!;
              return Column(
                children: [
                  Card(
                    child: ListTile(
                      title: Text(singleSurvey.title!),
                    ),
                  ),
                  Container(
                    height: 600,
                    child: buildQuestion(
                        singleSurvey.questions!, singleSurvey.answers!),
                  ),
                  // Container(
                  //     height: 300, child: buildAnswer(singleSurvey.answers!))
                  //   singleSurvey.questions.map((e) => {
                  //     return ListTile(title: Text(e.question),)
                  //   })
                ],
              );
            } else {
              return Text('${snapshot.error}');
            }
          },
        ),
      ),
    );
  }

  Widget buildQuestion(
          List<Questions> questionsList, List<Answers> answerList) =>
      ListView.builder(
        itemCount: questionsList.length,
        itemBuilder: (context, i) {
          final question = questionsList[i];
          final answer = answerList[i];
          print(question);
          return Column(
            children: [
              ListTile(
                title: Text('Q: ${question.content!}'),
              ),
              ListTile(
                title: Text('A: ${answer.userAnswer!}'),
              )
            ],
          );
        },
      );

  // Widget buildAnswer(List<Answers> answerList) => ListView.builder(
  //       itemCount: answerList.length,
  //       itemBuilder: (context, i) {
  //         final answer = answerList[i];
  //         print(answer);
  //         return ListTile(
  //           title: Text(answer.userAnswer!),
  //         );
  //       },
  //     );
}
