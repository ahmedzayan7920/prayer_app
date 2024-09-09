import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/prayer_times_cubit.dart';
import '../cubit/prayer_times_state.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PrayerTimesCubit, PrayerTimesState, DateTime>(
      selector: (state) {
        return state.currentDate;
      },
      builder: (context, currentDate) {
        return FittedBox(
          child: Text(
            DateFormat("d MMMM y ").format(currentDate),
          ),
        );
      },
    );
  }
}
