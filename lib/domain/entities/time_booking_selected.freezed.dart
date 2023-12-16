// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_booking_selected.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeBookingSelected _$TimeBookingSelectedFromJson(Map<String, dynamic> json) {
  return _TimeBookingSelected.fromJson(json);
}

/// @nodoc
mixin _$TimeBookingSelected {
  String? get selectedTheater => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  int? get selectedHour => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeBookingSelectedCopyWith<TimeBookingSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeBookingSelectedCopyWith<$Res> {
  factory $TimeBookingSelectedCopyWith(
          TimeBookingSelected value, $Res Function(TimeBookingSelected) then) =
      _$TimeBookingSelectedCopyWithImpl<$Res, TimeBookingSelected>;
  @useResult
  $Res call(
      {String? selectedTheater, DateTime? selectedDate, int? selectedHour});
}

/// @nodoc
class _$TimeBookingSelectedCopyWithImpl<$Res, $Val extends TimeBookingSelected>
    implements $TimeBookingSelectedCopyWith<$Res> {
  _$TimeBookingSelectedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTheater = freezed,
    Object? selectedDate = freezed,
    Object? selectedHour = freezed,
  }) {
    return _then(_value.copyWith(
      selectedTheater: freezed == selectedTheater
          ? _value.selectedTheater
          : selectedTheater // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedHour: freezed == selectedHour
          ? _value.selectedHour
          : selectedHour // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeBookingSelectedImplCopyWith<$Res>
    implements $TimeBookingSelectedCopyWith<$Res> {
  factory _$$TimeBookingSelectedImplCopyWith(_$TimeBookingSelectedImpl value,
          $Res Function(_$TimeBookingSelectedImpl) then) =
      __$$TimeBookingSelectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? selectedTheater, DateTime? selectedDate, int? selectedHour});
}

/// @nodoc
class __$$TimeBookingSelectedImplCopyWithImpl<$Res>
    extends _$TimeBookingSelectedCopyWithImpl<$Res, _$TimeBookingSelectedImpl>
    implements _$$TimeBookingSelectedImplCopyWith<$Res> {
  __$$TimeBookingSelectedImplCopyWithImpl(_$TimeBookingSelectedImpl _value,
      $Res Function(_$TimeBookingSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTheater = freezed,
    Object? selectedDate = freezed,
    Object? selectedHour = freezed,
  }) {
    return _then(_$TimeBookingSelectedImpl(
      selectedTheater: freezed == selectedTheater
          ? _value.selectedTheater
          : selectedTheater // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedHour: freezed == selectedHour
          ? _value.selectedHour
          : selectedHour // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeBookingSelectedImpl implements _TimeBookingSelected {
  _$TimeBookingSelectedImpl(
      {this.selectedTheater, this.selectedDate, this.selectedHour});

  factory _$TimeBookingSelectedImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeBookingSelectedImplFromJson(json);

  @override
  final String? selectedTheater;
  @override
  final DateTime? selectedDate;
  @override
  final int? selectedHour;

  @override
  String toString() {
    return 'TimeBookingSelected(selectedTheater: $selectedTheater, selectedDate: $selectedDate, selectedHour: $selectedHour)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeBookingSelectedImpl &&
            (identical(other.selectedTheater, selectedTheater) ||
                other.selectedTheater == selectedTheater) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedHour, selectedHour) ||
                other.selectedHour == selectedHour));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedTheater, selectedDate, selectedHour);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeBookingSelectedImplCopyWith<_$TimeBookingSelectedImpl> get copyWith =>
      __$$TimeBookingSelectedImplCopyWithImpl<_$TimeBookingSelectedImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeBookingSelectedImplToJson(
      this,
    );
  }
}

abstract class _TimeBookingSelected implements TimeBookingSelected {
  factory _TimeBookingSelected(
      {final String? selectedTheater,
      final DateTime? selectedDate,
      final int? selectedHour}) = _$TimeBookingSelectedImpl;

  factory _TimeBookingSelected.fromJson(Map<String, dynamic> json) =
      _$TimeBookingSelectedImpl.fromJson;

  @override
  String? get selectedTheater;
  @override
  DateTime? get selectedDate;
  @override
  int? get selectedHour;
  @override
  @JsonKey(ignore: true)
  _$$TimeBookingSelectedImplCopyWith<_$TimeBookingSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
