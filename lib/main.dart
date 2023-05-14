import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/screens/base/base_screen.dart';
import 'package:xlo_mobx/stores/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeParse();
  setupLocators();
  runApp(const MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
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
      ),
      home: const BaseScreen(),
    );
  }
}
