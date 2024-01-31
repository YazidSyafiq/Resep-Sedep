class FoodModel {
  final String nama;
  final String photo;
  final List<String> bahan;
  final List<String> caraMasak;

  FoodModel(
      {required this.nama,
      required this.photo,
      required this.bahan,
      required this.caraMasak});

  factory FoodModel.fromJSON(Map<String, dynamic> json) {
    List<String> bahanList = List<String>.from(json['bahan']);
    List<String> caraList = List<String>.from(json['caraMasak']);
    return FoodModel(
      nama: json['nama'],
      photo: json['photo'],
      bahan: bahanList,
      caraMasak: caraList,
    );
  }
}
