import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TemaProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance?.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void temaDegistir(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Tema {
  static final karanlikTema = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Color.fromRGBO(30, 30, 30, 1),
    ),
    //primaryColor: Color.fromRGBO(30, 30, 30, 1),
    cardColor: const Color.fromRGBO(30, 30, 30, 1),
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: const Color.fromRGBO(18, 18, 18, 1),
  );
  static final aydinlikTema = ThemeData(
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(color: Color(0xff3700b3)),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    primaryIconTheme: const IconThemeData(color: Colors.purple),
  );
}
//const Color(0xff3700b3)