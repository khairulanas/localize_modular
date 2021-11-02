import 'package:flutter/material.dart';
import 'package:home/app_localizations.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(AppLocalizationsHome.of(context)!.home);
  }
}
