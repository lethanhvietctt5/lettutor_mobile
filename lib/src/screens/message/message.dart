import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/screens/message/mess_item.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<Widget> _sampleMessages() {
    return const [
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
      MessageItem(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextField(
                style: TextStyle(fontSize: 12, color: Colors.grey[900]),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(13),
                      child: SvgPicture.asset(
                        "asset/svg/ic_search.svg",
                        color: Colors.grey[600],
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(left: 5, right: 5),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Search messages")),
          ),
          ListView.builder(
              itemCount: _sampleMessages().length,
              itemBuilder: (context, index) {
                return _sampleMessages()[index];
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics())
        ],
      ),
    );
  }
}
