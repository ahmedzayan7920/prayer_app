import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_app/features/home/presentation/cubit/prayer_times_cubit.dart';

import '../../../../injection.dart';
import '../widgets/app_bar_title.dart';
import '../widgets/home_view_body.dart';
import '../widgets/next_month_icon.dart';
import '../widgets/previous_month_icon.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<PrayerTimesCubit>()..getPrayerTimes(dateTime: DateTime.now()),
      lazy: false,
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(),
          actions: const [
            PreviousMonthIcon(),
            NextMonthIcon(),
          ],
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
