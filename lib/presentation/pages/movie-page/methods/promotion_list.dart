import 'package:flix_id/methods.dart';
import 'package:flutter/material.dart';

List<Widget> promotionList(List<String> promotionImageFileNames) => [
      const Text(
        'Promotions',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      verticalSpace(10),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: promotionImageFileNames
                .map((e) => GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 240,
                        height: 160,
                        margin: EdgeInsets.only(right: e == promotionImageFileNames.last ? 0 : 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            placeholder: const AssetImage('assets/movie.png'),
                            image: AssetImage(e),
                            fit: BoxFit.cover,
                            placeholderFit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ))
                .toList()),
      ),
    ];
