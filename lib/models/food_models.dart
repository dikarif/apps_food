class FoodModel {
  BigInt idbarang;
  BigInt idtoko;
  String nama;
  double harga;
  double rating;
  String gambar;

  FoodModel({
    required this.idbarang,
    required this.idtoko,
    required this.nama,
    required this.harga,
    required this.rating,
    required this.gambar,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      idbarang: json['idbarang'],
      idtoko: json['idtoko'],
      nama: json['nama'],
      harga: json['harga'],
      rating: json['rating'],
      gambar: json['gambar'],
    );
  }
}

class FoodModelRekomen {
  BigInt idbarang;
  BigInt idtoko;
  String namarekomen;
  double hargarekomen;
  double ratingrekomen;
  String gambarRekomen;

  FoodModelRekomen({
    required this.idbarang,
    required this.idtoko,
    required this.namarekomen,
    required this.hargarekomen,
    required this.ratingrekomen,
    required this.gambarRekomen,
  });

  factory FoodModelRekomen.fromJson(Map<String, dynamic> json) {
    return FoodModelRekomen(
      idbarang: json['idbarang'],
      idtoko: json['idtoko'],
      namarekomen: json['nama'],
      hargarekomen: json['harga'],
      ratingrekomen: json['rating'],
      gambarRekomen: json['gambar'],
    );
  }
}
