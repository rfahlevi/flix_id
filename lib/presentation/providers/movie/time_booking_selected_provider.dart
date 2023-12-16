import 'package:flix_id/domain/entities/time_booking_selected.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeBookingSelectedProvider extends StateNotifier<TimeBookingSelected> {
  TimeBookingSelectedProvider()
      : super(TimeBookingSelected(
          selectedDate: null,
          selectedHour: null,
          selectedTheater: null,
        ));

  void selectTheater(String theater) => state = state.copyWith(selectedTheater: theater);
  void selectDate(DateTime date) => state = state.copyWith(selectedDate: date);
  void selectHour(int hour) => state = state.copyWith(selectedHour: hour);
}

final selectedProvider =
    StateNotifierProvider.autoDispose<TimeBookingSelectedProvider, TimeBookingSelected>(
        (ref) => TimeBookingSelectedProvider());
