import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flutter/material.dart';

Widget movieScreen() => Container(
      width: 300,
      height: 50,
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(color: saffron, width: 3),
        ),
        gradient: LinearGradient(
          colors: [
            saffron.withOpacity(0.33),
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Your Screen',
        style: TextStyle(color: saffron),
      ),
    );
