import 'package:e_check_survey/models/survey_model.dart';
import 'package:flutter/material.dart';
import 'package:e_check_survey/services/api_service.dart';

class HomepageScreen extends StatefulWidget {
  HomepageScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final ApiServices _auth = ApiServices();
  late Future<List<Survey>> surveyData;
  @override
  void initState() {
    // TODO: implement initState
    surveyData = _auth.getSurveryList();
    print('$surveyData');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      // body: ListView.builder(
      //   itemCount: 5,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(title: "$surveyData.",)
      //   },
      // ),
      // body: FutureBuilder<List<Survey>>(builder: ((context, snapshot) {
      //   if (snapshot.hasData) {
      //     return Text(snapshot.data);
      //   } else if (snapshot.hasError) {
      //     return Text('${snapshot.hasError}');
      //   }
      //   return const CircularProgressIndicator();
      // })),
    );
  }
}
