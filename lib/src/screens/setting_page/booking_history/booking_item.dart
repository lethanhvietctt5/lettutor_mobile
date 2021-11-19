import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(right: 15),
                child: const AvatarCircle(width: 50, height: 50, source: "asset/img/profile.jpg")),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: const Text(
                    "Le Thanh Viet",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Text(
                      "2021-10-07",
                      style: TextStyle(fontSize: 13),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      child: const Text(
                        "22:00",
                        style: TextStyle(fontSize: 10, color: Colors.blue),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1),
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    const Text("-"),
                    Container(
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      child: const Text(
                        "22:25",
                        style: TextStyle(fontSize: 10, color: Colors.orange),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange, width: 1),
                          color: Colors.orange[50],
                          borderRadius: BorderRadius.circular(4)),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
