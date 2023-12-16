import 'dart:math';

import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flutter/material.dart';

Widget membershipBanner() => Align(
      alignment: Alignment.centerRight,
      child: Transform.rotate(
        angle: pi / 2,
        origin: const Offset(17.5, 17.5),
        child: Container(
          width: 100,
          height: 30,
          decoration: const BoxDecoration(
            color: saffron,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
            ),
          ),
          alignment: Alignment.center,
          child: const Text(
            'PRIORITY',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
