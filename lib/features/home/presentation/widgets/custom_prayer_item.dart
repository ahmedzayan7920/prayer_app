import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomPrayerItem extends StatelessWidget {
  const CustomPrayerItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        Text(
          formatTime(value),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  formatTime(String time) {
    return DateFormat("hh:mm a").format(DateFormat("hh:mm").parse(time));
  }
}