import 'package:flutter/material.dart';

class BannerCourse extends StatelessWidget {
  const BannerCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          width: double.infinity,
          height: 200,
          child: Image.asset(
            "asset/img/course.png",
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            margin: const EdgeInsets.only(left: 10, top: 10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(
                    Radius.circular(1000),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 10,
                  offset: Offset(0, 0), // Shadow position
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: const [
                      Text(
                        "10",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "topics",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      "1",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "tutors",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
