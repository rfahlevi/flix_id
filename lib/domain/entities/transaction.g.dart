// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      uid: json['uid'] as String,
      id: json['id'] as String?,
      transactionTime: json['transactionTime'] as int?,
      transactionImage: json['transactionImage'] as String?,
      title: json['title'] as String,
      seats:
          (json['seats'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      theaterName: json['theaterName'] as String?,
      watchingTime: json['watchingTime'] as int?,
      ticketAmount: json['ticketAmount'] as int?,
      ticketPrice: json['ticketPrice'] as int?,
      adminFee: json['adminFee'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'id': instance.id,
      'transactionTime': instance.transactionTime,
      'transactionImage': instance.transactionImage,
      'title': instance.title,
      'seats': instance.seats,
      'theaterName': instance.theaterName,
      'watchingTime': instance.watchingTime,
      'ticketAmount': instance.ticketAmount,
      'ticketPrice': instance.ticketPrice,
      'adminFee': instance.adminFee,
      'total': instance.total,
    };
