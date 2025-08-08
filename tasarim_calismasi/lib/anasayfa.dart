import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasarim_calismasi/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}
//note:
//left - start - leading
//right - end - trailing

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {


    var d= AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Pizza",style: TextStyle(color: textRengi, fontFamily: "edunswac" , fontSize:28) ,),
        backgroundColor: anaRenk,shadowColor: Colors.black54,
        centerTitle: true,

      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(d!.pizzaBaslik,style: TextStyle(fontSize: 36,color: iconRengi,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Image.asset("resimler/pizza_resim.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

              Chip(icerik: d.peynirYazi),
                Chip(icerik: d.sosisYazi),
                Chip(icerik: d.mantarYazi),
                Chip(icerik: d.biberYazi),




            ],),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(d.sureYazi,style: TextStyle(fontSize: 22,color: Colors.grey,fontWeight: FontWeight.bold,fontFamily: "edunswac"),),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(d.siparisYazi,style: TextStyle(fontSize: 22,color: anaRenk,fontWeight: FontWeight.bold,fontFamily: "edunswac"),),
                ),
                Text(d.aciklamaYazi,style: TextStyle(fontSize: 22,color: Colors.grey,fontWeight: FontWeight.bold,fontFamily: "edunswac"),),
              ],
            ),
          ),

        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(d.fiyatYazi, style: TextStyle(fontSize: 44, color: anaRenk, fontWeight: FontWeight.bold)),
            const Spacer(),
            SizedBox(
              width: 200,
              height: 50,
              child: TextButton(
                onPressed: () {},
                child: Text(d.butonYazi, style: TextStyle(color: textRengi, fontSize: 18)),
                style: TextButton.styleFrom(
                  backgroundColor: anaRenk,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Chip extends StatelessWidget {
  String icerik;
  Chip({super.key, required this.icerik});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){},
      child: Text(icerik,style:  TextStyle(color: textRengi),),
      style: TextButton.styleFrom(backgroundColor: butonRengi),
    );
  }
}
