import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/prayer_times/prayer_times_cubit.dart';

class PreviousMonthIcon extends StatelessWidget {
  const PreviousMonthIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PrayerTimesCubit>();
    return IconButton(
      onPressed: () {
        DateTime date = DateTime(
          cubit.state.currentDate.year,
          cubit.state.currentDate.month - 1,
          1,
        );
        cubit.changeMonth(date);
      },
      icon: const Icon(Icons.arrow_back_ios),
      color: Colors.black,
    );
  }
}
