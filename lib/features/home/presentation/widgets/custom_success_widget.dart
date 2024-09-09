import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_app/core/utils/app_strings.dart';

import '../cubit/prayer_times_cubit.dart';
import '../cubit/prayer_times_state.dart';
import 'custom_prayer_item.dart';

class CustomSuccessWidget extends StatelessWidget {
  const CustomSuccessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
      builder: (context, state) {
        var day = state.currentDate.day - 1;
        var prayerTimes = state.prayerTimes[day];
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPrayerItem(title: AppStrings.fajr, value: prayerTimes.fajr),
            const Divider(height: 30),
            CustomPrayerItem(title: AppStrings.duhr, value: prayerTimes.duhr),
            const Divider(height: 30),
            CustomPrayerItem(title: AppStrings.asr, value: prayerTimes.asr),
            const Divider(height: 30),
            CustomPrayerItem(title: AppStrings.maghreeb, value: prayerTimes.maghreeb),
            const Divider(height: 30),
            CustomPrayerItem(title: AppStrings.esha, value: prayerTimes.esha),
          ],
        );
      },
    );
  }
}