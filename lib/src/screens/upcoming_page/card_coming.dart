import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';

class UpComingCard extends StatelessWidget {
  const UpComingCard({Key? key, required String imgSource, required String name, required String date, required String start, required String end})
      : _imgSource = imgSource,
        _name = name,
        _date = date,
        _start = start,
        _end = end,
        super(key: key);

  final String _imgSource, _name, _date, _start, _end;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(margin: const EdgeInsets.only(right: 15), child: AvatarCircle(width: 50, height: 50, source: _imgSource)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          _name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            _date,
                            style: const TextStyle(fontSize: 13),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              _start,
                              style: const TextStyle(fontSize: 10, color: Colors.blue),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 1), color: Colors.blue[50], borderRadius: BorderRadius.circular(4)),
                          ),
                          const Text("-"),
                          Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              _end,
                              style: const TextStyle(fontSize: 10, color: Colors.orange),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange, width: 1), color: Colors.orange[50], borderRadius: BorderRadius.circular(4)),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300] as Color),
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[Text("Cancel")],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[400] as Color),
                          color: Colors.grey[400],
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "Go to meeting",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
