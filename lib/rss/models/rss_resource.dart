import 'package:laptrinhtbdd/rss/models/rss_item.dart';

class RssResource {
  String id, name;
  String startDescriptionRegrex, endDescriptionRegrex;
  String startImageRegrex, endImageRegrex;
  Map<String, String> resourceHeaders;

  RssResource({
    required this.id,
    required this.name,
    required this.startDescriptionRegrex,
    required this.endDescriptionRegrex,
    required this.startImageRegrex,
    required this.endImageRegrex,
    required this.resourceHeaders});
}

List<RssResource> res= [
  RssResource(id: "vnpress", name: "Viet Nam Epress",
      startDescriptionRegrex: "</a></br>", endDescriptionRegrex: "",
      startImageRegrex: 'img src="', endImageRegrex: '"',
      resourceHeaders: {
        "Trang chủ":"https://vnexpress.net/rss/tin-moi-nhat.rss",
        "Thế giới":"https://vnexpress.net/rss/the-gioi.rss",
        "Thời sự":"https://vnexpress.net/rss/thoi-su.rss",
        "Kinh doanh":"https://vnexpress.net/rss/kinh-doanh.rss",
        "Startup":"https://vnexpress.net/rss/startup.rss",
      }),
  RssResource(id:"tuoitre", name: "Tuoi tre",
      startDescriptionRegrex: "</a></br>", endDescriptionRegrex: "",
      startImageRegrex: 'img src="', endImageRegrex: '"',
      resourceHeaders: {
        "Trang chủ":"https://tuoitre.vn/rss/tin-moi-nhat.rss",
        "Thế giới":"https://tuoitre.vn/rss/the-gioi.rss",
        "Kinh doanh":"https://tuoitre.vn/rss/kinh-doanh.rss",
        "Xe":"https://tuoitre.vn/rss/xe.rss",
        "Văn hóa":"https://tuoitre.vn/rss/van-hoa.rss",
      })
];
