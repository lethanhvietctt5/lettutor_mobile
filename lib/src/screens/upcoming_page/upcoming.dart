import 'package:flutter/material.dart';
import 'package:lettutor_mobile/src/provider/user_provider.dart';
import 'package:lettutor_mobile/src/screens/upcoming_page/card_coming.dart';
import 'package:provider/provider.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({Key? key}) : super(key: key);

  @override
  _UpcomingPageState createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  @override
  Widget build(BuildContext context) {
    final userUpcomming = Provider.of<UserProvider>(context).user?.upcomming;

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: ListView.builder(
            itemCount: userUpcomming?.length ?? 0,
            itemBuilder: (context, index) {
              return UpComingCard(upcomming: userUpcomming![index], index: index);
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics()),
      ),
    );
  }
}
