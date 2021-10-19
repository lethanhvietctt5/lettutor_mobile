import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/screens/setting/booking_history/booking_item.dart';
import 'package:lettutor_mobile/src/widgets/avatar_circle.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: const [
                  BookingItem(),
                  BookingItem(),
                  BookingItem(),
                  BookingItem(),
                  BookingItem(),
                  BookingItem(),
                  BookingItem(),
                  BookingItem(),
                  BookingItem(),
                  BookingItem(),
                  BookingItem(),
                  BookingItem(),
                  BookingItem(),
                ],
              )),
        ),
      ),
    );
  }
}
