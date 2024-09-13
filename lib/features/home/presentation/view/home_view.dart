import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/prayer_times/prayer_times_cubit.dart';
import '../../../../generated/l10n.dart';

import '../../../../injection.dart';
import '../cubits/app/app_cubit.dart';
import '../cubits/app/app_state.dart';
import '../widgets/home_view_body.dart';

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
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).arabic),
              BlocSelector<AppCubit, AppState, bool>(
                selector: (state) {
                  return state.isEnglish;
                },
                builder: (context, isEnglish) {
                  return Switch(
                    value: isEnglish,
                    onChanged: (value) {
                      context.read<AppCubit>().setLocale(value);
                    },
                  );
                },
              ),
              Text(S.of(context).english),
            ],
          ),
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
