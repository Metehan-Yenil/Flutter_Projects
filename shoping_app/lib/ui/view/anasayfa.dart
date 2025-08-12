import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();

}

class _AnasayfaState extends State<Anasayfa> {
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



        ],
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
