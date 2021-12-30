import 'package:lettutor_mobile/src/models/schedule_model/booking_info_model.dart';

class ScheduleDetails {
  late int startPeriodTimestamp;
  late int endPeriodTimestamp;
  late String id;
  late String scheduleId;
  late String startPeriod;
  late String endPeriod;
  late String createdAt;
  late String updatedAt;
  late List<BookingInfo> bookingInfo;
  late bool isBooked;

  ScheduleDetails({
    required this.startPeriodTimestamp,
    required this.endPeriodTimestamp,
    required this.id,
    required this.scheduleId,
    required this.startPeriod,
    required this.endPeriod,
    required this.createdAt,
    required this.updatedAt,
    required this.bookingInfo,
    required this.isBooked,
  });

  ScheduleDetails.fromJson(Map<String, dynamic> json) {
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    scheduleId = json['scheduleId'];
    startPeriod = json['startPeriod'];
    endPeriod = json['endPeriod'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['bookingInfo'] != null) {
      bookingInfo = [];
      json['bookingInfo'].forEach((v) {
        bookingInfo.add(BookingInfo.fromJson(v));
      });
    }
    isBooked = json['isBooked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['startPeriodTimestamp'] = startPeriodTimestamp;
    data['endPeriodTimestamp'] = endPeriodTimestamp;
    data['id'] = id;
    data['scheduleId'] = scheduleId;
    data['startPeriod'] = startPeriod;
    data['endPeriod'] = endPeriod;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['bookingInfo'] = bookingInfo.map((v) => v.toJson()).toList();
    data['isBooked'] = isBooked;
    return data;
  }
}
