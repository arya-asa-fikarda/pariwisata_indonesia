import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pariwisata_indonesia/data/list_destinasi.dart';
import 'package:pariwisata_indonesia/screens/gallery/galeri_wisata_screen.dart';
import 'package:pariwisata_indonesia/screens/portal/portal_wisata_screen.dart';
import 'package:pariwisata_indonesia/screens/video/video_wisata_screen.dart';
import 'package:pariwisata_indonesia/screens/maps/maps_wisata_screen.dart';
// import 'package:pariwisata_indonesia/screens/maps/maps_wisata_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Update list destinasi untuk 10 destinasi Indonesia
  List list = [
    "Candi Borobudur",
    "Raja Ampat",
    "Gunung Bromo",
    "Pantai Kuta",
    "Danau Toba",
    "Tana Toraja",
    "Pulau Komodo",
    "Labuan Bajo",
    "Pulau Weh",
    "Taman Mini Indonesia",
    "Belitung Island",
    "Wakatobi",
    "Pantai Pink",
    "Jembatan Ampera",
    "Bunaken"
  ];

  // Fungsi untuk format harga ke Rupiah
  String formatPrice(int price) {
    return "Rp ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}";
  }

  // Modifikasi item menu button dengan animasi hover
  Widget itemMenuButton(
      {required IconData icon,
      required String label,
      required Function() onClick}) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Menambahkan animasi hover dan shadow pada card
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              child: Card(
                elevation: 5, // Menambahkan shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF7C0A30), Color(0xFF900C36)],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(icon, color: Colors.white, size: 30),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> listItemMenu = [];

  // nilai awal untuk menunjukkan bahwa destinasi belum di search sebelumnya
  bool isSearched = false;

  @override
  void initState() {
    // Update menu items dengan icon yang lebih relevan
    listItemMenu = [
      itemMenuButton(
        icon: Icons.language,
        label: "Web Portal",
        onClick: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PortalWisataScreen()));
        },
      ),
      itemMenuButton(
        icon: Icons.photo_library_rounded,
        label: "Galeri",
        onClick: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => GallleryWisataScreen()));
        },
      ),
      itemMenuButton(
        icon: Icons.play_circle_filled,
        label: "Video Wisata",
        onClick: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => VideoWisataScreen()));
        },
      ),
      itemMenuButton(
        icon: Icons.emergency,
        label: "Info Darurat",
        onClick: () {},
      ),
      itemMenuButton(
        icon: Icons.map_rounded,
        label: "Peta Wisata",
        onClick: () {},
      ),
    ];
    // nilai awal untuk selectedDestination, untuk menampilkan semua list destinasi
    // variabel jogjaDestination sebagai sumber data, jadi jangan diubah2, yg diubah hanya selectedDestination
    selectedDestination = DestinasiIndonesia;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Improved search bar with decoration
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GFSearchBar(
            searchBoxInputDecoration: InputDecoration(
              hintText: 'Cari destinasi wisata...',
              prefixIcon: Icon(Icons.search, color: Color(0xFF7C0A30)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Color(0xFF7C0A30)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Color(0xFF7C0A30)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Color(0xFF7C0A30), width: 2),
              ),
            ),
            searchList: list,
            searchQueryBuilder: (query, list) {
              return list
                  .where((item) =>
                      item.toLowerCase().contains(query.toLowerCase()))
                  .toList();
            },
            overlaySearchListItemBuilder: (item) {
              return Container(
                padding: const EdgeInsets.all(12),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 16),
                ),
              );
            },
            onItemSelected: (item) {
              setState(() {
                isSearched = true;
                selectedDestination =
                    DestinasiIndonesia.where((value) => value['name'] == item)
                        .toList();
              });
            },
          ),
        ),

        // Enhanced menu list
        Container(
          height: 110,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            itemCount: listItemMenu.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return listItemMenu[index];
            },
          ),
        ),

        TextButton(
          onPressed: () {
            setState(() {
              selectedDestination = DestinasiIndonesia;
              isSearched = false;
            });
          },
          child: Text("Lihat Semua"),
        ),

        //list wisata dengan gambar lokal
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: selectedDestination.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: GestureDetector(
                  onTap: () {
                    final coorDestination =
                        selectedDestination[index]['coordinates'];
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MapsWisataScreen(
                          itemDestination: Destination.setDestination(
                            name: selectedDestination[index]['name'],
                            location: selectedDestination[index]['location'],
                            coordinates: LatLng(coorDestination['latitude'],
                                coorDestination['longitude']),
                            image: selectedDestination[index]['image'],
                            rating: selectedDestination[index]['rating'],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      // Card dengan efek shadow
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            selectedDestination[index]['image'],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                child: Center(
                                  child: Icon(
                                    Icons.error_outline,
                                    size: 50,
                                    color: Colors.red,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      // Info card dengan gradient overlay
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.8),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                selectedDestination[index]['name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      color: Colors.white, size: 16),
                                  SizedBox(width: 5),
                                  Text(
                                    selectedDestination[index]['location'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Rating
                                  Row(
                                    children: [
                                      ...List.generate(5, (i) {
                                        double rating =
                                            selectedDestination[index]
                                                ['rating'];
                                        return Icon(
                                          i < rating.floor()
                                              ? Icons.star
                                              : (i < rating
                                                  ? Icons.star_half
                                                  : Icons.star_border),
                                          color: Colors.amber,
                                          size: 20,
                                        );
                                      }),
                                      SizedBox(width: 5),
                                      Text(
                                        "${selectedDestination[index]['rating']}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Price
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF7C0A30),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      formatPrice(1000000),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
