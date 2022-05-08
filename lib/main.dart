import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:private_markdown_writer/widgets/container/memo/page.dart';
import 'package:private_markdown_writer/widgets/container/memo_list/page.dart';

import 'logger/logger.dart';

void main() {
  runApp(ProviderScope(
    observers: [ProviderLogger()],
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final darkTheme = ThemeData(
      brightness: Brightness.dark,
    );
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', ''),
        Locale('en', ''),
      ],
      onGenerateTitle: (context) => AppLocalizations.of(context)?.appTitle ?? "",
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
      ),
      // primarySwatch not works on dark theme: https://github.com/flutter/flutter/issues/26323
      darkTheme: darkTheme.copyWith(
        indicatorColor: Colors.deepOrange[600],
        colorScheme: darkTheme.colorScheme.copyWith(
          primary: Colors.deepOrange[400],
          secondary: Colors.deepOrange[300],
        )
      ),
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => const MemoPageContainer(),
        '/list': (context) => const MemoListPageContainer(),
      }
    );
  }
}
