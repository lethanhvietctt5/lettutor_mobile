import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/tutor/tutor.dart';
import 'package:lettutor_mobile/src/provider/user_provider.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';
import 'package:lettutor_mobile/src/widgets/rate_stars.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MainInfo extends StatelessWidget {
  const MainInfo({Key? key, required this.tutor}) : super(key: key);

  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final exists = userProvider.idFavorite.where((element) => element == tutor.id);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: AvatarCircle(width: 70, height: 70, source: tutor.image)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      tutor.fullName,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Text(
                      "Teacher",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      tutor.country,
                      style: const TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
          RateStars(count: tutor.getTotalStar()),
          Container(
            margin: const EdgeInsets.only(top: 8, right: 8),
            child: GestureDetector(
              onTap: () {
                if (exists.isNotEmpty) {
                  userProvider.removeFavorite(tutor.id);
                } else {
                  userProvider.addFavorite(tutor.id);
                  showTopSnackBar(
                    context,
                    const CustomSnackBar.success(
                      message: "Add to Favorites successful.",
                      backgroundColor: Colors.blue,
                    ),
                    showOutAnimationDuration: const Duration(milliseconds: 1000),
                    displayDuration: const Duration(microseconds: 1000),
                  );
                }
              },
              child: exists.isEmpty
                  ? SvgPicture.asset(
                      "asset/svg/ic_heart.svg",
                      width: 35,
                      height: 35,
                      color: Colors.pink,
                    )
                  : SvgPicture.asset(
                      "asset/svg/ic_heart_fill.svg",
                      width: 35,
                      height: 35,
                      color: Colors.pink,
                    ),
            ),
          )
        ])
      ],
    );
  }
}
