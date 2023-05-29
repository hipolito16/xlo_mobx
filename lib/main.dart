import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xlo_mobx/stores/user_manager_store.dart';
import 'package:xlo_mobx/screens/base/base_screen.dart';
import 'package:xlo_mobx/stores/category_store.dart';
import 'package:xlo_mobx/stores/page_store.dart';
import 'package:xlo_mobx/stores/home_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton<PageStore>(PageStore());
  GetIt.I.registerSingleton<HomeStore>(HomeStore());
  GetIt.I.registerSingleton<CategoryStore>(CategoryStore());
  GetIt.I.registerSingleton<UserManagerStore>(UserManagerStore());
}

Future<void> initializeParse() async {
  await Parse().initialize('H3C8kxwitpR3uxs0iFerIIdjhGgQWV2pJSmdXjd1', 'https://parseapi.back4app.com/', clientKey: 'CTkOGieIPxOF1aRdJj1fMHW0cnKY5dBPA7NgtUKV', autoSendSessionId: true, debug: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: const AppBarTheme(elevation: 0),
        textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.orange),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
      ),
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const BaseScreen(),
    );
  }
}
