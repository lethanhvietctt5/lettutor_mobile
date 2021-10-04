import 'package:flutter/material.dart';

class InputTextWithTitle extends StatelessWidget {
  const InputTextWithTitle(
      {Key? key,
      required String title,
      required String hintText,
      required bool secured,
      required EdgeInsets padding,
      required TextEditingController controller})
      : _title = title,
        _hintText = hintText,
        _secured = secured,
        _padding = padding,
        _controller = controller,
        super(key: key);

  final String _title;
  final String _hintText;
  final bool _secured;
  final EdgeInsets _padding;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              _title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]),
            ),
          ),
          TextField(
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
              obscureText: _secured,
              controller: _controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: _hintText)),
        ],
      ),
    );
  }
}
