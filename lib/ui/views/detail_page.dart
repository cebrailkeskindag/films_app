// Gerekli paket ve dosyaları içe aktarıyoruz
import 'package:films_app/data/entity/films.dart';
import 'package:flutter/material.dart';

// Detay Sayfası için Stateful Widget oluşturuyoruz
class DetailPage extends StatefulWidget {
  // Detay sayfasına gönderilecek film verisini alan bir constructor
  Films film;
  DetailPage({required this.film});

  @override
  _DetailPageState createState() => _DetailPageState();
}

// Detay Sayfasının durumunu yöneten State sınıfını oluşturuyoruz
class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sayfa üzerinde bir App Bar oluşturuyoruz ve başlık olarak film adını kullanıyoruz
      appBar: AppBar(title: Text(widget.film.name)),

      // Sayfa içeriğini oluşturuyoruz
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Film görselini gösteren bir Image Widget'ı oluşturuyoruz
            Image.asset("images/${widget.film.image}"),

            // Film fiyatını gösteren bir Text Widget'ı oluşturuyoruz
            Text("${widget.film.price} ₺", style: const TextStyle(fontSize: 50)),
          ],
        ),
      ),
    );
  }
}
