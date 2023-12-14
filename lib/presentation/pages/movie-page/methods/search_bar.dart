import 'package:flutter/material.dart';

Widget searchBar(BuildContext context) => Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 20 - 20 - 90,
          height: 50,
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: const Color(0XFF252836),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            style: TextStyle(color: Colors.grey.shade400),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Search movie ..',
              icon: Icon(Icons.search_rounded),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )),
            onPressed: () {},
            child: const Icon(Icons.search_rounded),
          ),
        ),
      ],
    );
