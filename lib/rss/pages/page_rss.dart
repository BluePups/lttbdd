import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laptrinhtbdd/rss/controllers/rss_controller.dart';
import 'package:laptrinhtbdd/rss/models/rss_item.dart';
import 'package:laptrinhtbdd/rss/models/rss_resource.dart';
import 'package:laptrinhtbdd/rss/pages/page_url.dart';

class PageRss extends StatelessWidget {
  PageRss({super.key});
  final controller = Get.put(RssController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(res.first.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refresh();
        },
        child: GetBuilder(
          init: controller,
          id: "rss",
          builder: (controller) => FutureBuilder<List<RssItem>>(
              future: controller.readRss(),
              builder: (context, snapshot) {
                if(snapshot.hasError) {
                  return Center(child: Text("Lai loi roi"),);
                }
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator(),);
                }
                List<RssItem> list = snapshot.data!;
                return ListView.separated(
                    itemBuilder: (context, index) {
                      RssItem item = list[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PageUrl(url: "${item.link}")));
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: item.imageUrl==null? Center(
                                    child: Icon(Icons.image, size: 40,),) :
                                  Image.network(item.imageUrl?? "No URL"),
                                ),
                                SizedBox(height: 5,),
                                Expanded(
                                  flex: 2,
                                  child: Text("${item.title}", style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text("${item.description}"),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: list.length
                );
              }
            ),
        ),
      ),
    );
  }
}
