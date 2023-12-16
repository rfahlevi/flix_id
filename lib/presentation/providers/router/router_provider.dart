import 'dart:io';

import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/domain/entities/transaction.dart';
import 'package:flix_id/presentation/pages/booking-confirmation-page/booking_confirmation_page.dart';
import 'package:flix_id/presentation/pages/detail-page/detail_page.dart';
import 'package:flix_id/presentation/pages/login-page/login_page.dart';
import 'package:flix_id/presentation/pages/main-page/main_page.dart';
import 'package:flix_id/presentation/pages/register-page/register_page.dart';
import 'package:flix_id/presentation/pages/seat-booking-page/seat_booking_page.dart';
import 'package:flix_id/presentation/pages/ticket-page/ticket_page.dart';
import 'package:flix_id/presentation/pages/time-booking-page/time_booking_page.dart';
import 'package:flix_id/presentation/pages/wallet-page/wallet_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      initialLocation: '/login',
      debugLogDiagnostics: false,
      routes: [
        GoRoute(
          path: '/main',
          name: 'main',
          builder: (context, state) =>
              MainPage(imageFile: state.extra == null ? null : state.extra as File),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: '/register',
          name: 'register',
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: '/detail',
          name: 'detail',
          builder: (context, state) => DetailPage(movie: state.extra as Movie),
        ),
        GoRoute(
          path: '/time-booking',
          name: 'time-booking',
          builder: (context, state) => TimeBookingPage(movieDetail: state.extra as MovieDetail),
        ),
        GoRoute(
          path: '/seat-booking',
          name: 'seat-booking',
          builder: (context, state) =>
              SeatBookingPage(transactionDetail: state.extra as (MovieDetail, Transaction)),
        ),
        GoRoute(
          path: '/booking-confirmation',
          name: 'booking-confirmation',
          builder: (context, state) =>
              BookingConfirmationPage(transactionDetail: state.extra as (MovieDetail, Transaction)),
        ),
        GoRoute(
          path: '/ticket',
          name: 'ticket',
          builder: (context, state) => const TicketPage(),
        ),
        GoRoute(
          path: '/wallet',
          name: 'wallet',
          builder: (context, state) => const WalletPage(),
        ),
      ],
    );
