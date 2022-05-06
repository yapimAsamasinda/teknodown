import 'package:flutter/material.dart';
import 'package:teknodown/model/icerik_model.dart';
import 'package:teknodown/servisler/constants.dart';

class IcerikSayfasi extends StatefulWidget {
  final IcerikModel icerik;
  const IcerikSayfasi({Key? key, required this.icerik}) : super(key: key);

  @override
  State<IcerikSayfasi> createState() => _IcerikSayfasiState();
}

class _IcerikSayfasiState extends State<IcerikSayfasi> {
  @override
  Widget build(BuildContext context) {
    IcerikModel icerik = widget.icerik;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Image.network(
                  widget.icerik.genelResim,
                  fit: BoxFit.cover,
                ))
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 12.0, right: 12.0, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    icerik.baslik,
                    style: Constants.baslikStyle,
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  icerikIstatistik(icerik),
                  const SizedBox(height: 60),
                  //-----------------------------------------------------GÖVDE KISMI------------------------------------------------------------------------------------------------
                  yaziOlustur(
                      icerik.altBasliklar!.altBaslik1,
                      icerik.aciklamalar!.aciklama1,
                      icerik.resimler!.resimAltBaslik1),
                  yaziOlustur(
                      icerik.altBasliklar!.altBaslik2,
                      icerik.aciklamalar!.aciklama2,
                      icerik.resimler!.resimAltBaslik2),
                  yaziOlustur(
                      icerik.altBasliklar!.altBaslik3,
                      icerik.aciklamalar!.aciklama3,
                      icerik.resimler!.resimAltBaslik3),
                  yaziOlustur(
                      icerik.altBasliklar!.altBaslik4,
                      icerik.aciklamalar!.aciklama4,
                      icerik.resimler!.resimAltBaslik4),
                ],
              ),
            )
          ])),
        ],
      ),
    );
  }

  yaziOlustur(String? altBaslik, String? aciklama, String? resimYolu) {
    return altBaslik != null
        ? Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  altBaslik.toString(),
                  style: Constants.yaziBaslikStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                resimYolu != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: Image(
                            image: NetworkImage(resimYolu.toString()),
                            fit: BoxFit.cover,
                          ),
                        ))
                    : const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                aciklama != null
                    ? Text(
                        aciklama.toString(),
                        textAlign: TextAlign.left,
                        style: Constants.yaziAciklamaStyle,
                      )
                    : const Text("")
              ],
            ),
          )
        : const SizedBox();
  }

  Row icerikIstatistik(IcerikModel icerik) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(14)),
          height: 34,
          child: Row(
            children: [
              const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Text(
                icerik.katagori,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
        ),
        Row(
          children: const [
            Icon(
              Icons.remove_red_eye,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "959",
            )
          ],
        ),
        const Text(
          "29 Nisan 2022",
        ),
      ],
    );
  }
}
