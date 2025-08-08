import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class DetaySayfa extends StatefulWidget {
  final Kisiler kisi;
  const DetaySayfa({super.key, required this.kisi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  late TextEditingController tfKisiAdi;
  late TextEditingController tfKisiTel;

  @override
  void initState() {
    super.initState();
    tfKisiAdi = TextEditingController(text: widget.kisi.kisi_ad);
    tfKisiTel = TextEditingController(text: widget.kisi.kisi_tel);
    print("kisi id: ${widget.kisi.kisi_id} - Kişi Adı: ${widget.kisi.kisi_ad} - Kişi Tel: ${widget.kisi.kisi_tel}");
  }

  @override
  void dispose() {
    tfKisiAdi.dispose();
    tfKisiTel.dispose();
    super.dispose();
  }

  void guncelle(int kisi_id, String ad, String tel) {
    // Güncelleme işlemleri burada yapılır
    print("Güncellendi: $kisi_id, $ad, $tel");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.kisi.kisi_ad)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: tfKisiAdi, decoration: const InputDecoration(hintText: "kişi adı")),
            TextField(controller: tfKisiTel, decoration: const InputDecoration(hintText: "kişi teli")),
            ElevatedButton(
              onPressed: () {
                guncelle(widget.kisi.kisi_id, tfKisiAdi.text, tfKisiTel.text);
              },
              child: const Text("Güncelle"),
            ),
          ],
        ),
      ),
    );
  }
}