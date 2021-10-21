import 'package:flutter/material.dart';

class PhoneEdition extends StatelessWidget {
  const PhoneEdition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 7, left: 5),
            child: const Text(
              "Phone number",
              style: TextStyle(fontSize: 17),
            ),
          ),
          TextField(
            style: TextStyle(fontSize: 17, color: Colors.grey[900]),
            decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.only(left: 15, right: 15),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 0.3),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 0.3),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 0.3),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: "Phone number"),
          )
        ],
      ),
    );
  }
}
