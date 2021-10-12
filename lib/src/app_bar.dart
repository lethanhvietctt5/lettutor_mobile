import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({Key? key, required String title, String? sourceImage})
      : _title = title,
        _sourceImage = sourceImage,
        super(key: key);

  final String _title;
  final String? _sourceImage;

  Widget _render() {
    if (_sourceImage != null) {
      return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage("asset/img/profile.jpg")),
                  color: Colors.blue,
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  border: Border.all(color: Colors.grey)),
            )
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _render();
  }
}
