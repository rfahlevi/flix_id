// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/extensions/build_context_extension.dart';
import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flix_id/presentation/pages/seat-booking-page/methods/seat_section.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flix_id/presentation/widgets/seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/domain/entities/transaction.dart';

import 'methods/legend.dart';
import 'methods/movie_screen.dart';

class SeatBookingPage extends ConsumerStatefulWidget {
  final (MovieDetail, Transaction) transactionDetail;
  const SeatBookingPage({
    super.key,
    required this.transactionDetail,
  });

  @override
  ConsumerState<SeatBookingPage> createState() => _SeatBookingPageState();
}

class _SeatBookingPageState extends ConsumerState<SeatBookingPage> {
  List<int> selectedSeats = [];
  List<int> reservedSeats = [];

  @override
  void initState() {
    Random random = Random();
    int reservedNumber = random.nextInt(36) + 1;

    while (reservedSeats.length < 8) {
      if (!reservedSeats.contains(reservedNumber)) {
        reservedSeats.add(reservedNumber);
      } else {
        reservedNumber = random.nextInt(36) + 1;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final (movieDetail, transaction) = widget.transactionDetail;
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              BackNavigationBar(
                title: movieDetail.title,
                onTap: () => ref.read(routerProvider).pop(),
              ),
              movieScreen(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  seatSection(
                      seatNumbers: List.generate(30, (index) => index + 1),
                      onTap: onSeatTap,
                      seatStatusChecker: seatStatusChecker),
                  horizontalSpaces(30),
                  seatSection(
                      seatNumbers: List.generate(30, (index) => index + 31),
                      onTap: onSeatTap,
                      seatStatusChecker: seatStatusChecker),
                ],
              ),
              verticalSpace(20),
              legend(),
              verticalSpace(40),
              Text(
                '${selectedSeats.length} seats selected',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (selectedSeats.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Seat Number : ',
                      style: TextStyle(fontSize: 16),
                    ),
                    ...selectedSeats
                        .map(
                          (e) => Text(
                            '$e${e == selectedSeats.last ? '' : ' , '}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold, color: saffron),
                          ),
                        )
                        .toList(),
                  ],
                ),
              verticalSpace(40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedSeats.isEmpty) {
                      context.showSnackbar('Please select at least one seat');
                    } else {
                      var transactionResult = transaction.copyWith(
                        seats: selectedSeats.map((e) => '$e').toList(),
                        ticketAmount: selectedSeats.length,
                        ticketPrice: 50000,
                      );

                      ref.read(routerProvider).pushNamed(
                        'booking-confirmation',
                        extra: (movieDetail, transactionResult),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: saffron,
                    foregroundColor: backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Next'),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }

  void onSeatTap(seatNumber) {
    if (!selectedSeats.contains(seatNumber)) {
      setState(() {
        selectedSeats.add(seatNumber);
        selectedSeats.sort();
      });
    } else {
      setState(() {
        selectedSeats.remove(seatNumber);
      });
    }
  }

  SeatStatus seatStatusChecker(seatNumber) => reservedSeats.contains(seatNumber)
      ? SeatStatus.reserved
      : selectedSeats.contains(seatNumber)
          ? SeatStatus.selected
          : SeatStatus.available;
}
