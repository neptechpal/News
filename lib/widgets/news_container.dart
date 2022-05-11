import 'package:flutter/material.dart';

import '../screens/webview_screen.dart';

class NewsContainer extends StatelessWidget {
  final String? imageurl;
  final String? title;
  final String? description;
  final String? author;
  final String? link;
  const NewsContainer(
      {Key? key,
      this.imageurl,
      this.title,
      this.description,
      this.author,
      this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => WebviewScreen(url: link)));
        },
        child: Card(
          elevation: 20,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.green,
            ),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: NetworkImage(imageurl!))),
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(description!,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                            Text("By ${author!}"),
                          ],
                        )
                      ],
                    ))
              ],
      
              // color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
