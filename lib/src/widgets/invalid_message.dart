import 'package:flutter/material.dart';

class InvalidMessage extends StatelessWidget {
  const InvalidMessage(
      {Key? key,
      required EdgeInsets padding,
      required String message,
      required isError})
      : _padding = padding,
        _message = message,
        _isError = isError,
        super(key: key);

  final EdgeInsets _padding;
  final String _message;
  final bool? _isError;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            _isError != null && _isError == true ? _message : "",
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
