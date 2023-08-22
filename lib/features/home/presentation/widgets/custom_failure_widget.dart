import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_app/core/utils/app_strings.dart';

import '../cubit/prayer_times_cubit.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<PrayerTimesCubit>(context).getPrayerTimes();
            },
            child: const Text(AppStrings.retry),
          ),
        ],
      ),
    );
  }
}
