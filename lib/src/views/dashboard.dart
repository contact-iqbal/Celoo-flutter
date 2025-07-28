import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/src/views/cart.dart';
import 'package:myapp/src/views/profile.dart';
import 'package:myapp/src/views/search.dart';
import 'package:myapp/src/views/video.dart';
import 'notificationpage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _showcard = true;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Container(), // untuk Home, isi manual
    Search(), // Ganti dengan SearchPage(),
    Video(), // Ganti dengan VideoPage(),
    Cart(), // Ganti dengan CartPage(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildactionitem(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: Color.fromARGB(255, 234, 180, 30)),
              SizedBox(width: 3),
              Text(title, style: GoogleFonts.openSans(fontSize: 14)),
            ],
          ),
          Text(
            subtitle,
            style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildverticaldivider() {
    return Container(
      height: 40,
      width: 1,
      color: const Color.fromARGB(255, 193, 193, 193),
    );
  }

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
                          hintText: 'Celana pria oversize',
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
                    icon: Icon(Icons.notifications, size: 30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Notificationpage(),
                        ),
                      );
                    },
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
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: _selectedIndex == 0
            ? SingleChildScrollView(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_showcard)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.login,
                                      color: Color.fromARGB(255, 234, 180, 30),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Lanjutin daftarnya yuk',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _showcard = false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Setup password dan nomor hp kamu sekarang, agar bisa nikmatin fitur lebih banyak lagi!',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    // Quick Action Bar
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: 5),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.qr_code_scanner,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(width: 5),
                            _buildverticaldivider(),
                            Expanded(
                              child: _buildactionitem(
                                Icons.attach_money,
                                "Loopay",
                                "Lebih cepat",
                              ),
                            ),
                            _buildverticaldivider(),
                            Expanded(
                              child: _buildactionitem(
                                Icons.check_circle,
                                "Koin",
                                "Ayo Check in",
                              ),
                            ),
                            _buildverticaldivider(),
                            Expanded(
                              child: _buildactionitem(
                                Icons.wallet,
                                "Transfer",
                                "tanpa biaya admin",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _iconWithText(
                            Icons.phone_android_outlined,
                            'Paket data, pulsa',
                            Colors.teal,
                          ),
                          _iconWithText(
                            CupertinoIcons.ticket_fill,
                            'Voucher Gratis',
                            Colors.amber,
                          ),
                          _iconWithText(
                            Icons.restaurant,
                            'Loodelivery',
                            Colors.redAccent,
                          ),
                          _iconWithText(
                            Icons.dashboard,
                            'Lihat semua',
                            Colors.indigo,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 21),
                    Container(
                      height: 6,
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(235, 233, 233, 233),
                    ),

                    // Display Container
                    SizedBox(height: 9),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        child: Text(
                          'Traktiran Pengguna Baru',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Berakhir dalam',
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                          SizedBox(width: 4),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 225, 55, 55),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  Text(
                                    '23 : 32 : 09',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {},
                              child: Text(
                                'Lihat Semua',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 234, 180, 30),
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(5, (index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: index == 0
                                    ? Colors.transparent
                                    : Colors.white,
                              ),
                              margin: EdgeInsets.only(right: 10),
                              width: 120,
                              height: 210,
                              child: index == 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Kasih Murah',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 26,
                                              height: 1,
                                              color: const Color.fromARGB(
                                                255,
                                                4,
                                                4,
                                                4,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Serba',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 27,
                                              height: 1,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(9),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                color: const Color.fromARGB(255, 0, 0, 0),
                                              )
                                            ),
                                            child: Text(
                                              '1 rb',
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 27,
                                                height: 1,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                              255,
                                              215,
                                              215,
                                              215,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                            ),
                                          ),
                                          height: 110,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Rp 1.000',
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                ),
                                              ),

                                              SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4,
                                                          ),
                                                      color: Color(0xfffbdde3),
                                                    ),
                                                    child: Text(
                                                      '94%',
                                                      style:
                                                          GoogleFonts.poppins(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 13,
                                                          ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    'Rp 16.000',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          const Color.fromARGB(
                                                            255,
                                                            113,
                                                            113,
                                                            113,
                                                          ),
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 3),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: LinearProgressIndicator(
                                                  value: 0.34,
                                                  backgroundColor: Colors.grey,
                                                  valueColor:
                                                      AlwaysStoppedAnimation(
                                                        Colors.red,
                                                      ),
                                                ),
                                              ),

                                              SizedBox(height: 3),
                                              Text(
                                                'Tersedia',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11,
                                                  color: const Color.fromARGB(
                                                    255,
                                                    61,
                                                    61,
                                                    61,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            );
                          }),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(6),
                      child: Column(
                        children: [
                          _sectionTitlenoArrow('Lanjut Cek ini, yuk'),

                          SizedBox(height: 6),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _itemcategory(
                                  'Balik lihat di kategori ini',
                                  'Lego bricks full set',
                                ),
                                _itemcategory('Cek lagi yuk', 'Earphone'),
                                _itemcategory(
                                  'Cari Lebih Banyak',
                                  'PC Gaming Rata Kanan',
                                ),
                                _itemcategory(
                                  'Eksklusif 8.8 sale days',
                                  'Skincare Moisturizer',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _productleft(
                                    'title',
                                    'price',
                                    'discount',
                                    'rating',
                                    3,
                                    'customerCount',
                                  ),
                                  _productleft(
                                    'title',
                                    'price',
                                    'discount',
                                    'rating',
                                    3,
                                    'customerCount',
                                  ),
                                  _productleft(
                                    'title',
                                    'price',
                                    'discount',
                                    'rating',
                                    3,
                                    'customerCount',
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: [
                                  _productright(
                                    'title',
                                    'price',
                                    'discount',
                                    'rating',
                                    3,
                                    'customerCount',
                                  ),
                                  _productright(
                                    'title',
                                    'price',
                                    'discount',
                                    'rating',
                                    3,
                                    'customerCount',
                                  ),
                                  _productright(
                                    'title',
                                    'price',
                                    'discount',
                                    'rating',
                                    3,
                                    'customerCount',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : _pages[_selectedIndex],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: const Color.fromARGB(255, 177, 177, 177),
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color.fromARGB(255, 150, 150, 150),
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
                size: 28,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 1 ? Icons.search : Icons.search_outlined,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 2
                    ? Icons.video_collection
                    : Icons.video_collection_outlined,
                size: 34,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 3
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 4 ? Icons.person : Icons.person_outline,
                size: 28,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconWithText(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, color: color),
        ),
        Text(label, style: TextStyle(fontSize: 11)),
      ],
    );
  }

  Widget _sectionTitle(String title, String button) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w600),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            button,
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _sectionTitlenoArrow(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _itemcategory(String promotion, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color.fromARGB(255, 197, 197, 197),
              width: 1.0,
            ),
          ),
          width: 130,
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 215, 215, 215),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Text(
                        promotion,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 87, 87, 87),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _productleft(
    String title,
    String price,
    String discount,
    String rating,
    int customerRating,
    String customerCount,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(color: const Color.fromARGB(255, 103, 103, 103)),
        ),
        width: double.infinity,
        height: 240,
      ),
    );
  }

  Widget _productright(
    String title,
    String price,
    String discount,
    String rating,
    int customerRating,
    String customerCount,
  ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(color: const Color.fromARGB(255, 103, 103, 103)),
        ),
        width: double.infinity,
        height: 300,
      ),
    );
  }
}
