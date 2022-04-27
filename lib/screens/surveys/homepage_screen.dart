import 'package:flutter/material.dart';
import 'package:e_check_survey/models/survey_model.dart';
import 'package:e_check_survey/screens/surveys/single_survey_screen.dart';
import 'package:e_check_survey/services/api_service.dart';

class HomepageScreen extends StatefulWidget {
  HomepageScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final ApiServices _auth = ApiServices();
  Future<List<Survey>> surveyData = ApiServices.getSurveryList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      body: FutureBuilder<List<Survey>>(
        future: surveyData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final surveys = snapshot.data!;
            return buildSurvey(surveys);
          } else {
            return const Text('Loading');
          }
        },
      ),
    );
  }

  Widget buildSurvey(List<Survey> surveys) => ListView.builder(
        itemCount: surveys.length,
        itemBuilder: (context, i) {
          final survey = surveys[i];
          return ListTile(
            title: Text(survey.title),
            onTap: () {
              ApiServices.getSingleSurvey(survey.id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SingleSurveyScreen(
                    surveyId: survey.id,
                  ),
                ),
              );
            },
          );
        },
      );
}
