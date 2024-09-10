import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences,
        super(AppState());
  final SharedPreferences _sharedPreferences;

  void setLocale(bool isEnglish) {
    emit(state.copyWith(isEnglish: isEnglish));
    _sharedPreferences.setBool('isEnglish', isEnglish);
  }

  getLocale() {
    bool isEnglish = _sharedPreferences.getBool('isEnglish') ?? false;
    emit(state.copyWith(isEnglish: isEnglish));
  }
}
