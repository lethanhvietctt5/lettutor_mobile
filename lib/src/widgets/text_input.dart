import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputTextWithTitle extends StatelessWidget {
  const InputTextWithTitle(
      {Key? key,
      required String title,
      required String hintText,
      required bool secured,
      required EdgeInsets padding,
      required TextEditingController controller,
      required String prefixIconPath,
      required String defaultValue})
      : _title = title,
        _hintText = hintText,
        _secured = secured,
        _padding = padding,
        _controller = controller,
        _prefixIconPath = prefixIconPath,
        _defaultValue = defaultValue,
        super(key: key);

  final String _title;
  final String _hintText;
  final bool _secured;
  final EdgeInsets _padding;
  final String _prefixIconPath;
  final String _defaultValue;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Text(
              _title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[800]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text("*default: " + _defaultValue, style: TextStyle(fontSize: 12, color: Colors.grey[400])),
          ),
          TextField(
            style: TextStyle(fontSize: 15, color: Colors.grey[900]),
            obscureText: _secured,
            controller: _controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: Container(
                  padding: const EdgeInsets.all(13),
                  child: SvgPicture.asset(
                    _prefixIconPath,
                    color: Colors.grey[600],
                  ),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: _hintText),
          ),
        ],
      ),
    );
  }
}
