import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/views/Profile.dart';
import 'package:myapp/src/views/cart.dart';
import 'package:myapp/src/views/dashboard.dart';
import 'package:myapp/src/views/search.dart';
import 'package:myapp/src/views/video.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Dashboard(), // untuk Home, isi manual
    Search(), // Ganti dengan NotificationpagePage(),
    Video(), // Ganti dengan VideoPage(),
    Cart(), // Ganti dengan CartPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

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
                          hintText: 'Notificationpage',
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                            ),
                            onPressed: () {},
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

      body: _selectedIndex == 0
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                ],
              ),
            )
          : _pages[_selectedIndex],
    );
  }
}
