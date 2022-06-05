import 'package:flutter/material.dart';

import '../utils/localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations st = AppLocalizations.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          st.text('good_morning'),
        ),
      ),
    );
  }
}
