import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:prayer_app/features/home/presentation/cubit/prayer_times_cubit.dart';

import '../../../../injection.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<PrayerTimesCubit>()
        ..getPrayerTimes(),
      lazy: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(DateFormat("yMMMM").format(DateTime.now())),
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
