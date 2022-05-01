import 'dart:convert';

IcerikModel icerikModelFromMap(String str) =>
    IcerikModel.fromMap(json.decode(str));

String icerikModelToMap(IcerikModel data) => json.encode(data.toMap());

class IcerikModel {
  IcerikModel({
    required this.id,
    required this.katagori,
    required this.baslik,
    required this.genelAciklama,
    required this.genelResim,
    this.altBasliklar,
    this.aciklamalar,
    this.resimler,
  });

  final String id;
  final String katagori;
  final String baslik;
  final String genelAciklama;
  final String genelResim;
  final AltBasliklar? altBasliklar;
  final Aciklamalar? aciklamalar;
  final Resimler? resimler;

  factory IcerikModel.fromMap(Map<String, dynamic> json) => IcerikModel(
        id: json["id"],
        katagori: json["katagori"],
        baslik: json["baslik"],
        genelAciklama: json["genelAciklama"],
        genelResim: json["genelResim"],
        altBasliklar: AltBasliklar.fromMap(json["altBasliklar"]),
        aciklamalar: Aciklamalar.fromMap(json["aciklamalar"]),
        resimler: Resimler.fromMap(json["resimler"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "katagori": katagori,
        "baslik": baslik,
        "genelAciklama": genelAciklama,
        "genelResim": genelResim,
        "altBasliklar": altBasliklar!.toMap(),
        "aciklamalar": aciklamalar!.toMap(),
        "resimler": resimler!.toMap(),
      };
}

class Aciklamalar {
  Aciklamalar({
    this.aciklama1,
    this.aciklama2,
    this.aciklama3,
  });

  final String? aciklama1;
  final String? aciklama2;
  final String? aciklama3;

  factory Aciklamalar.fromMap(Map<String, dynamic> json) => Aciklamalar(
        aciklama1: json["aciklama1"],
        aciklama2: json["aciklama2"],
        aciklama3: json["aciklama3"],
      );

  Map<String, dynamic> toMap() => {
        "aciklama1": aciklama1,
        "aciklama2": aciklama2,
        "aciklama3": aciklama3,
      };
}

class AltBasliklar {
  AltBasliklar({
    this.altBaslik1,
    this.altBaslik2,
    this.altBaslik3,
  });

  final String? altBaslik1;
  final String? altBaslik2;
  final String? altBaslik3;

  factory AltBasliklar.fromMap(Map<String, dynamic> json) => AltBasliklar(
        altBaslik1: json["altBaslik1"],
        altBaslik2: json["altBaslik2"],
        altBaslik3: json["altBaslik3"],
      );

  Map<String, dynamic> toMap() => {
        "altBaslik1": altBaslik1,
        "altBaslik2": altBaslik2,
        "altBaslik3": altBaslik3,
      };
}

class Resimler {
  Resimler({
    this.resimAltBaslik1,
    this.resimAltBaslik2,
    this.resimAltBaslik3,
  });

  final String? resimAltBaslik1;
  final String? resimAltBaslik2;
  final String? resimAltBaslik3;

  factory Resimler.fromMap(Map<String, dynamic> json) => Resimler(
        resimAltBaslik1: json["resimAltBaslik1"],
        resimAltBaslik2: json["resimAltBaslik2"],
        resimAltBaslik3: json["resimAltBaslik3"],
      );

  Map<String, dynamic> toMap() => {
        "resimAltBaslik1": resimAltBaslik1,
        "resimAltBaslik2": resimAltBaslik2,
        "resimAltBaslik3": resimAltBaslik3,
      };
}
