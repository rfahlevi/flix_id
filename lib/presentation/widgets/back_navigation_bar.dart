// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flix_id/methods.dart';
import 'package:flutter/material.dart';

class BackNavigationBar extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const BackNavigationBar({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: 40,
            height: 40,
            child: Image.asset(
              'assets/back.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        horizontalSpaces(20),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
