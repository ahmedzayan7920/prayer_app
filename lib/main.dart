import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/app_theme.dart';
import 'features/home/presentation/cubits/app/app_cubit.dart';
import 'features/home/presentation/view/home_view.dart';
import 'simple_bloc_observer.dart';

import 'features/home/presentation/cubits/app/app_state.dart';
import 'generated/l10n.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<AppCubit>()..getLocale(),
      child: BlocSelector<AppCubit, AppState, String>(
        selector: (state) {
          return state.isEnglish ? 'en' : 'ar';
        },
        builder: (context, locale) {
          return MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            locale: Locale(locale),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
