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
        var cubit = BlocProvider.of<PrayerTimesCubit>(context);
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPrayerItem(title: AppStrings.fajr, value: cubit.prayerTimes[cubit.currentDate.day - 1].fajr),
            const Divider(height: 30),
            CustomPrayerItem(title: AppStrings.duhr, value: cubit.prayerTimes[cubit.currentDate.day - 1].duhr),
            const Divider(height: 30),
            CustomPrayerItem(title: AppStrings.asr, value: cubit.prayerTimes[cubit.currentDate.day - 1].asr),
            const Divider(height: 30),
            CustomPrayerItem(title: AppStrings.maghreeb, value: cubit.prayerTimes[cubit.currentDate.day - 1].maghreeb),
            const Divider(height: 30),
            CustomPrayerItem(title: AppStrings.esha, value: cubit.prayerTimes[cubit.currentDate.day - 1].esha),
          ],
        );
      },
    );
  }
}