import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_example/screens/home_screen.dart';
import 'package:localization_example/utils/localizations.dart';
// import 'package:localization_example/utils/Localization/app_localizations_delegate.dart';

import 'blocs/bloc/language_bloc.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageBloc(),
        )
      ],
      // create: (context) => LanguageBloc(),
      child: BlocBuilder<LanguageBloc, LanguageState>(
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
            supportedLocales: const [Locale('en', ''), Locale('ar', '')],
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
            locale: state.locale,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
