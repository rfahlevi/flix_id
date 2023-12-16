import 'package:flix_id/presentation/widgets/seat.dart';
import 'package:flutter/material.dart';

Widget seatSection({
  required List<int> seatNumbers,
  required void Function(int seatNumber) onTap,
  required SeatStatus Function(int seatNumber) seatStatusChecker,
}) =>
    SizedBox(
      height: 400,
      width: 120,
      child: Wrap(
        spacing: 10,
        runAlignment: WrapAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: seatNumbers
            .map((number) => Seat(
                  number: number,
                  seatStatus: seatStatusChecker(number),
                  onTap: () => onTap(number),
                ))
            .toList(),
      ),
    );
