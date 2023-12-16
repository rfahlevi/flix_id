import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flutter/material.dart';

enum SeatStatus { available, reserved, selected }

class Seat extends StatelessWidget {
  final int? number;
  final SeatStatus seatStatus;
  final double size;
  final VoidCallback? onTap;
  const Seat({
    super.key,
    this.number,
    this.seatStatus = SeatStatus.available,
    this.size = 30,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: seatStatus == SeatStatus.available
              ? Colors.white
              : seatStatus == SeatStatus.reserved
                  ? Colors.grey
                  : saffron,
        ),
        child: Center(
          child: Text(
            number?.toString() ?? '',
            style: const TextStyle(
              color: backgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
