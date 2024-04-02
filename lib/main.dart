import 'package:flutter/material.dart';
import 'package:nunya_pay_app/screens/connexion/sign_in.dart';
import 'package:nunya_pay_app/dark_mode_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

ThemeData _darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    //primaryColor: const Color.fromARGB(255, 37, 37, 37),
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
      headline2: TextStyle(color: Colors.white, fontSize: 22),
      headline3:
          TextStyle(color: Color.fromARGB(255, 92, 34, 232), fontSize: 22),
      headline4: TextStyle(color: Colors.white, fontSize: 20),
      headline5: TextStyle(color: Colors.grey, fontSize: 20),
      headline6: TextStyle(color: Colors.grey, fontSize: 18),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 24, 23, 23)
    //scaffoldBackgroundColor: const Color.fromARGB(255, 37, 37, 37),
    );

ThemeData _lightTheme = ThemeData(
  //brightness: Brightness.dark,
  primaryColor: const Color.fromARGB(255, 37, 37, 37),
  textTheme: const TextTheme(
    headline1: TextStyle(
        color: Colors.black, fontSize: 30, fontWeight: FontWeight.w400),
    headline2: TextStyle(color: Colors.black, fontSize: 22),
    headline3: TextStyle(color: Color.fromARGB(255, 92, 34, 232), fontSize: 22),
    headline4: TextStyle(color: Colors.black, fontSize: 20),
    headline5: TextStyle(color: Colors.grey, fontSize: 20),
    headline6: TextStyle(color: Colors.grey, fontSize: 18),
  ),
  scaffoldBackgroundColor: Colors.white,
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(darkModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nunya Pay',
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      home: const SingIn(),
    );
  }
}
