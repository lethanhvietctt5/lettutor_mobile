import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_mobile/src/constants/list_contries.dart';
import 'package:lettutor_mobile/src/constants/list_level.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/provider/user_provider.dart';
import 'package:lettutor_mobile/src/screens/profile_page/components/birthday.dart';
import 'package:lettutor_mobile/src/screens/profile_page/components/dropdown_menu.dart';
import 'package:lettutor_mobile/src/screens/profile_page/components/phone.dart';
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
  String? _topicToLearn;
  bool isInit = true;

  final ImagePicker _picker = ImagePicker();

  void setBirthday(DateTime birthday) {
    setState(() {
      _birthday = birthday;
    });
  }

  void setPhone(String phone) {
    setState(() {
      _phone = phone;
    });
  }

  void setCountry(String country) {
    setState(() {
      _country = country;
    });
  }

  void setLevel(String level) {
    setState(() {
      _level = level;
    });
  }

  void setTopicToLearn(String topicToLearn) {
    setState(() {
      _topicToLearn = topicToLearn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    final authProvider = Provider.of<AuthProvider>(context);

    final _nameController = TextEditingController();

    setState(() {
      if (isInit) {
        _birthday = authProvider.userLoggedIn.birthday != null
            ? DateFormat("yyyy-MM-dd").parse(authProvider.userLoggedIn.birthday as String)
            : null;
        _phone = authProvider.userLoggedIn.phone;
        _country = authProvider.userLoggedIn.country != null ? (authProvider.userLoggedIn.country as String) : "";
        _level = authProvider.userLoggedIn.level;
        _topicToLearn = "BEGINNER";
        _nameController.text = authProvider.userLoggedIn.name;
        isInit = false;
      }
    });

    void _imgFromGallery() async {
      var pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

      if (pickedFile != null) {
        userProvider.uploadProfileImage(File(pickedFile.path));
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
              "Profile",
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
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.network(
                          authProvider.userLoggedIn.avatar,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
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
                          child: SvgPicture.asset(
                            "asset/svg/ic_camera.svg",
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    user.fullName,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  authProvider.userLoggedIn.email,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 7, left: 5),
                        child: const Text(
                          "Name",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      TextField(
                        style: TextStyle(fontSize: 17, color: Colors.grey[900]),
                        controller: _nameController,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(left: 15, right: 15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26, width: 0.3),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26, width: 0.3),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26, width: 0.3),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: "Full name",
                        ),
                      )
                    ],
                  ),
                ),
                BirthdayEdition(setBirthday: setBirthday, birthday: _birthday),
                PhoneEdition(
                    changePhone: setPhone,
                    phone: _phone ?? "",
                    isPhoneActivated: authProvider.userLoggedIn.isPhoneActivated ?? false),
                DropdownEdit(
                  title: "Country",
                  selectedItem: _country != null ? _country as String : "VN",
                  items: countryList,
                  onChange: setCountry,
                ),
                DropdownEdit(
                  title: "My Level",
                  selectedItem: _level != null ? _level as String : "BEGINNER",
                  items: listLevel,
                  onChange: setLevel,
                ),
                // DropdownEdit(
                //   title: "Want to learn",
                //   selectedItem: _topicToLearn,
                //   items: listLearningTopics,
                //   onChange: setTopicToLearn,
                // ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_phone != null && _phone?.isEmpty as bool) {
                        showTopSnackBar(
                          context,
                          const CustomSnackBar.error(message: "Phone number is invalid."),
                          showOutAnimationDuration: const Duration(milliseconds: 700),
                          displayDuration: const Duration(milliseconds: 200),
                        );
                      } else {
                        if (_birthday != null) {
                          userProvider.updateBirthday(_birthday as DateTime);
                        }
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 13, bottom: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
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
