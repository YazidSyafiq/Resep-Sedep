import 'package:flutter/material.dart';
import 'package:resep_sedep/models/drink_model.dart';
import 'package:resep_sedep/screens/detail_drink.dart';
import 'package:resep_sedep/services/drink_services.dart';

class Drink extends StatefulWidget {
  const Drink({super.key});

  @override
  State<Drink> createState() => _FoodState();
}

class _FoodState extends State<Drink> {
  late TextEditingController _searchController;
  late List<DrinkModel> _drinks;
  late List<DrinkModel> _filteredDrinks;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _drinks = [];
    _filteredDrinks = [];
    _loadDrinks();
  }

  Future<void> _loadDrinks() async {
    List<DrinkModel> drinks = await DrinkServices.getDrinksFromJSON();
    setState(() {
      _drinks = drinks;
      _filteredDrinks = drinks;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                'Keluar',
                style: TextStyle(
                    color: Color(0xFF72A4AE),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              content: const Text(
                'Apakah Anda yakin ingin keluar dari aplikasi?',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 0, bottom: 15, right: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xFF72A4AE)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.close,
                              color: Color(0xFF72A4AE),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Batal',
                              style: TextStyle(
                                  color: Color(0xFF72A4AE),
                                  fontFamily: 'Poppins',
                                  fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 0, bottom: 15, left: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(color: Colors.white))),
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Keluar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 0),
              child: Text(
                'Temukan banyak Resep Sedep di sini',
                style: TextStyle(
                    color: Color(0xFF72A4AE),
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 10, right: 10),
              child: Material(
                elevation: 7.5,
                shadowColor: const Color(0xFF72A4AE),
                borderRadius: BorderRadius.circular(25),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: const Color(0xFF72A4AE),
                    labelStyle: const TextStyle(
                      color: Color(0xFF72A4AE),
                    ),
                    suffixIconColor: const Color(0xFF72A4AE),
                    focusColor: const Color(0xFF72A4AE),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Color(0xFF72A4AE),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Color(0xFF72A4AE),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: _buildGridView(_filteredDrinks))
          ],
        ),
      ),
    );
  }

  Widget _buildGridView(List<DrinkModel> drinks) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 12.5, mainAxisSpacing: 2),
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        final drink = drinks[index];
        EdgeInsets cardMargin = EdgeInsets.only(
          left: index.isOdd ? 0 : 12.5,
          right: index.isEven ? 0 : 12.5,
          top: 10,
          bottom: 2.5,
        );
        return _buildDrinkCard(drink, cardMargin);
      },
    );
  }

  Widget _buildDrinkCard(DrinkModel drink, EdgeInsets margin) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailDrink(
                    drink: drink,
                  )),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7.5,
        margin: margin,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.asset(
                drink.photo,
                fit: BoxFit.cover,
                height: 125,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(drink.nama,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF72A4AE))),
            ),
          ],
        ),
      ),
    );
  }

  void _onSearchChanged(String query) {
    query = query.toLowerCase();
    setState(() {
      _filteredDrinks = _drinks.where((drink) {
        return drink.nama.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
