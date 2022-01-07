import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/models/schedule_model/booking_info_model.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/provider/user_provider.dart';
import 'package:lettutor_mobile/src/screens/setting_page/session_history/session_item.dart';
import 'package:lettutor_mobile/src/services/schedule_service.dart';
import 'package:provider/provider.dart';

class SessionHistoryPage extends StatefulWidget {
  const SessionHistoryPage({Key? key}) : super(key: key);

  @override
  State<SessionHistoryPage> createState() => _SessionHistoryPageState();
}

class _SessionHistoryPageState extends State<SessionHistoryPage> {
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
              "Session History",
              style: TextStyle(color: Colors.grey[800]),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: ListView.builder(
            itemCount: _bookedList.length,
            itemBuilder: (context, index) => SessionItem(
              session: _bookedList[index],
            ),
          ),
        ),
      ),
    );
  }
}
