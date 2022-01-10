import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/language_model/language_en.dart';
import 'package:lettutor_mobile/src/models/language_model/language_vi.dart';
import 'package:lettutor_mobile/src/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdvancedSettingPage extends StatelessWidget {
  AdvancedSettingPage({Key? key}) : super(key: key);
  final en = English();
  final vi = VietNamese();

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final lang = appProvider.language;

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
              lang.advancedSetting,
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: PopupMenuButton(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lang.languages,
                  style: const TextStyle(fontSize: 17),
                ),
                Text(
                  appProvider.language.name == "EN" ? "English" : "Tiếng Việt",
                  style: const TextStyle(fontSize: 14),
                )
              ],
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 20,
                      child: Image.asset("asset/img/flag_vietnam.png"),
                    ),
                    const Text("Tiếng Việt"),
                  ],
                ),
                value: 0,
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 20,
                      child: SvgPicture.asset(
                        "asset/svg/ic_flag_kingdom.svg",
                        width: 20,
                      ),
                    ),
                    const Text("English"),
                  ],
                ),
                value: 1,
              ),
            ],
            onSelected: (int value) async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              if (value == 0) {
                appProvider.language = vi;
                await prefs.setString("lang", "VI");
              } else {
                appProvider.language = en;
                await prefs.setString("lang", "EN");
              }
            },
          ),
        ),
      ),
    );
  }
}
