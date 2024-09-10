import 'package:flutter/material.dart';
import 'package:prayer_app/features/home/presentation/widgets/custom_prayer_column.dart';

import 'custom_date_picker_widget.dart';
import 'month_controller_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MonthControllerWidget(),
        CustomDatePickerWidget(),
        CustomPrayerColumn(),
      ],
    );
  }
}
