import 'package:flutter/material.dart';

class PhoneEdition extends StatefulWidget {
  const PhoneEdition({Key? key, required this.changePhone, required this.phone, required this.isPhoneActivated})
      : super(key: key);
  final Function(String) changePhone;
  final String phone;
  final bool isPhoneActivated;

  @override
  State<PhoneEdition> createState() => _PhoneEditionState();
}

class _PhoneEditionState extends State<PhoneEdition> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.phone;
  }

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
            controller: _controller,
            enabled: !widget.isPhoneActivated,
            onChanged: (value) => widget.changePhone(value),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.only(left: 15, right: 15),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26, width: 0.3),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26, width: 0.3),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26, width: 0.3),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText: "Phone number",
            ),
          )
        ],
      ),
    );
  }
}
