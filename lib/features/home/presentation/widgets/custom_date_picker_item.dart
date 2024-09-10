import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/prayer_times_cubit.dart';

class CustomDatePickerItem extends StatelessWidget {
  const CustomDatePickerItem({
    super.key,
    required AutoScrollController controller,
    required this.date,
  }) : _controller = controller;

  final AutoScrollController _controller;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return AutoScrollTag(
      key: ValueKey(date.day - 1),
      index: date.day - 1,
      controller: _controller,
      child: GestureDetector(
        onTap: () {
          context.read<PrayerTimesCubit>().changeCurrentDate(date);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: date == context.read<PrayerTimesCubit>().state.currentDate
                ? AppColors.secondary
                : AppColors.primary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.secondary),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat("MMM").format(date),
                style: TextStyle(
                  color:
                      date == context.read<PrayerTimesCubit>().state.currentDate
                          ? AppColors.white
                          : AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat("d").format(date),
                style: TextStyle(
                  color:
                      date == context.read<PrayerTimesCubit>().state.currentDate
                          ? AppColors.white
                          : AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat("EEE").format(date),
                style: TextStyle(
                  color:
                      date == context.read<PrayerTimesCubit>().state.currentDate
                          ? AppColors.white
                          : AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}