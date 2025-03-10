import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:pariwisata_indonesia/screens/video/video_player_screen.dart';
import '../../data/list_destinasi.dart';


class VideoWisataScreen extends StatefulWidget {
  const VideoWisataScreen({super.key});

  @override
  State<VideoWisataScreen> createState() => _VideoWisataScreenState();
}

class _VideoWisataScreenState extends State<VideoWisataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Wisata Indonesia"),
      ),
      body: ListView.builder(
        itemCount: videoDestination.length,
        itemBuilder: (context, index) {
          final vidsItem = videoDestination[index];
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(videoID: vidsItem['videoId']!),
                ),
              );
            },
            child: GFCard(
              boxFit: BoxFit.cover,
              showImage: true,
              image: Image.network(vidsItem['thumbnail_url']!, errorBuilder: (context, widget, _){
                return Image.network("https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image-300x225.png", fit: BoxFit.cover,);
              }),
              title: GFListTile(
                title: Text(vidsItem['title']!),
              ),
            ),
          );
        },
      ),
    );
  }
}
