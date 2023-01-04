import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../cubit/prayer_times_cubit.dart';
import '../cubit/prayer_times_state.dart';
import 'custom_failure_widget.dart';
import 'custom_success_widget.dart';

class CustomPrayerColumn extends StatelessWidget {
  const CustomPrayerColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
          builder: (context, state) {
            var cubit = BlocProvider.of<PrayerTimesCubit>(context);
            if(cubit.prayerTimes.isNotEmpty){
              return const CustomSuccessWidget();
            }else{
              if (state is PrayerTimesFailureState) {
                return CustomFailureWidget(message: state.message);
              } else {
                return const CustomLoadingWidget();
              }
            }
          },
        ),
      ),
    );
  }
}