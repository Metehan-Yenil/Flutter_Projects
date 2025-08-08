import 'package:cinema_app/data/entity/filmler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  Filmler film;

  DetaySayfa(this.film);


  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.film.ad} '),
        centerTitle: true,
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("resimler/${widget.film.resim}"),

            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Fiyat: ${widget.film.fiyat} TL",
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),

            ],
          ),
      ),
    );
  }
}
