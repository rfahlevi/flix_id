import 'package:flix_id/methods.dart';
import 'package:flutter/material.dart';

Widget profileItem({required String title, required VoidCallback onTap}) => GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
          verticalSpace(14),
        ],
      ),
    );
