import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';

import 'package:pariwisata_indonesia/data/list_destinasi.dart';

class GallleryWisataScreen extends StatefulWidget {
  const GallleryWisataScreen({super.key});

  @override
  State<GallleryWisataScreen> createState() => _GallleryWisataScreenState();
}

class _GallleryWisataScreenState extends State<GallleryWisataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery Wisata"),
      ),
      body: GridView.builder(
        itemCount: galleryWisata.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          MultiImageProvider imageViewers = MultiImageProvider(
            // Melakukan mapping atau pemecahan list menjadi index -> value,
            // value = nilai yang diambil missing
            galleryWisata.map((value) => NetworkImage(value)).toList(),
            initialIndex: index,
          );

          return GestureDetector(
            onTap: () {
              showImageViewerPager(context, imageViewers,
                  onPageChanged: (page) {
                    print("page changed to $page");
                  }, onViewerDismissed: (page) {
                    print("dismissed while on page $page");
                  });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                galleryWisata[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

