import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RateStars extends StatelessWidget {
  const RateStars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "asset/svg/ic_star.svg",
          width: 20,
          height: 20,
          color: Colors.yellow[700],
        ),
        SvgPicture.asset(
          "asset/svg/ic_star.svg",
          width: 20,
          height: 20,
          color: Colors.yellow[700],
        ),
        SvgPicture.asset(
          "asset/svg/ic_star.svg",
          width: 20,
          height: 20,
          color: Colors.yellow[700],
        ),
        SvgPicture.asset(
          "asset/svg/ic_star.svg",
          width: 20,
          height: 20,
          color: Colors.yellow[700],
        ),
        SvgPicture.asset(
          "asset/svg/ic_star.svg",
          width: 20,
          height: 20,
          color: Colors.yellow[700],
        ),
      ],
    );
  }
}
