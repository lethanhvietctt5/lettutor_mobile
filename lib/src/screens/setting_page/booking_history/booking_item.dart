import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_mobile/src/data/tutors_sample.dart';
import 'package:lettutor_mobile/src/models/schedule_model/booking_info_model.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({Key? key, required this.bookingInfo}) : super(key: key);
  final BookingInfo bookingInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(right: 15),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10, right: 10),
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: CachedNetworkImage(
                          imageUrl: bookingInfo.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.avatar as String,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      )),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    bookingInfo.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name as String,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      DateFormat.yMEd().format(
                          DateFormat("yyyy-MM-dd").parse(bookingInfo.scheduleDetailInfo!.scheduleInfo!.createdAt)),
                      style: const TextStyle(fontSize: 13),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        bookingInfo.scheduleDetailInfo!.startPeriod,
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
                        bookingInfo.scheduleDetailInfo!.endPeriod,
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
    );
  }
}
