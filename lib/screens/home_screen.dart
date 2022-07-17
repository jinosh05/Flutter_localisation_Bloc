import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_example/utils/localizations.dart';
import '../blocs/bloc/language_bloc.dart';
import '../models/language_model.dart';
import '../models/locale_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    LocaleModel st = AppLocalizations.of(context)!.value();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //AppLocalizations.of(context)!.text('welcome')
          st.goodMorning ?? "",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
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
                        context.read<LanguageBloc>().add(
                            ToggleLanguageEvent(Languages.languages[index]));
                        debugPrint(context
                            .read<LanguageBloc>()
                            .state
                            .locale
                            .languageCode);
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
