import 'package:flutter/material.dart';
import 'package:newsapp/ApiHelper/news_api.dart';
import 'package:newsapp/widgets/news_container.dart';

class NewsHome extends StatefulWidget {
  final String? title;
  final String? category;
  const NewsHome({Key? key, this.title, this.category}) : super(key: key);

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(widget.title!),
        ),
        body: FutureBuilder(
            future: getNews(widget.category!),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data;
                      return NewsContainer(
                        imageurl: data[index].imageurl,
                        title: data[index].title,
                        description: data[index].description,
                        author: data[index].author,
                        link: data[index].link,
                      );
                    });
              }

              return const Center(child: CircularProgressIndicator());
            }));
  }
}
