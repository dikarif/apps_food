class TokoModel {
  BigInt idtoko;
  String alamat;
  String nama;
  String gambar;
  double rating;
  double latitude;
  double longitude;

  TokoModel({
    required this.idtoko,
    required this.alamat,
    required this.nama,
    required this.gambar,
    required this.rating,
    required this.latitude,
    required this.longitude,
  });

  factory TokoModel.fromJson(Map<String, dynamic> json) {
    return TokoModel(
      idtoko: BigInt.parse(json['idtoko'].toString()),
      alamat: json['alamat'],
      nama: json['nama'],
      gambar: 'assets/' + json['gambar'],
      rating: double.parse(json['rating'].toString()),
      latitude: double.parse(json['latitude'].toString()),
      longitude: double.parse(json['longitude'].toString()),
    );
  }
}

class TokoModelTerdekat {
  BigInt idtoko;
  String alamat;
  String nama;
  String gambar;
  double rating;
  double latitude;
  double longitude;

  TokoModelTerdekat({
    required this.idtoko,
    required this.alamat,
    required this.nama,
    required this.gambar,
    required this.rating,
    required this.latitude,
    required this.longitude,
  });

  factory TokoModelTerdekat.fromJson(Map<String, dynamic> json) {
    return TokoModelTerdekat(
      idtoko: BigInt.parse(json['idtoko'].toString()),
      alamat: json['alamat'],
      nama: json['nama'],
      gambar: 'assets/' + json['gambar'],
      rating: double.parse(json['rating'].toString()),
      latitude: double.parse(json['latitude'].toString()),
      longitude: double.parse(json['longitude'].toString()),
    );
  }
}
