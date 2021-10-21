import 'package:flutter/material.dart';

class BirthdayEdition extends StatelessWidget {
  const BirthdayEdition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: const Text(
              "Birthday",
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 7),
            padding: const EdgeInsets.only(left: 15, right: 15),
            height: 48,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "22/10/2000",
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26, width: 0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }
}
