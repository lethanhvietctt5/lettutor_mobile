import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';

class MessageReceive extends StatelessWidget {
  const MessageReceive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40),
                child: const Text(
                  "Lê Thành Việt",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AvatarCircle(width: 30, height: 30, source: "asset/img/profile.jpg"),
              Align(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  margin: const EdgeInsets.only(top: 5, right: 8, left: 10),
                  padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                  child: const Text(
                    "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
                    style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: const BorderRadius.all(Radius.circular(20))),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
