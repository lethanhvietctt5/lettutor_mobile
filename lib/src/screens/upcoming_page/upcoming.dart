import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor_mobile/src/models/schedule_model/booking_info_model.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/screens/upcoming_page/card_coming.dart';
import 'package:lettutor_mobile/src/services/schedule_service.dart';
import 'package:provider/provider.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({Key? key}) : super(key: key);

  @override
  _UpcomingPageState createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  bool _isLoading = true;
  List<BookingInfo> _upcomming = [];

  void fetchUpcomming(String token) async {
    setState(() {
      _isLoading = true;
    });
    final res = await ScheduleService.getUpcomming(token);
    if (mounted && _isLoading) {
      setState(() {
        _upcomming = res;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    if (_isLoading) {
      fetchUpcomming(authProvider.tokens!.access.token);
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: _upcomming.isNotEmpty
            ? ListView.builder(
                itemCount: _upcomming.length,
                itemBuilder: (context, index) {
                  return UpComingCard(
                    upcomming: _upcomming[index],
                    refetch: fetchUpcomming,
                  );
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                          "You don't have any upcomming...",
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
