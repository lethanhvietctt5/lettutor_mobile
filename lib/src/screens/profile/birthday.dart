import 'package:flutter/material.dart';

class BirthdayEdition extends StatefulWidget {
  const BirthdayEdition({Key? key}) : super(key: key);

  @override
  State<BirthdayEdition> createState() => _BirthdayEditionState();
}

class _BirthdayEditionState extends State<BirthdayEdition> {
  DateTime _birthday = DateTime(2000);

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthday, // Refer step 1
      firstDate: DateTime(1900),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != _birthday) {
      setState(() {
        _birthday = picked;
      });
    }
  }

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
          InkWell(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 7),
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: 48,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    stringFormatDateTime(_birthday),
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26, width: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ],
      ),
    );
  }
}

String stringFormatDateTime(DateTime date) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");

  return "${twoDigits(date.day)}/${twoDigits(date.month)}/${date.year}";
}
