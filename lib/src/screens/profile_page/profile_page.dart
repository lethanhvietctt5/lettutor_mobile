import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_mobile/src/constants/list_contries.dart';
import 'package:lettutor_mobile/src/constants/list_level.dart';
import 'package:lettutor_mobile/src/models/user_model/learning_topic_model.dart';
import 'package:lettutor_mobile/src/models/user_model/test_preparation_model.dart';
import 'package:lettutor_mobile/src/models/user_model/tokens_model.dart';
import 'package:lettutor_mobile/src/global_state/app_provider.dart';
import 'package:lettutor_mobile/src/global_state/auth_provider.dart';
import 'package:lettutor_mobile/src/screens/profile_page/components/birthday.dart';
import 'package:lettutor_mobile/src/screens/profile_page/components/dropdown_menu.dart';
import 'package:lettutor_mobile/src/screens/profile_page/components/phone.dart';
import 'package:lettutor_mobile/src/screens/profile_page/components/want_to_learn.dart';
import 'package:lettutor_mobile/src/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late DateTime? _birthday;
  String? _phone;
  String? _country;
  String? _level;
  List<LearnTopic> _topics = [];
  List<TestPreparation> _tests = [];
  bool isInit = true;

  final ImagePicker _picker = ImagePicker();
  final _nameController = TextEditingController();

  setForm({DateTime? birthday, String phone = "", String country = "", String level = ""}) {
    setState(() {
      _birthday = birthday ?? DateTime.now();
      if (phone.isNotEmpty) {
        _phone = phone;
      }
      if (country.isNotEmpty) {
        _country = country;
      }
      if (level.isNotEmpty) {
        _level = level;
      }
    });
  }

  editTopics(List<LearnTopic> topics) {
    setState(() {
      _topics = topics;
    });
  }

  editTests(List<TestPreparation> tests) {
    setState(() {
      _tests = tests;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final lang = Provider.of<AppProvider>(context).language;

    setState(() {
      if (isInit) {
        _birthday = authProvider.userLoggedIn.birthday != null
            ? DateFormat("yyyy-MM-dd").parse(authProvider.userLoggedIn.birthday as String)
            : DateFormat("yyyy-MM-dd").parse("1999-01-22");
        _phone = authProvider.userLoggedIn.phone;
        _country = authProvider.userLoggedIn.country != null ? (authProvider.userLoggedIn.country as String) : "VN";
        _level = authProvider.userLoggedIn.level ?? "BEGINNER";
        _nameController.text = authProvider.userLoggedIn.name;
        _topics = authProvider.userLoggedIn.learnTopics ?? [];
        _tests = authProvider.userLoggedIn.testPreparations ?? [];
        isInit = false;
      }
    });

    void _imgFromGallery() async {
      var pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

      if (pickedFile != null) {
        final bool res = await UserService.uploadAvatar(pickedFile.path, authProvider.tokens!.access.token);
        if (res) {
          final newInfo = await UserService.getUserInfo(authProvider.tokens!.access.token);

          if (newInfo != null) {
            authProvider.setUser(newInfo);
          } else {
            showTopSnackBar(context, CustomSnackBar.error(message: lang.errGetNewProfile),
                showOutAnimationDuration: const Duration(milliseconds: 1000), displayDuration: const Duration(microseconds: 4000));
          }

          showTopSnackBar(
              context,
              CustomSnackBar.success(
                message: lang.successUploadAvatar,
                backgroundColor: Colors.green,
              ),
              showOutAnimationDuration: const Duration(milliseconds: 1000),
              displayDuration: const Duration(microseconds: 4000));
        } else {
          showTopSnackBar(context, CustomSnackBar.error(message: lang.errUploadAvatar),
              showOutAnimationDuration: const Duration(milliseconds: 1000), displayDuration: const Duration(microseconds: 4000));
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 20,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey[800]),
          title: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              lang.profile,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(right: 15, left: 15),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: CachedNetworkImage(
                              imageUrl: authProvider.userLoggedIn.avatar,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  CircularProgressIndicator(value: downloadProgress.progress),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          )),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: GestureDetector(
                        onTap: _imgFromGallery,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 15,
                          child: SvgPicture.asset("asset/svg/ic_camera.svg", color: Colors.grey[700]),
                        ),
                      ),
                    )
                  ],
                ),
                Text(authProvider.userLoggedIn.email, style: TextStyle(fontSize: 14, color: Colors.grey[800], fontWeight: FontWeight.w500)),
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 7, left: 5),
                        child: Text(lang.fullName, style: const TextStyle(fontSize: 17)),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 17, color: Colors.grey[900]),
                        controller: _nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 15, right: 15),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26, width: 0.3), borderRadius: BorderRadius.all(Radius.circular(10))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26, width: 0.3), borderRadius: BorderRadius.all(Radius.circular(10))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26, width: 0.3), borderRadius: BorderRadius.all(Radius.circular(10))),
                          hintText: lang.fullName,
                        ),
                      )
                    ],
                  ),
                ),
                BirthdayEdition(setBirthday: setForm, birthday: _birthday),
                PhoneEdition(changePhone: setForm, phone: _phone ?? "", isPhoneActivated: authProvider.userLoggedIn.isPhoneActivated ?? false),
                DropdownEdit(
                  title: lang.country,
                  selectedItem: _country != null ? _country as String : "VN",
                  items: countryList,
                  onChange: setForm,
                  fieldName: "Country",
                ),
                DropdownEdit(
                  title: lang.level,
                  selectedItem: _level != null ? _level as String : "BEGINNER",
                  items: listLevel,
                  onChange: setForm,
                  fieldName: "Level",
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 2, left: 5),
                  child: Row(
                    children: [
                      Text(
                        lang.wantToLearn,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                WantToLearn(userTopics: _topics, editTopics: editTopics, userTestPreparations: _tests, editTestPreparations: editTests),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_phone != null && _phone?.isEmpty as bool) {
                        showTopSnackBar(
                          context,
                          CustomSnackBar.error(message: lang.errPhoneNumber),
                          showOutAnimationDuration: const Duration(milliseconds: 700),
                          displayDuration: const Duration(milliseconds: 200),
                        );
                      } else if (_nameController.text.isEmpty) {
                        showTopSnackBar(
                          context,
                          CustomSnackBar.error(message: lang.errEnterName),
                          showOutAnimationDuration: const Duration(milliseconds: 700),
                          displayDuration: const Duration(milliseconds: 200),
                        );
                      } else if (_birthday != null && _birthday!.millisecondsSinceEpoch > DateTime.now().millisecondsSinceEpoch) {
                        showTopSnackBar(
                          context,
                          CustomSnackBar.error(message: lang.errBirthday),
                          showOutAnimationDuration: const Duration(milliseconds: 700),
                          displayDuration: const Duration(milliseconds: 200),
                        );
                      } else {
                        String _bdArg =
                            "${_birthday!.year.toString()}-${_birthday!.month.toString().padLeft(2, "0")}-${_birthday!.day..toString().padLeft(2, "0")}";

                        final res = await UserService.updateInfo(
                          authProvider.tokens!.access.token,
                          _nameController.text,
                          _country as String,
                          _bdArg,
                          _level as String,
                          _topics.map((e) => e.id.toString()).toList(),
                          _tests.map((e) => e.id.toString()).toList(),
                        );
                        if (res != null) {
                          authProvider.logIn(res, authProvider.tokens as Tokens);
                          showTopSnackBar(
                            context,
                            CustomSnackBar.success(
                              message: lang.successUpdateProfile,
                              backgroundColor: Colors.green,
                            ),
                            showOutAnimationDuration: const Duration(milliseconds: 700),
                            displayDuration: const Duration(milliseconds: 200),
                          );
                          Navigator.pop(context);
                        } else {
                          showTopSnackBar(
                            context,
                            CustomSnackBar.error(message: lang.errUpdateProfile),
                            showOutAnimationDuration: const Duration(milliseconds: 700),
                            displayDuration: const Duration(milliseconds: 200),
                          );
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 13, bottom: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(lang.save, style: const TextStyle(color: Colors.white))],
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff007CFF),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
