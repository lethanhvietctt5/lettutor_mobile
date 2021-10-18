import 'package:flutter/material.dart';

class MessageSend extends StatelessWidget {
  const MessageSend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              margin: const EdgeInsets.only(top: 5, right: 8, left: 10),
              padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
              child: const Text(
                "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ",
                style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
              ),
              decoration: const BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          )
        ],
      ),
    );
  }
}
