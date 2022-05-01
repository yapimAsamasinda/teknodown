import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teknodown/servisler/theme_provider.dart';

class DuyuruDugmesi extends StatelessWidget {
  const DuyuruDugmesi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<TemaProvider>(context);
    return themeProvider.isDarkMode
        ? Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Center(
                child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.notifications),
            )),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Center(
                child: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.notifications_none_outlined))),
          );
  }
}
