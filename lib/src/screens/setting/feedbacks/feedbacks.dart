import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/screens/setting/feedbacks/feedback_item.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';

class Feedbacks extends StatelessWidget {
  const Feedbacks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 20,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey[800]),
          title: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              "Feedbacks",
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "5.0",
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.pink),
                        ),
                        SizedBox(
                          width: 40,
                          child: SvgPicture.asset(
                            "asset/svg/ic_star.svg",
                            width: 35,
                            color: Colors.yellow[700],
                          ),
                        )
                      ],
                    ),
                  ),
                  const FeedbackItem(),
                  const FeedbackItem(),
                  const FeedbackItem(),
                ],
              )),
        ),
      ),
    );
  }
}