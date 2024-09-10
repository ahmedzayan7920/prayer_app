import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../cubits/prayer_times/prayer_times_cubit.dart';
import '../cubits/prayer_times/prayer_times_state.dart';
import 'custom_date_picker_item.dart';

class CustomDatePickerWidget extends StatefulWidget {
  const CustomDatePickerWidget({
    super.key,
  });

  @override
  State<CustomDatePickerWidget> createState() => _CustomDatePickerWidgetState();
}

class _CustomDatePickerWidgetState extends State<CustomDatePickerWidget> {
  final AutoScrollController _controller = AutoScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PrayerTimesCubit, PrayerTimesState, DateTime>(
      selector: (state) {
        return state.currentDate;
      },
      builder: (context, currentDate) {
        _makeSelectedDateInCenter(currentDate);
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          controller: _controller,
          child: Row(
            children: List.generate(
              DateUtils.getDaysInMonth(currentDate.year, currentDate.month),
              (index) {
                DateTime date = currentDate.copyWith(day: index + 1);

                return CustomDatePickerItem(
                  controller: _controller,
                  date: date,
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _makeSelectedDateInCenter(DateTime currentDate) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _controller.scrollToIndex(
        currentDate.day - 1,
        preferPosition: AutoScrollPosition.middle,
      ),
    );
  }
}
