import 'package:flutter/material.dart';

import 'current_date_title.dart';
import 'next_month_icon.dart';
import 'previous_month_icon.dart';

class MonthControllerWidget extends StatelessWidget {
  const MonthControllerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.only(start: 16),
      child: Row(
        children: [
          CurrentDateTitle(),
          Spacer(),
          PreviousMonthIcon(),
          NextMonthIcon(),
        ],
      ),
    );
  }
}
