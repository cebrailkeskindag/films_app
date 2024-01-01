// Gerekli paket ve dosyaları içe aktarıyoruz
import 'package:films_app/data/entity/films.dart';
import 'package:films_app/ui/views/detail_page.dart';
import 'package:flutter/material.dart';

// Homepage widget'ını oluşturuyoruz
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

// Homepage widget'ının durumunu oluşturuyoruz
class _HomepageState extends State<Homepage> {
  // Filmleri asenkron olarak yüklemek için bir fonksiyon
  Future<List<Films>> filmsLoad() async {
    // Films objelerini saklamak için boş bir liste oluşturuyoruz
    var filmsList = <Films>[];

    // Films sınıfından nesneler oluşturup, her birini filmsList adlı listeye ekliyoruz.
    var f1 = Films(id: 1, name: "Django", image: "django.png", price: 24);
    var f2 = Films(id: 2, name: "Interstellar", image: "interstellar.png", price: 32);
    var f3 = Films(id: 3, name: "Inception", image: "inception.png", price: 16);
    var f4 = Films(id: 4, name: "The Hateful Eight", image: "thehatefuleight.png", price: 28);
    var f5 = Films(id: 5, name: "The Pianist", image: "thepianist.png", price: 18);
    var f6 = Films(id: 6, name: "Anadoluda", image: "anadoluda.png", price: 10);

    // Oluşturulan Films nesnelerini filmsList listesine ekliyoruz
    filmsList.add(f1);
    filmsList.add(f2);
    filmsList.add(f3);
    filmsList.add(f4);
    filmsList.add(f5);
    filmsList.add(f6);


    // Films listesini döndürüyoruz
    return filmsList;
  }

  // Homepage için UI'ı oluşturuyoruz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar'ı ayarlıyoruz
      appBar: AppBar(title: const Text("Filmler")),

      // FutureBuilder kullanarak widget'ın içeriğini oluşturuyoruz
      body: FutureBuilder<List<Films>>(
        future: filmsLoad(),
        builder: (context, snapshot) {
          // Verinin yüklenip yüklenmediğini kontrol ediyoruz
          if (snapshot.hasData) {
            // Snapshot'tan Films listesini çıkartıyoruz
            var filmsList = snapshot.data;

            // Films'leri göstermek için bir GridView oluşturuyoruz
            return GridView.builder(
              itemCount: filmsList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.8),
              itemBuilder: (context, index) {
                var film = filmsList[index];

                // Film üzerine tıklamak için GestureDetector oluşturuyoruz
                return GestureDetector(
                  onTap: () {
                    // Seçilen filmle birlikte DetailPage'e geçiş yapılıyor
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(film: film),
                      ),
                    );
                  },
                  child: Card(
                    // Film detaylarını göstermek için bir Card oluşturuyoruz
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("images/${film.image}"),
                        Row(
                          children: [
                            Text(
                              "${film.price} ₺",
                              style: const TextStyle(fontSize: 24),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                print("${film.name} sepete eklendi");
                              },
                              child: const Text("Sepete Ekle"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            // Veri henüz yüklenmediyse, bir merkez widget'ı döndürüyoruz
            return const Center();
          }
        },
      ),
    );
  }
}
