
import 'package:flutter/material.dart';

import '../model/article_model.dart';

ListView newsListView(BuildContext context, List<Article>? posts) {
  return ListView.builder(
    itemCount: posts!.length,
    padding: const EdgeInsets.all(8),
    itemBuilder: (context, index) {
      return Card(
        elevation: 4,
        child: ListTile(
          title: Text(
            posts[index].title ?? "-",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(posts[index].description ?? "-"),
          leading: Column(
            children: <Widget>[
              Image.network(posts[index].urlToImage ?? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930",width: 50,height: 50,
              ),
            ],
          ),
        ),
      );
    },
  );
}