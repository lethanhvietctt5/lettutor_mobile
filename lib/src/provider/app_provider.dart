import 'package:flutter/cupertino.dart';
import 'package:lettutor_mobile/src/models/course_model/course_category.dart';
import 'package:lettutor_mobile/src/models/user_model/learning_topic_model.dart';
import 'package:lettutor_mobile/src/models/user_model/test_preparation_model.dart';

class AppProvider extends ChangeNotifier {
  List<LearnTopic> allLearningTopics = [];
  List<TestPreparation> allTestPreparations = [];
  List<CourseCategory> allCourseCategories = [];

  void load(List<LearnTopic> learningTopics, List<TestPreparation> testPreparations) {
    allLearningTopics = learningTopics;
    allTestPreparations = testPreparations;
    notifyListeners();
  }

  void loadCourseCategories(List<CourseCategory> courseCategories) {
    allCourseCategories = courseCategories;
    notifyListeners();
  }
}
