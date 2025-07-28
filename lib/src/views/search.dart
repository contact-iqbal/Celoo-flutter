import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/views/Profile.dart';
import 'package:myapp/src/views/cart.dart';
import 'package:myapp/src/views/dashboard.dart';
import 'package:myapp/src/views/video.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Dashboard(), // untuk Home, isi manual
    Container(), // Ganti dengan SearchPage(),
    Video(), // Ganti dengan VideoPage(),
    Cart(), // Ganti dengan CartPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,

      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: Color.fromARGB(255, 234, 180, 30),
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 243, 243, 243),
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.chat, size: 30),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          : null,

      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Colors.white,
        ),
        height: double.infinity,
        child: _selectedIndex == 0
            ? SingleChildScrollView(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    categorylist(),

                    SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              _postimage(true),
                              _postimage(false),
                              _postvideo(),
                              _postimage(true),
                              _postimage(false),
                              _postimage(true),
                              _postimage(false),
                              _postvideo(),
                              _postimage(true),
                              _postimage(false),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              _postimage(true),
                              _postvideo(),
                              _postimage(true),
                              _postvideo(),
                              _postimage(true),
                              _postimage(false),
                              _postvideo(),
                              _postimage(true),
                              _postimage(false),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              _postimage(false),
                              _postvideo(),
                              _postvideo(),
                              _postimage(true),
                              _postimage(true),
                              _postimage(false),
                              _postvideo(),
                              _postimage(true),
                              _postimage(false),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : _pages[_selectedIndex],
      ),
    );
  }

  SingleChildScrollView categorylist() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _categories('Celana oversize'),
          _categories('Kosmetik'),
          _categories('Kendaraan'),
          _categories('Helm'),
          _categories('Keyboard tactical'),
          _categories('mouse'),
          _categories('Lampu LED'),
        ],
      ),
    );
  }

  Widget _categories(String category) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 223, 223, 223),
        borderRadius: BorderRadius.circular(9),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(left: 11, right: 11, top: 8, bottom: 8),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: () {},
        child: Text(
          category,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 15,
            color: const Color.fromARGB(255, 59, 59, 59),
          ),
        ),
      ),
    );
  }

  Widget _postimage(bool isMany) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 227, 227, 227),
      ),
      margin: EdgeInsets.all(1),
      width: double.infinity,
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (isMany)
              Icon(
                Icons.collections,
                color: const Color.fromARGB(255, 174, 174, 174),
              ),
          ],
        ),
      ),
    );
  }

  Widget _postvideo() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 227, 227, 227),
      ),
      margin: EdgeInsets.all(1),
      width: double.infinity,
      height: 260,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.movie,
              color: const Color.fromARGB(255, 174, 174, 174),
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
