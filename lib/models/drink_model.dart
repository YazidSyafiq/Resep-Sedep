class DrinkModel {
  final String nama;
  final String photo;
  final List<String> bahan;
  final List<String> caraMasak;

  DrinkModel(
      {required this.nama,
      required this.photo,
      required this.bahan,
      required this.caraMasak});

  factory DrinkModel.fromJSON(Map<String, dynamic> json) {
    List<String> bahanList = List<String>.from(json['bahan']);
    List<String> caraList = List<String>.from(json['caraMasak']);
    return DrinkModel(
      nama: json['nama'],
      photo: json['photo'],
      bahan: bahanList,
      caraMasak: caraList,
    );
  }
}
