import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/screens/profile_page/components/birthday.dart';
import 'package:lettutor_mobile/src/screens/profile_page/components/dropdown_menu.dart';
import 'package:lettutor_mobile/src/screens/profile_page/components/phone.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const AvatarCircle(width: 70, height: 70, source: "asset/img/profile.jpg"),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Lê Thành Việt",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "lethanhviet7c@gmail.com",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const BirthdayEdition(),
                const PhoneEdition(),
                const DropdownEdit(
                  title: "Country",
                  selectedItem: "Afghanistan",
                  items: [
                    "Afghanistan",
                    "Albania",
                    "Algeria",
                    "Andorra",
                    "Angola",
                    "Antigua and Barbuda",
                    "Argentina",
                    "Armenia",
                    "Australia",
                  ],
                ),
                const DropdownEdit(
                  title: "My Level",
                  selectedItem: "Beginner",
                  items: ["Beginner", "Immediate", "Advanced"],
                ),
                const DropdownEdit(
                  title: "Want to learn",
                  selectedItem: "TOEIC",
                  items: ["TOEIC", "IELTS", "TOEFL"],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1000))),
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
