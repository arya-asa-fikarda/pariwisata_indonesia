import 'package:flutter/material.dart';

List<Map<String, dynamic>> DestinasiIndonesia = [
  {
    'name': 'Candi Borobudur',
    'location': 'Magelang, Jawa Tengah',
    'coordinates': {'latitude': -7.6079, 'longitude': 110.2038},
    'image':
        'https://borobudurpark.com/wp-content/uploads/2017/02/borobudur1-768x512.jpg',
    'rating': 4.8
  },
  {
    'name': 'Raja Ampat',
    'location': 'Papua Barat',
    'coordinates': {'latitude': -0.2346, 'longitude': 130.5222},
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/8/88/Raja_Ampat%2C_Mutiara_Indah_di_Timur_Indonesia.jpg',
    'rating': 4.9
  },
  {
    'name': 'Gunung Bromo',
    'location': 'Probolinggo, Jawa Timur',
    'coordinates': {'latitude': -7.9425, 'longitude': 112.9530},
    'image':
        'https://eventdaerah.kemenparekraf.go.id/storage/app/uploads/public/676/3cd/917/6763cd9174641985422603.webp',
    'rating': 4.8
  },
  {
    'name': 'Pantai Kuta',
    'location': 'Badung, Bali',
    'coordinates': {'latitude': -8.7183, 'longitude': 115.1691},
    'image':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Pantai_Kuta_sejuta_cinta.jpg/640px-Pantai_Kuta_sejuta_cinta.jpg',
    'rating': 4.6
  },
  {
    'name': 'Danau Toba',
    'location': 'Sumatera Utara',
    'coordinates': {'latitude': 2.6674, 'longitude': 98.8756},
    'image':
        'https://torch.id/cdn/shop/articles/Artikel_170_-_Preview.jpg?v=1713641039&width=1100',
    'rating': 4.7
  },
  {
    'name': 'Tana Toraja',
    'location': 'Sulawesi Selatan',
    'coordinates': {'latitude': -3.0457, 'longitude': 119.8260},
    'image':
        'https://assets-a1.kompasiana.com/items/album/2022/07/28/tana-toraja-62e1f2d43555e42efe096776.jpg',
    'rating': 4.8
  },
  {
    'name': 'Pulau Komodo',
    'location': 'Nusa Tenggara Timur',
    'coordinates': {'latitude': -8.5833, 'longitude': 119.5833},
    'image':
        'https://mawatu.co.id/wp-content/uploads/2024/06/image-1024x683.png',
    'rating': 4.9
  },
  {
    'name': 'Labuan Bajo',
    'location': 'Nusa Tenggara Timur',
    'coordinates': {'latitude': -8.4967, 'longitude': 119.8877},
    'image':
        'https://www.indonesia.travel/content/dam/indtravelrevamp/en/destinations/bali-nusa-tenggara/east-nusa-tenggara/labuan-bajo/LB2.jpg',
    'rating': 4.8
  },
  {
    'name': 'Pulau Weh',
    'location': 'Aceh',
    'coordinates': {'latitude': 5.8749, 'longitude': 95.2843},
    'image': 'https://beritakini.co/files/images/20230516-sosoosoal.jpg',
    'rating': 4.6
  },
  {
    'name': 'Taman Mini Indonesia Indah',
    'location': 'Jakarta Timur',
    'coordinates': {'latitude': -6.3025, 'longitude': 106.8958},
    'image':
        'https://asset.kompas.com/crops/6VBSm0kQtgCpMw6uuq6GQx2QJ7o=/0x0:1124x749/1200x800/data/photo/2021/09/25/614ecf8ebcd36.jpg',
    'rating': 4.5
  },
  {
    'name': 'Belitung Island',
    'location': 'Kepulauan Bangka Belitung',
    'coordinates': {'latitude': -2.5676, 'longitude': 107.6408},
    'image':
        'https://theworldtravelguy.com/wp-content/uploads/2020/07/DJI_0695_1200.jpg',
    'rating': 4.7
  },
  {
    'name': 'Wakatobi',
    'location': 'Sulawesi Tenggara',
    'coordinates': {'latitude': -5.3464, 'longitude': 123.8945},
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw8rifFflK75-ueWGE_8XD_kd_IgXj2K3qeA&s',
    'rating': 4.9
  },
  {
    'name': 'Pantai Pink',
    'location': 'Lombok, Nusa Tenggara Barat',
    'coordinates': {'latitude': -8.9303, 'longitude': 116.5394},
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3q7B1KB59pbmWiFStaiTIuJxgDoT_V8UfVQ&s',
    'rating': 4.6
  },
  {
    'name': 'Jembatan Ampera',
    'location': 'Palembang, Sumatera Selatan',
    'coordinates': {'latitude': -2.9916, 'longitude': 104.7577},
    'image':
        'https://bams.jambiprov.go.id/wp-content/uploads/2023/10/Jembatan-Ampera-1.png',
    'rating': 4.4
  },
  {
    'name': 'Bunaken',
    'location': 'Sulawesi Utara',
    'coordinates': {'latitude': 1.6219, 'longitude': 124.7556},
    'image':
        'https://ik.imagekit.io/tvlk/blog/2020/01/keindahan-alam-indonesia-5-Super-Adventure.jpg?tr=c-at_max',
    'rating': 4.8
  }
];

