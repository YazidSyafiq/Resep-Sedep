import 'package:flutter/material.dart';
import 'package:resep_sedep/models/food_model.dart';

class DetailFood extends StatelessWidget {
  final FoodModel food;

  const DetailFood({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          food.nama,
          style: const TextStyle(
              color: Color(0xFF72A4AE),
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF72A4AE), size: 25),
      ),
      body: _buildDetailCard(),
    );
  }

  Widget _buildDetailCard() {
    return ListView(
      children: [_buildImageCard(), _buildBahanCard(), _buildCaraMasakCard()],
    );
  }

  Widget _buildImageCard() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 0, right: 10, left: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Card(
            elevation: 5,
            child: Image.asset(
              food.photo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBahanCard() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 7.5, bottom: 0, right: 10, left: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    'Bahan-Bahan',
                    style: TextStyle(
                      color: Color(0xFF72A4AE),
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, bottom: 10, right: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: food.bahan.asMap().entries.map((entry) {
                        int index = entry.key + 1;
                        String bahan = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$index. ',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13),
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                child: Text(
                                  bahan,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCaraMasakCard() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 7.5, bottom: 0, right: 10, left: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      'Cara Memasak',
                      style: TextStyle(
                        color: Color(0xFF72A4AE),
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 10, right: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: food.caraMasak.asMap().entries.map((entry) {
                          int index = entry.key + 1;
                          String caraMasak = entry.value;
                          return Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$index. ',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(width: 5),
                                Flexible(
                                  child: Text(
                                    caraMasak,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
