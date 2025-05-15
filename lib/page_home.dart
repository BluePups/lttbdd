import 'package:flutter/material.dart';
import 'package:laptrinhtbdd/Layout/get_example.dart';
import 'package:laptrinhtbdd/Layout/get_manager.dart';
import 'package:laptrinhtbdd/Layout/grid_view.dart';
import 'package:laptrinhtbdd/Layout/list_view.dart';
import 'package:laptrinhtbdd/Layout/page_get_storage_demo.dart';
import 'package:laptrinhtbdd/Layout/page_permission.dart';
import 'package:laptrinhtbdd/baitaptulam/page_luyen_tap.dart';
import 'package:laptrinhtbdd/commercial_app/PageFruitStream.dart';
import 'package:laptrinhtbdd/commercial_app/admin_pages/fruits_add_page.dart';
import 'package:laptrinhtbdd/commercial_app/admin_pages/fruits_page_admin.dart';
import 'package:laptrinhtbdd/commercial_app/app_fruits_store.dart';
import 'package:laptrinhtbdd/commercial_app/controllers/fruitcontroller.dart';
import 'package:laptrinhtbdd/commercial_app/models/model.dart';
import 'package:laptrinhtbdd/commercial_app/page_auth_user.dart';
import 'package:laptrinhtbdd/commercial_app/page_chitiet_fruit.dart';
import 'package:laptrinhtbdd/json/page_album.dart';
import 'package:laptrinhtbdd/profile/page_profile.dart';
import 'package:laptrinhtbdd/rss/pages/page_rss.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              BuildButton(context, title: "My Profile", destination: MyProfile()),
              BuildButton(context, title: "My GridView", destination: PageGridView()),
              BuildButton(context, title: "My List View", destination: PageListView()),
              BuildButton(context, title: "My Get", destination: PageCounterGetx()),
              BuildButton(context, title: "Controller Simple State", destination: GetXApp()),
              BuildButton(context, title: "Fruit Store", destination: App_Fruits_Store()),
              BuildButton(context, title: "Page Album", destination: PageAlbum()),
              BuildButton(context, title: "Page Rss", destination: PageRss()),
              BuildButton(context, title: "Page Stream", destination: PageFruitStream()),
              BuildButton(context, title: "Page Training", destination: PageLuyenTap()),
              BuildButton(context, title: "Page Admin Fruits", destination: FruitsPageAdmin()),
              BuildButton(context, title: "Page Add Fruits", destination: FruitsAddPage()),
              BuildButton(context, title: "Page Permission", destination: PageRequestPermission()),
              BuildButton(context, title: "Page Storage Demo", destination: PageGetStorageDemo()),
              BuildButton(context, title: "Page Login", destination: PageFruitStoreLogin()),
              BuildButton(context, title: "Page Khach Hang", destination: PageThongTinKH()),
            ],
          ),
        ),
      ),
    );
  }

  Widget BuildButton(BuildContext context, {required String title, required Widget destination}) {
    return Container(
              width: MediaQuery.of(context).size.width*2/3,
              child: Container(
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProfile(),));
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => destination,));
                    },
                    child: Text(title)),
              ),
            );
  }
}
