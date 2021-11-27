import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/provider/setting.dart';
import 'package:provider/provider.dart';

class AdvancedSettingPage extends StatelessWidget {
  const AdvancedSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<SettingProvider>(context);
    List<String> lans = ["Tiếng Việt", "English"];

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
              "Advanced Settings",
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
                const Text(
                  "Language",
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  setting.language,
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
            onSelected: (int value) {
              setting.changeLanguage(lans[value]);
            },
          ),
        ),
      ),
    );
  }
}
