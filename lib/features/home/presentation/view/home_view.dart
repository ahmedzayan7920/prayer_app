import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:prayer_app/features/home/presentation/cubit/prayer_times_cubit.dart';

import '../../../../injection.dart';
import '../cubit/prayer_times_state.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PrayerTimesCubit>()..getPrayerTimes(),
      lazy: false,
      child: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<PrayerTimesCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(DateFormat("d MMMM y ").format(cubit.currentDate)),
              actions: [
                IconButton(
                  onPressed: () {
                    DateTime date = DateTime(
                        cubit.currentDate.year, cubit.currentDate.month - 1, 1);
                    cubit.changeMonth(date);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {
                    DateTime date = DateTime(
                        cubit.currentDate.year, cubit.currentDate.month + 1, 1);
                    cubit.changeMonth(date);
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: Colors.black,
                ),
              ],
            ),
            body: const HomeViewBody(),
          );
        },
      ),
    );
  }
}
