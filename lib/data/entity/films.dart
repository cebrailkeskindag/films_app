// Films sınıfı, uygulamanızdaki filmleri temsil etmek üzere kullanılır

class Films {
  // Filmin benzersiz kimliği
  int id;

  // Filmin adı
  String name;

  // Filmin görseli için dosya adı veya yolunu içeren bir string
  String image;

  // Filmin fiyatı
  int price;

  // Films sınıfının constructor'ı, gerekli tüm bilgileri alır ve nesneyi oluşturur
  Films({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });
}
