import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomPrayerItem extends StatelessWidget {
  const CustomPrayerItem({
    super.key,
    required this.title,
    required this.value,
  });

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
    return DateFormat("hh:mm a").format(DateFormat("HH:mm").parse(time));
  }
}