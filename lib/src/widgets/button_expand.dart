import 'package:flutter/material.dart';

class ButtonFullWidth extends StatelessWidget {
  const ButtonFullWidth(
      {Key? key,
      required EdgeInsets padding,
      required String text,
      required Color backgroundColor,
      required VoidCallback onPress})
      : _padding = padding,
        _text = text,
        _backgroundColor = backgroundColor,
        _onPress = onPress,
        super(key: key);

  final EdgeInsets _padding;
  final String _text;
  final Color _backgroundColor;
  final VoidCallback? _onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(_text, style: const TextStyle(fontSize: 20)),
          ),
          style: ElevatedButton.styleFrom(primary: _backgroundColor),
          onPressed: _onPress,
        ),
      ),
    );
  }
}
