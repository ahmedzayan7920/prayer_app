import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/prayer_times_cubit.dart';

class NextMonthIcon extends StatelessWidget {
  const NextMonthIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PrayerTimesCubit>();
    return IconButton(
      onPressed: () {
        DateTime date = DateTime(
          cubit.state.currentDate.year,
          cubit.state.currentDate.month + 1,
          1,
        );
        cubit.changeMonth(date);
      },
      icon: const Icon(Icons.arrow_forward_ios),
      color: Colors.black,
    );
  }
}