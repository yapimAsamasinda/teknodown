import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:teknodown/servisler/theme_provider.dart';

class TemaDegistirWidget extends StatelessWidget {
  const TemaDegistirWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<TemaProvider>(context);
    return themeProvider.isDarkMode
        ? Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Center(
                child: GestureDetector(
              onTap: () {
                final provider =
                    Provider.of<TemaProvider>(context, listen: false);
                provider.temaDegistir(false);
              },
              child: const FaIcon(
                FontAwesomeIcons.solidMoon,
              ),
            )),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Center(
                child: InkWell(
              onTap: () {
                final provider =
                    Provider.of<TemaProvider>(context, listen: false);
                provider.temaDegistir(true);
              },
              child: const FaIcon(
                FontAwesomeIcons.moon,
              ),
            )),
          );
  }
}
