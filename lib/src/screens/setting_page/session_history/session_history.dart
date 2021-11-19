import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/screens/setting_page/session_history/session_item.dart';

class SessionHistoryPage extends StatelessWidget {
  const SessionHistoryPage({Key? key}) : super(key: key);

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
              "Session History",
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        body: Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: ListView.builder(itemCount: 20, itemBuilder: (context, index) => const SessionItem())),
      ),
    );
  }
}