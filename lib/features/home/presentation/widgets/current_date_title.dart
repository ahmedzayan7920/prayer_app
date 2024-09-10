import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubits/app/app_cubit.dart';
import '../cubits/app/app_state.dart';
import '../cubits/prayer_times/prayer_times_cubit.dart';
import '../cubits/prayer_times/prayer_times_state.dart';

class CurrentDateTitle extends StatelessWidget {
  const CurrentDateTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PrayerTimesCubit, PrayerTimesState, DateTime>(
      selector: (state) {
        return state.currentDate;
      },
      builder: (context, currentDate) {
        return BlocSelector<AppCubit, AppState, String>(
          selector: (state) {
            return state.isEnglish ? 'en' : 'ar';
          },
          builder: (context, locale) {
            return FittedBox(
              child: Text(
                DateFormat("d MMMM y ", locale).format(currentDate),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          },
        );
      },
    );
  }
}
