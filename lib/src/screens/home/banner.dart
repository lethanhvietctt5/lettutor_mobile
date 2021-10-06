import 'package:flutter/material.dart';

class BannerHomePage extends StatelessWidget {
  const BannerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: const Color(0xff0720AE),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Text(
            "Welcome to LetTutor",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Book a lesson", style: TextStyle(color: Colors.blue)),
            style: ElevatedButton.styleFrom(primary: Colors.white, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
          )
        ]),
      ),
    );
  }
}
