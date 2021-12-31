import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/schedule_model/booking_info_model.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/screens/setting_page/booking_history/booking_item.dart';
import 'package:lettutor_mobile/src/services/schedule_service.dart';
import 'package:provider/provider.dart';

class BookingHistoryPage extends StatefulWidget {
  const BookingHistoryPage({Key? key}) : super(key: key);

  @override
  State<BookingHistoryPage> createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  List<BookingInfo> _bookedList = [];
  bool isLoading = true;

  void fetchBookedList(String userId, String token) async {
    final res = await ScheduleService.getStudentBookedClass(userId, token);
    setState(() {
      _bookedList = res;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (isLoading) {
      fetchBookedList(authProvider.userLoggedIn.id, authProvider.tokens!.access.token);
    }

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
        body: _bookedList.isNotEmpty
            ? Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: ListView.builder(
                  itemCount: _bookedList.length,
                  itemBuilder: (context, index) => BookingItem(bookingInfo: _bookedList[index]),
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
