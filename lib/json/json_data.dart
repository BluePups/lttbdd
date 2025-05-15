import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class Album {
  int albumId, id;
  String title, url, thumbnailUrl;

  Album({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl} );

  factory Album.fromJson(Map<String, dynamic>json){
    return Album(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"]);

  }

  Map<String, dynamic> toJson(){
    return{
      "albumId": this.albumId,
      "id": this.id,
      "title": this.title,
      "url": this.url,
      "thumbnailUrl": this.thumbnailUrl,
    };
  }
}

Future<List<Album>> docDuLieu() async{
  String url = "https://jsonplaceholder.typicode.com/photos";
  var response = await http.get(Uri.parse(url));
  if(response.statusCode==200){
    var list = json.decode(response.body) as List;
    List<Album> album = list.map(
            (e){
          return Album.fromJson(e);
        }
    ).toList();
    return album;
  }
  return [];
}