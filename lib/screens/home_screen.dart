import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_example/utils/localizations.dart';

import '../blocs/bloc/language_bloc.dart';
import '../models/language_model.dart';
import '../models/locale_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use this model to get the List of all supported words
    LocaleModel st = AppLocalizations.of(context)!.value();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          // Using LocaleModel here
          st.goodMorning ?? "",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              //
              // Directly calling Value using key
              AppLocalizations.of(context)!.text('welcome'),

              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          ListView.builder(
            itemCount: Languages.languages.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context1, state) {
                  return TextButton(
                      onPressed: () {
                        // Calling Toggle Function from here
                        context.read<LanguageBloc>().add(
                            ToggleLanguageEvent(Languages.languages[index]));
                      },
                      child: Text(Languages.languages[index].value));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
