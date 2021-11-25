import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_mobile/src/models/user/upcomming.dart';
import 'package:lettutor_mobile/src/provider/user_provider.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UpComingCard extends StatelessWidget {
  const UpComingCard({Key? key, required this.upcomming, required this.index}) : super(key: key);

  final Upcomming upcomming;
  final int index;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    void cancelUpcoming(int index) {
      userProvider.removeUpcomming(index);
    }

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
                  Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: AvatarCircle(width: 50, height: 50, source: upcomming.tutor.image)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          upcomming.tutor.fullName,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            DateFormat.yMEd().format(upcomming.timeStart),
                            style: const TextStyle(fontSize: 13),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              DateFormat.Hm().format(upcomming.timeStart),
                              style: const TextStyle(fontSize: 10, color: Colors.blue),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 1),
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          const Text("-"),
                          Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              DateFormat.Hm().format(upcomming.timeEnd),
                              style: const TextStyle(fontSize: 10, color: Colors.orange),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange, width: 1),
                                color: Colors.orange[50],
                                borderRadius: BorderRadius.circular(4)),
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
                    child: InkWell(
                      onTap: () {
                        cancelUpcoming(index);
                        showTopSnackBar(
                          context,
                          const CustomSnackBar.success(
                            message: "Remove upcomming successful.",
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300] as Color),
                            borderRadius:
                                const BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[Text("Cancel")],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[400] as Color),
                          color: Colors.grey[400],
                          borderRadius:
                              const BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4))),
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
