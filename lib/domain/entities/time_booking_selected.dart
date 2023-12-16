import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_booking_selected.freezed.dart';
part 'time_booking_selected.g.dart';

@freezed
class TimeBookingSelected with _$TimeBookingSelected {
  factory TimeBookingSelected({
    String? selectedTheater,
    DateTime? selectedDate,
    int? selectedHour,
  }) = _TimeBookingSelected;

  factory TimeBookingSelected.fromJson(Map<String, dynamic> json) =>
      _$TimeBookingSelectedFromJson(json);
}
