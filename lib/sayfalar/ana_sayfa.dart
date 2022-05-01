import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:teknodown/model/icerik_model.dart';
import 'package:teknodown/widgets/duyuru_dugmesi.dart';
import 'package:teknodown/widgets/icerik_baslik.dart';
import 'package:teknodown/widgets/tema_degistir_widget.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  
  Future<List<IcerikModel>> icerikJsonOku() async {
    try {
      String okunanString = await DefaultAssetBundle.of(context)
          .loadString('assets/data/teknodown.json');
      var jsonArray = jsonDecode(okunanString);
      List<IcerikModel> icerikler = (jsonArray as List)
          .map((icerikMap) => IcerikModel.fromMap(icerikMap))
          .toList();
      return icerikler;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  late final Future<List<IcerikModel>> icerikListesiniDoldur;
  @override
  void initState() {
    super.initState();
    icerikListesiniDoldur = icerikJsonOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Tekno Down'),
        actions:const [TemaDegistirWidget(), DuyuruDugmesi()],
      ),
      body: FutureBuilder<List<IcerikModel>>(
          future: icerikListesiniDoldur,
  
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<IcerikModel> _icerikler = snapshot.data!;
              return ListView.builder(
                  itemCount: _icerikler.length,
                  itemBuilder: (context, index) {
                    IcerikModel icerik = _icerikler[index];

                    return IcerikBaslik(
                      icerik: icerik,
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
