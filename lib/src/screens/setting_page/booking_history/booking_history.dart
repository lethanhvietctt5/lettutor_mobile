import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/user/booking.dart';
import 'package:lettutor_mobile/src/provider/user_provider.dart';
import 'package:lettutor_mobile/src/screens/setting_page/booking_history/booking_item.dart';
import 'package:provider/provider.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Booking> bookingHistory = Provider.of<UserProvider>(context).user.bookingHistory;
    bookingHistory = bookingHistory.reversed.toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 20,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey[800]),
          title: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              "Booking History",
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        body: bookingHistory.isNotEmpty
            ? Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: ListView.builder(
                  itemCount: bookingHistory.length,
                  itemBuilder: (context, index) => BookingItem(
                    idTutor: bookingHistory[index].tutor.id,
                    start: bookingHistory[index].start,
                    end: bookingHistory[index].end,
                  ),
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "asset/svg/ic_empty.svg",
                        width: 200,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          "You don't have any booking...",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
