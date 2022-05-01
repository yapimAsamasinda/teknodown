import 'package:flutter/material.dart';
import 'package:teknodown/model/icerik_model.dart';

class IcerikSayfasi extends StatefulWidget {
  final List<IcerikModel> liste;
  const IcerikSayfasi({Key? key, required this.liste}) : super(key: key);

  @override
  State<IcerikSayfasi> createState() => _IcerikSayfasiState();
}

class _IcerikSayfasiState extends State<IcerikSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
