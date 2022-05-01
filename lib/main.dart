import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teknodown/sayfalar/ana_sayfa.dart';
import 'package:teknodown/servisler/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => TemaProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<TemaProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themeProvider.themeMode,
          darkTheme: Tema.karanlikTema,
          theme: Tema.aydinlikTema,
          home: const AnaSayfa(),
        );
      });
}
