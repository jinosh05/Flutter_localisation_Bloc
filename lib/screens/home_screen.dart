import 'package:flutter/material.dart';

import '../models/locale_model.dart';
import '../utils/localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    LocaleModel st = AppLocalizations.instance.value();
    return Scaffold(
      appBar: AppBar(
        title: Text(st.welcome ?? ""),
      ),
    );
  }
}
