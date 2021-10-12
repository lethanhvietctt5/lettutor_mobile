import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<Widget> _sampleMessages() {
    return [
      Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("asset/img/profile.jpg")), color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(100.0)))),
                Positioned(
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(width: 3, color: Colors.white), color: Colors.green),
                  ),
                  bottom: 0,
                  right: 0,
                )
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Lê Thành Việt",
                      style: TextStyle(fontSize: 17),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        "You: yes yes yes yes yes constraints: const BoxConstraints(maxHeight: 190),",
                        style: TextStyle(color: Colors.grey[600]),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("asset/img/profile.jpg")), color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(100.0)))),
                Positioned(
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(width: 3, color: Colors.white), color: Colors.green),
                  ),
                  bottom: 0,
                  right: 0,
                )
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Lê Thành Việt",
                      style: TextStyle(fontSize: 17),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        "You: yes yes yes yes yes constraints: const BoxConstraints(maxHeight: 190),",
                        style: TextStyle(color: Colors.grey[600]),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: TextField(
                    style: TextStyle(fontSize: 15, color: Colors.grey[900]),
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
                        border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
                        hintText: "Search message")),
              ),
              ..._sampleMessages()
            ],
          ),
        ),
      ],
    );
  }
}
