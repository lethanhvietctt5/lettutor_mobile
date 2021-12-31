import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_mobile/src/helpers/generate_ratio.dart';
import 'package:lettutor_mobile/src/models/schedule_model/schedule_detail_model.dart';
import 'package:lettutor_mobile/src/models/schedule_model/schedule_model.dart';
import 'package:lettutor_mobile/src/provider/auth_provider.dart';
import 'package:lettutor_mobile/src/services/schedule_service.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class BookingFeature extends StatefulWidget {
  const BookingFeature({Key? key, required this.tutorId}) : super(key: key);

  final String tutorId;

  @override
  State<BookingFeature> createState() => _BookingFeatureState();
}

class _BookingFeatureState extends State<BookingFeature> {
  List<Schedule> _schedules = [];
  bool isLoading = true;

  void fetchSchedules(String token) async {
    List<Schedule> res = await ScheduleService.getTutorSchedule(widget.tutorId, token);
    res = res.where((schedule) => schedule.startTimestamp > DateTime.now().millisecondsSinceEpoch).toList();
    res.sort((s1, s2) => s1.startTimestamp.compareTo(s2.startTimestamp));

    List<Schedule> tempRes = [];

    for (int index = 0; index < res.length; index++) {
      bool isExist = false;
      for (int index_2 = 0; index_2 < tempRes.length; index_2++) {
        final DateTime first = DateTime.fromMillisecondsSinceEpoch(res[index].startTimestamp);
        final DateTime second = DateTime.fromMillisecondsSinceEpoch(tempRes[index_2].startTimestamp);
        if (first.day == second.day && first.month == second.month && first.year == second.year) {
          tempRes[index_2].scheduleDetails.addAll(res[index].scheduleDetails);
          isExist = true;
          break;
        }
      }

      if (!isExist) {
        tempRes.add(res[index]);
      }
    }
    setState(() {
      _schedules = tempRes;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (mounted && isLoading) {
      fetchSchedules(authProvider.tokens!.access.token);
      isLoading = false;
    }

    Future showTutorTimePicker(Schedule schedules) {
      List<ScheduleDetails> scheduleDetails = schedules.scheduleDetails;

      return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        isScrollControlled: true,
        builder: (context) {
          return SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) => Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              "Select available schedule",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(color: Colors.grey[300])),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                        child: GridView.count(
                          crossAxisCount: generateAsisChildRatio(constraints)[0].toInt(),
                          childAspectRatio: (1 / generateAsisChildRatio(constraints)[1]),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          children: List.generate(
                            scheduleDetails.length,
                            (index) => ElevatedButton(
                              onPressed: !scheduleDetails[index].isBooked
                                  ? () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);

                                      showTopSnackBar(
                                        context,
                                        const CustomSnackBar.success(
                                          message: "Booking successful. ",
                                          backgroundColor: Colors.green,
                                        ),
                                        showOutAnimationDuration: const Duration(milliseconds: 700),
                                        displayDuration: const Duration(milliseconds: 200),
                                      );
                                    }
                                  : null,
                              child: !scheduleDetails[index].isBooked
                                  ? Container(
                                      padding: const EdgeInsets.only(top: 13, bottom: 13),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            scheduleDetails[index].startPeriod + " - ",
                                            style: const TextStyle(color: Colors.blue),
                                          ),
                                          Text(
                                            scheduleDetails[index].endPeriod,
                                            style: const TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    )
                                  : const Text("Reserved", style: TextStyle(color: Colors.blue)),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  side: BorderSide(color: Colors.blue, width: 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    Future showTutorDatePicker() {
      return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        isScrollControlled: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) => Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.6,
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Text("Select available schedule",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        decoration: BoxDecoration(color: Colors.grey[300])),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                        child: GridView.count(
                          crossAxisCount: generateAsisChildRatio(constraints)[0].toInt(),
                          childAspectRatio: (1 / generateAsisChildRatio(constraints)[1]),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          children: List.generate(
                            _schedules.length,
                            (index) => ElevatedButton(
                              onPressed: () {
                                showTutorTimePicker(_schedules[index]);
                              },
                              child: Container(
                                padding: const EdgeInsets.only(top: 13, bottom: 13),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat.yMd().format(
                                        DateTime.fromMillisecondsSinceEpoch(_schedules[index].startTimestamp),
                                      ),
                                      style: const TextStyle(color: Colors.blue),
                                    )
                                  ],
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  side: BorderSide(color: Colors.blue, width: 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: () {
              showTutorDatePicker();
            },
            child: Container(
              padding: const EdgeInsets.only(top: 13, bottom: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text("Booking", style: TextStyle(color: Colors.white))],
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1000))),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SvgPicture.asset("asset/svg/ic_message2.svg", color: Colors.blue),
                  const Text("Message", style: TextStyle(color: Colors.blue, fontSize: 14))
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset("asset/svg/ic_report.svg", color: Colors.blue),
                  const Text("Report", style: TextStyle(color: Colors.blue, fontSize: 14))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
