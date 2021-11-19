import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdvancedSettingPage extends StatefulWidget {
  const AdvancedSettingPage({Key? key}) : super(key: key);

  @override
  State<AdvancedSettingPage> createState() => _AdvancedSettingPageState();
}

class _AdvancedSettingPageState extends State<AdvancedSettingPage> {
  int _selected = 0;

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
                  _selected == 1 ? "English" : "Tiếng Việt",
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
              setState(() {
                _selected = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
