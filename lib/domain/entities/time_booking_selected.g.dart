// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_booking_selected.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeBookingSelectedImpl _$$TimeBookingSelectedImplFromJson(
        Map<String, dynamic> json) =>
    _$TimeBookingSelectedImpl(
      selectedTheater: json['selectedTheater'] as String?,
      selectedDate: json['selectedDate'] == null
          ? null
          : DateTime.parse(json['selectedDate'] as String),
      selectedHour: json['selectedHour'] as int?,
    );

Map<String, dynamic> _$$TimeBookingSelectedImplToJson(
        _$TimeBookingSelectedImpl instance) =>
    <String, dynamic>{
      'selectedTheater': instance.selectedTheater,
      'selectedDate': instance.selectedDate?.toIso8601String(),
      'selectedHour': instance.selectedHour,
    };
