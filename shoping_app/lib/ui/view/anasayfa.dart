import 'package:flutter/material.dart';
import 'package:shoping_app/data/entity/urunler.dart';
import 'dart:math';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();

}


class _AnasayfaState extends State<Anasayfa> {
  Future<List<Urunler>> urunYukle() async {
    var urunListesi = <Urunler>[];
    var random = Random();
    var urun1 = Urunler(1, "Poedagar Quartz Erkek Kol saati", "urun acıklama", "resimler/1.jpg", 4900, "kategori1",35);
    var urun2 = Urunler(2, "audemars piguet Erkek kol", "urun acıklama 2", "resimler/2.jpg", 4500, "kategori2",24);
    var urun3 = Urunler(3, "Audemars Piguet Royal Oak ", "urun acıklama 3", "resimler/3.jpg", 8750, "kategori3",16);
    var urun4 = Urunler(4, "Bmw Motosport Erkek Kol saati", "urun acıklama 4", "resimler/4.jpg", 2500, "kategori4",63);
    var urun5 = Urunler(5, "urun baslik 5", "urun acıklama 5", "resimler/5.jpg", 500, "kategori5",67);
    var urun6 = Urunler(6, "urun baslik 6", "urun acıklama 6", "resimler/6.jpg", 600, "kategori6",21);
    var urun7 = Urunler(7, "urun baslik 7", "urun acıklama 7", "resimler/7.jpg", 700, "kategori7",6);

    urunListesi.add(urun1);
    urunListesi.add(urun2);
    urunListesi.add(urun3);
    urunListesi.add(urun4);
    urunListesi.add(urun5);
    urunListesi.add(urun6);
    urunListesi.add(urun7);

    return urunListesi;
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    const Color customYellow = Color(0xFFFFF6DC);
    const Color customGreen = Color(0x3CD2A2);




    return Scaffold(

      appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Ürün, kategori,marka ve @satıcı arayın',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    filled: true,
                    fillColor: Colors.grey[200],

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    suffixIcon: Icon(Icons.photo_camera_outlined, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.manage_search_sharp, color: Colors.black87,size: 30,),

              SizedBox(width: 8),
              Icon(Icons.notifications_none_outlined, color: Colors.black87),

            ],
          ),

        bottom: PreferredSize(
            preferredSize: Size.fromHeight(32),
            
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              color: Color(customYellow.value),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text("Satılırsa öde ile öne çıkarabileceğin ürünlerin var! Hemen tıkla! 🚀 >  ",
              style: TextStyle(fontSize: 12,color: Colors.black54),
              ),
            )
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Expanded(child:_buildTabButton("Bana Özel",1),
              ),
              Expanded(child:_buildTabButton("Keşfet",0),
              ),
              SizedBox(height: 50),
              //SizedBox(width: 50),

            ],
          ),
          //image eklenecek.
          Image.asset("resimler/banner.jpg"),

          Padding(padding: const EdgeInsets.only(left: 8),

            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Senin için seçtiklerimiz",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
              ],
            ),
          ),
          // gridview.builder ile ürünler listelenecek.
          Expanded(
            child: FutureBuilder<List<Urunler>>(
                future: urunYukle(),
                builder: (context,snapshot){
                  if (snapshot.hasData){
                    var urunlerListesi = snapshot.data!;
                    return GridView.builder(
                        itemCount: urunlerListesi.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6
                        ),
                        itemBuilder: (context, index) {
                          var urun = urunlerListesi[index];
                          return Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                                        child: Image.asset(
                                          urun.resimUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      ),
                                     /* Positioned(
                                        top: 8,
                                        right: 8,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.white.withOpacity(0.85), // Kalbin içi renkli
                                            size: 28,
                                          ),
                                          onPressed: () {
                                            // Favori işlemi burada yapılabilir
                                          },
                                        ),
                                      ),*/
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: Column(
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Icon(Icons.favorite, color: Colors.black.withOpacity(0.2), size: 28),
                                                Icon(Icons.favorite_outline, color: Colors.white, size: 28),
                                              ],
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              urun.begeniSayisi.toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                shadows: [
                                                  Shadow(
                                                    color: Colors.black26,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 1),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        urun.baslik,
                                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 32),
                                      Text(
                                        "${urun.fiyat} TL",
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                    );
                  }
                  else {
                    return Center(child: Text("Hata:  "));
                  }
                }


            ),
          )



        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        items:  [
          const BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
          label: 'Anasayfa',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),
          label: 'Favorilerim',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Icon(Icons.add_circle_outline_sharp,size: 35,),

            ),

            label: 'İlan Ver',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),
          label: 'Sepetim',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.person_outlined),
          label: 'Hesabım',
          ),
        ],
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
      ),
    );
  }
  Widget _buildTabButton(String text, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: (){
        setState( () {
          selectedIndex = index;

        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.greenAccent : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(height: 4),
          AnimatedContainer(duration: Duration(microseconds: 200),
          width: MediaQuery.of(context).size.shortestSide/2,
          height: 3,
          color: isSelected ? Colors.greenAccent: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
