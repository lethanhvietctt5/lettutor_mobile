import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => MessageArea()));
        Navigator.pushNamed(context, "/messageDetail");
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          children: [
            Stack(
              children: [
                const AvatarCircle(width: 40, height: 40, source: "asset/img/profile.jpg"),
                Positioned(
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100), border: Border.all(width: 3, color: Colors.white), color: Colors.green),
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
                      style: TextStyle(fontSize: 15),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        "You: yes yes yes yes yes constraints: const BoxConstraints(maxHeight: 190),",
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
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
    );
  }
}