// buat variabel dengan item list kosong, untuk menampung nama destinasi mana yang di cari
List<Map<String, dynamic>> selectedDestination = [];

// Video Destination
final List<Map<String, String>> videoDestination = [
  {
    'title': "Best Places to Visit in Yogyakarta",
    'thumbnail_url': "https://img.youtube.com/vi/PHvnebTTzxQ/0.jpg",
    'videoId': "PHvnebTTzxQ"
  },
  {
    'title': "YOU CAN'T MISS THIS CITY IN INDONESIA",
    'thumbnail_url': "https://img.youtube.com/vi/d2ghIPLeKzc/0.jpg",
    'videoId': "d2ghIPLeKzc"
  },
  {
    'title': "Yogyakarta (Indonesia) Vacation Travel Video Guide",
    'thumbnail_url': "https://img.youtube.com/vi/bIG9sJ-cSCY/0.jpg",
    'videoId': "bIG9sJ-cSCY"
  },
  {
    'title': "Amazing Places in Indonesia - Borobudur & Yogyakarta",
    'thumbnail_url': "https://img.youtube.com/vi/uzDVPB1P6pE/0.jpg",
    'videoId': "uzDVPB1P6pE"
  },
  {
    'title': "Yogyakarta Vacation Travel Guide",
    'thumbnail_url': "https://img.youtube.com/vi/-dQexveY0cs/0.jpg",
    'videoId': "-dQexveY0cs"
  },
  {
    'title': "Yogyakarta Indonesia Travel Vlog",
    'thumbnail_url': "https://img.youtube.com/vi/bJcfRmrDdfA/0.jpg",
    'videoId': "bJcfRmrDdfA"
  },
  {
    'title': "10 BEST things to do in Yogyakarta",
    'thumbnail_url': "https://img.youtube.com/vi/gdZlu55QX8Q/0.jpg",
    'videoId': "gdZlu55QX8Q"
  },
  {
    'title': "Travel to Yogyakarta for 2 days",
    'thumbnail_url': "https://img.youtube.com/vi/LaM4kIzo4yo/0.jpg",
    'videoId': "LaM4kIzo4yo"
  },
  {
    'title': "The Complete Guide to Yogyakarta",
    'thumbnail_url': "https://img.youtube.com/vi/Wey77jqrskE/0.jpg",
    'videoId': "Wey77jqrskE"
  },
  {
    'title': "YOGYAKARTA exceeded our expectations!",
    'thumbnail_url': "https://img.youtube.com/vi/t59YBsJ1Awk/0.jpg",
    'videoId': "t59YBsJ1Awk"
  },
];

final List<String> galleryWisata = [
  "https://cdn.antaranews.com/cache/1200x800/2020/03/08/Pariwisata-Terdampak-Corona-080320-hnd-3_1.jpg",
  "https://enesis.com/wp-content/uploads/2020/09/Objek-Wisata-di-Jogja-yang-Harus-Kamu-Kunjung-Pas-Liburan-1536x1024.jpg",
  "https://cdn.antaranews.com/cache/1200x800/2024/10/28/heha-sea-wisata.jpg",
  "https://www.kemenparekraf.go.id/_next/image?url=https%3A%2F%2Fapi2.kemenparekraf.go.id%2Fstorage%2Fapp%2Fuploads%2Fpublic%2F63d%2Fce2%2Fe76%2F63dce2e76698c098978409.jpg&w=3840&q=75",
  "https://asset.kompas.com/crops/INOrMFud7sU5XF7SVu4d78f8dkY=/14x0:989x650/1200x800/data/photo/2020/02/20/5e4e6891abe99.jpg"
];
