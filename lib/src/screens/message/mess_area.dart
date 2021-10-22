import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/screens/message/message_receive.dart';
import 'package:lettutor_mobile/src/screens/message/message_send.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';

class MessageArea extends StatelessWidget {
  const MessageArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 20,
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.blue),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: const AvatarCircle(width: 30, height: 30, source: "asset/img/profile.jpg")),
              Text(
                "Lê Thành Việt",
                style: TextStyle(color: Colors.grey[800]),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index % 2 == 0) return const MessageReceive();
                return const MessageSend();
              },
            )),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        style: TextStyle(fontSize: 12, color: Colors.grey[900]),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            contentPadding: const EdgeInsets.only(left: 15, right: 15),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(1000))),
                            hintText: "Type message...")),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 10),
                    child: SvgPicture.asset(
                      "asset/svg/ic_arrow_up.svg",
                      color: Colors.blue[900],
                    ),
                    decoration: BoxDecoration(
                      //image: DecorationImage(image: AssetImage("")),
                      color: Colors.blue[100],
                      borderRadius: const BorderRadius.all(Radius.circular(1000)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
