// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/extensions/build_context_extension.dart';
import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flix_id/presentation/pages/time-booking-page/methods/detail_movie_info.dart';
import 'package:flix_id/presentation/pages/time-booking-page/methods/options.dart';
import 'package:flix_id/presentation/providers/movie/time_booking_selected_provider.dart';

import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_id/presentation/widgets/back_navigation_bar.dart';
import 'package:flix_id/presentation/widgets/network_image_card.dart';
import 'package:flutter/material.dart';

import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TimeBookingPage extends ConsumerStatefulWidget {
  final MovieDetail movieDetail;
  const TimeBookingPage({
    Key? key,
    required this.movieDetail,
  }) : super(key: key);

  @override
  ConsumerState<TimeBookingPage> createState() => _TimeBookingPageState();
}

class _TimeBookingPageState extends ConsumerState<TimeBookingPage> {
  final List<String> theaters = [
    'Mega Bekasi XXI',
    'Summarecon Bekasi XXI',
    'CGV AEON JGC',
    'Courts HI XXI',
  ];

  final List<DateTime> dates = List.generate(7, (index) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return date.add(Duration(days: index));
  });

  final List<int> hours = List.generate(12, (index) => index + 11);

  @override
  Widget build(BuildContext context) {
    var selectedTheater = ref.watch(selectedProvider.select((select) => select.selectedTheater));
    var selectedDate = ref.watch(selectedProvider.select((select) => select.selectedDate));
    var selectedHour = ref.watch(selectedProvider.select((select) => select.selectedHour));
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackNavigationBar(
                  title: 'Book Your Movie',
                  onTap: () => ref.read(routerProvider).pop(),
                ),
                verticalSpace(24),
                NetworkImageCard(
                  width: MediaQuery.of(context).size.width - 40,
                  height: (MediaQuery.of(context).size.width - 40) * 0.6,
                  borderRadius: 15,
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${widget.movieDetail.backdropPath ?? widget.movieDetail.posterPath}',
                  fit: BoxFit.cover,
                ),
                verticalSpace(10),
                ...detailMovieInfo(
                  context: context,
                  movieDetail: widget.movieDetail,
                ),
              ],
            ),
          ),
          verticalSpace(24),
          ...options(
              title: 'Select a Theater',
              options: theaters,
              selectedItem: selectedTheater,
              onTap: (object) => ref.read(selectedProvider.notifier).selectTheater(object)),
          verticalSpace(20),
          ...options(
              title: 'Select Date',
              options: dates,
              selectedItem: selectedDate,
              converter: (date) => DateFormat('EEE, d MMMM yyyy').format(date),
              onTap: (date) => ref.read(selectedProvider.notifier).selectDate(date)),
          verticalSpace(20),
          ...options(
            title: 'Select Show Time',
            options: hours,
            selectedItem: selectedHour,
            isOptionEnable: (hour) =>
                selectedDate != null &&
                DateTime(selectedDate.year, selectedDate.month, selectedDate.day, hour)
                    .isAfter(DateTime.now()),
            converter: (hour) => '$hour:00',
            onTap: (hour) => ref.read(selectedProvider.notifier).selectHour(hour),
          ),
          verticalSpace(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                if (selectedTheater == null || selectedDate == null || selectedHour == null) {
                  context.showSnackbar('Please select all options');
                } else {
                  Transaction transaction = Transaction(
                    uid: ref.read(userDataProvider).value!.uid,
                    title: widget.movieDetail.title,
                    adminFee: 3000,
                    total: 0,
                    watchingTime: DateTime(
                            selectedDate.year, selectedDate.month, selectedDate.day, selectedHour)
                        .millisecondsSinceEpoch,
                    transactionImage: widget.movieDetail.posterPath,
                    theaterName: selectedTheater,
                  );

                  ref.read(routerProvider).pushNamed(
                    'seat-booking',
                    extra: (widget.movieDetail, transaction),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: backgroundColor,
                  backgroundColor: saffron,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              child: const Text('Next'),
            ),
          )
        ],
      ),
    );
  }
}
