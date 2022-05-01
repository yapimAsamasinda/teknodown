import 'package:flutter/material.dart';
import 'package:teknodown/model/icerik_model.dart';

class IcerikBaslik extends StatelessWidget {
  final IcerikModel icerik;
  const IcerikBaslik({Key? key, required this.icerik}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shadowColor: const Color.fromRGBO(13, 13, 13, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              height: 240,
              width: MediaQuery.of(context).size.width,
              image: NetworkImage(icerik.genelResim),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            bottom: 2,
            right: 10,
            left: 10,
            child: Center(
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 16, color: Colors.black.withOpacity(0.15))
                  ],
                ),
              ),
            )),
        Positioned(
          bottom: 8,
          right: 16,
          left: 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                icerik.baslik,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(14)),
                    height: 34,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        Text(
                          icerik.katagori,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "959",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const Text("29 Nisan 2022",
                      style: TextStyle(color: Colors.white)),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
