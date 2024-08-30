import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_example/screens/home_screen.dart';
import 'package:localization_example/utils/localizations.dart';

import 'blocs/bloc/language_bloc.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //
        //  Language Bloc
        //
        BlocProvider(
          create: (context) => LanguageBloc(),
        )
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        // Condition for rebuilding of the widgets
        buildWhen: (previousState, currentState) =>
            previousState != currentState,

        builder: (_, state) {
          return MaterialApp(
            localizationsDelegates: const [
              AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en', 'IN'), Locale('ar', "AE")],
            localeResolutionCallback:
                (Locale? locale, Iterable<Locale> supportedLocales) {
              for (Locale supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale!.languageCode ||
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            locale: Locale(state.locale.code, state.locale.value),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
