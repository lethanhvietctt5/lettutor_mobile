import 'package:lettutor_mobile/src/models/user_model/learning_topic_model.dart';
import 'package:lettutor_mobile/src/models/user_model/wallet_model.dart';

class User {
  late String id;
  late String email;
  late String name;
  late String avatar;
  late String? country;
  late String phone;
  late List<String> roles;
  late String? language;
  late String? birthday;
  late bool isActivated;
  late Wallet walletInfo;
  late List<String> courses;
  late String? requireNote;
  late String? level;
  late List<LearnTopic> learnTopics;
  late List<String> testPreparations;
  late bool isPhoneActivated;
  late int? timezone;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.avatar,
      this.country,
      required this.phone,
      required this.roles,
      this.language,
      this.birthday,
      required this.isActivated,
      required this.walletInfo,
      required this.courses,
      this.requireNote,
      this.level,
      required this.learnTopics,
      required this.testPreparations,
      required this.isPhoneActivated,
      this.timezone});

  User.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      email = json['email'];
      name = json['name'];
      avatar = json['avatar'];
      country = json['country'];
      phone = json['phone'];
      language = json['language'];
      birthday = json['birthday'];
      isActivated = json['isActivated'];
      roles = json['roles'].cast<String>();
      walletInfo = Wallet.fromJson(json['walletInfo']);
      if (json['courses'] != null) {
        courses = [];
        json['courses'].forEach((v) {
          //courses.add(new Null.fromJson(v));
        });
      }
      requireNote = json['requireNote'].toString();
      level = json['level'];
      if (json['learnTopics'] != null) {
        learnTopics = [];
        json['learnTopics'].forEach((v) {
          learnTopics.add(LearnTopic.fromJson(v));
        });
      }
      if (json['testPreparations'] != null) {
        testPreparations = [];
        json['testPreparations'].forEach((v) {
          //testPreparations.add(new Null.fromJson(v));
        });
      }
      isPhoneActivated = json['isPhoneActivated'];
      timezone = json['timezone'];
    } catch (e) {
      print(e);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['avatar'] = avatar;
    data['country'] = country;
    data['phone'] = phone;
    data['roles'] = roles;
    data['language'] = language;
    data['birthday'] = birthday;
    data['isActivated'] = isActivated;
    data['walletInfo'] = walletInfo.toJson();
    data['courses'] = courses; //.map((v) => v.toJson()).toList();
    data['requireNote'] = requireNote;
    data['level'] = level;
    data['learnTopics'] = learnTopics.map((v) => v.toJson()).toList();
    data['testPreparations'] = testPreparations; //.map((v) => v.toJson()).toList();
    data['isPhoneActivated'] = isPhoneActivated;
    data['timezone'] = timezone;
    return data;
  }
}
