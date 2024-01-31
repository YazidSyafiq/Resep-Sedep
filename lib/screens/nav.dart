import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:resep_sedep/screens/drink.dart';
import 'package:resep_sedep/screens/food.dart';

class Navbar extends StatefulWidget {
  final int intialIndex;

  const Navbar({Key? key, required this.intialIndex}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  late int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.intialIndex;
  }

  void _inItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[const Food(), const Drink()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Resep Sedep',
          style: TextStyle(
              color: Color(0xFF72A4AE),
              fontFamily: 'Aguafina Script',
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(top: 17.5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.5), // You can customize the color and opacity
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // Changes the position of the shadow
            ),
          ],
        ),
        child: CurvedNavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          color: const Color(0xFF72A4AE),
          animationDuration: const Duration(milliseconds: 200),
          items: const [
            Icon(
              Icons.lunch_dining_sharp,
              color: Colors.white,
              size: 30,
            ),
            Icon(
              Icons.coffee_sharp,
              color: Colors.white,
              size: 30,
            )
          ],
          onTap: _inItemTap,
        ),
      ),
    );
  }
}
