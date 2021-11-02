import 'package:flutter/material.dart';

import 'src/app_localizations.g.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(AppLocalizationsDetail.of(context)!.home);
  }
}
