
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
  // final DatePickerController _controller = DatePickerController();

  // void executeAfterBuild() {
  //   _controller.animateToSelection();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<PrayerTimesCubit>(context);
        WidgetsBinding.instance.addPostFrameCallback((_) => cubit.controller.animateToSelection());
        return DatePicker(
          DateTime(cubit.currentDate.year, cubit.currentDate.month),
          initialSelectedDate: cubit.currentDate,
          daysCount: DateUtils.getDaysInMonth(cubit.currentDate.year, cubit.currentDate.month),
          selectionColor: Colors.blueAccent,
          controller: cubit.controller,
          onDateChange: (selectedDate) {
            cubit.changeCurrentDate(selectedDate);
          },
        );
      },
    );
  }
}