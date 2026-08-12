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
      idbarang: BigInt.parse(json['idbarang'].toString()),
      idtoko: BigInt.parse(json['idtoko'].toString()),
      nama: json['nama'],
      harga: double.parse(json['harga'].toString()),
      rating: double.parse(json['rating'].toString()),
      gambar: 'assets/' + json['gambar'],
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
      idbarang: BigInt.parse(json['idbarang'].toString()),
      idtoko: BigInt.parse(json['idtoko'].toString()),
      namarekomen: json['nama'],
      hargarekomen: double.parse(json['harga'].toString()),
      ratingrekomen: double.parse(json['rating'].toString()),
      gambarRekomen: 'assets/' + json['gambar'],
    );
  }
}
