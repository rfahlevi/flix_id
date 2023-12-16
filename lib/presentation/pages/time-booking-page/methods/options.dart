import 'package:flix_id/methods.dart';
import 'package:flix_id/presentation/widgets/selectable_card.dart';
import 'package:flutter/material.dart';

List<Widget> options<T>({
  required String title,
  required List<T> options,
  required T? selectedItem,
  String Function(T object)? converter,
  bool Function(T object)? isOptionEnable,
  required void Function(T object) onTap,
}) =>
    [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      verticalSpace(10),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: options
              .map((e) => Padding(
                    padding: EdgeInsets.only(
                      left: e == options.first ? 20 : 0,
                      right: e == options.last ? 20 : 10,
                    ),
                    child: SelectableCard(
                      isEnable: isOptionEnable?.call(e) ?? true,
                      isSelected: e == selectedItem,
                      text: converter != null ? converter(e) : e.toString(),
                      onTap: () => onTap(e),
                    ),
                  ))
              .toList(),
        ),
      ),
    ];
