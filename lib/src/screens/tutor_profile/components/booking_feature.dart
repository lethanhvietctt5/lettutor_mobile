import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_mobile/src/models/tutor/schedule.dart';
import 'package:lettutor_mobile/src/models/tutor/tutor.dart';
import 'package:lettutor_mobile/src/models/user/booking.dart';
import 'package:lettutor_mobile/src/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class BookingFeature extends StatelessWidget {
  const BookingFeature({Key? key, required this.tutor}) : super(key: key);

  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    List<DateTime> distinctDates = getDisticntDate(tutor.dateAvailable.map((e) => e.start).toList());
    final userProvider = Provider.of<UserProvider>(context);

    Future showTutorTimePicker(DateTime date) {
      List<Schedule> selectedDate = tutor.dateAvailable
          .where((d) => d.start.day == date.day && d.start.month == date.month && d.start.day == date.day)
          .toList();

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
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                height: MediaQuery.of(context).size.height * 0.6,
                child: GridView.count(
                  crossAxisCount: generateAsisChildRatio(constraints)[0].toInt(),
                  childAspectRatio: (1 / generateAsisChildRatio(constraints)[1]),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(
                    selectedDate.length,
                    (index) => ElevatedButton(
                      onPressed: selectedDate[index].isReserved == false
                          ? () {
                              Booking newBooking = Booking(
                                id: uuid.v4(),
                                tutor: tutor,
                                start: selectedDate[index].start,
                                end: selectedDate[index].end,
                                idSchedule: selectedDate[index].id,
                              );

                              userProvider.addBooking(newBooking);
                              tutor.setReserved(selectedDate[index].id, true);
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
                      child: selectedDate[index].isReserved == false
                          ? Container(
                              padding: const EdgeInsets.only(top: 13, bottom: 13),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat.Hm().format(selectedDate[index].start),
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                  Text(
                                    " - " + DateFormat.Hm().format(selectedDate[index].end),
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            )
                          : const Text(
                              "Reserved",
                              style: TextStyle(color: Colors.blue),
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
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                height: MediaQuery.of(context).size.height * 0.6,
                constraints: const BoxConstraints(maxWidth: 1000),
                child: GridView.count(
                  crossAxisCount: generateAsisChildRatio(constraints)[0].toInt(),
                  childAspectRatio: (1 / generateAsisChildRatio(constraints)[1]),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(
                    distinctDates.length,
                    (index) => ElevatedButton(
                      onPressed: () {
                        showTutorTimePicker(distinctDates[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 13, bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat.yMd().format(distinctDates[index]),
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
                children: const [
                  Text(
                    "Booking",
                    style: TextStyle(color: Colors.white),
                  )
                ],
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
                  SvgPicture.asset(
                    "asset/svg/ic_message2.svg",
                    color: Colors.blue,
                  ),
                  const Text(
                    "Message",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  )
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset(
                    "asset/svg/ic_report.svg",
                    color: Colors.blue,
                  ),
                  const Text(
                    "Report",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

List<DateTime> getDisticntDate(List<DateTime> dates) {
  List<DateTime> distinctDates = [];
  bool isDuplicate = false;

  for (DateTime d1 in dates) {
    isDuplicate = false;
    for (DateTime d2 in distinctDates) {
      if (d1.day == d2.day && d1.month == d2.month && d1.year == d2.year) {
        isDuplicate = true;
        break;
      }
    }

    if (isDuplicate == false) {
      distinctDates.add(d1);
    }
  }

  return distinctDates;
}

List<double> generateAsisChildRatio(BoxConstraints constraints) {
  if (constraints.maxWidth > 1024) {
    return [8, .3];
  } else if (constraints.maxWidth > 700) {
    return [5, .3];
  } else if (constraints.maxWidth > 600) {
    return [4, .3];
  } else if (constraints.maxWidth > 500) {
    return [3, .3];
  } else if (constraints.maxWidth > 300) {
    return [2, .3];
  } else {
    return [1, .2];
  }
}
