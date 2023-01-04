
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/prayer_times_cubit.dart';
import '../cubit/prayer_times_state.dart';

class CustomDatePickerWidget extends StatelessWidget {
   const CustomDatePickerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<PrayerTimesCubit>(context);
        return DatePicker(
          DateTime(DateTime.now().year, DateTime.now().month),
          initialSelectedDate: cubit.currentDate,
          daysCount: DateUtils.getDaysInMonth(DateTime.now().year, DateTime.now().month),
          selectionColor: Colors.blueAccent,
          onDateChange: (selectedDate) {
            cubit.changeCurrentDate(selectedDate);
          },
        );
      },
    );
  }
}