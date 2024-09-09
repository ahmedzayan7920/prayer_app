import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/prayer_times_cubit.dart';
import '../cubit/prayer_times_state.dart';

class CustomDatePickerWidget extends StatefulWidget {
  const CustomDatePickerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDatePickerWidget> createState() => _CustomDatePickerWidgetState();
}

class _CustomDatePickerWidgetState extends State<CustomDatePickerWidget> {
  final DatePickerController _controller = DatePickerController();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PrayerTimesCubit, PrayerTimesState, DateTime>(
      selector: (state) {
        return state.currentDate;
      },
      builder: (context, currentDate) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _controller.animateToDate(currentDate));
        return DatePicker(
          currentDate.copyWith(day: 1),
          initialSelectedDate: currentDate,
          daysCount:
              DateUtils.getDaysInMonth(currentDate.year, currentDate.month),
          selectionColor: Colors.blueAccent,
          controller: _controller,
          onDateChange: (selectedDate) {
            context.read<PrayerTimesCubit>().changeCurrentDate(selectedDate);
          },
        );
      },
    );
  }
}
