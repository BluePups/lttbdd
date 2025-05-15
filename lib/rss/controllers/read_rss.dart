import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:laptrinhtbdd/rss/models/rss_item.dart';
import 'package:xml2json/xml2json.dart';
import '../models/rss_resource.dart';

void main() async {
  var url = "https://vnexpress.net/rss/tin-moi-nhat.rss";
  var response = await http.get(Uri.parse(url));
  if(response.statusCode == 200) {
    Xml2Json xml2json = Xml2Json();
    xml2json.parse(utf8.decode(response.bodyBytes));
    String body = xml2json.toParker();
    var data = json.decode(body)["rss"]["channel"]["item"] as List;
    // print(data[0]["title"]);print("\n");
    // print(data[0]["description"]);print("\n");
    // print(data[0]["link"]);print("\n");
    // print(data[0]["pubDate"]);print("\n");
    var rssItem = RssItem.empty().fromJson(data[0], res[0]);
    // print(rssItem.title);print("\n");
    // print(rssItem.description);print("\n");
    // print(rssItem.link);print("\n");
    // print(rssItem.pubDate);print("\n");
    // print(rssItem.imageUrl);print("\n");
  }
}