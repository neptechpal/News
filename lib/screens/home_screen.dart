import 'package:flutter/material.dart';
import 'package:newsapp/widgets/home_container.dart';

import '../data/home_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('News'),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: mydata.length,
            itemBuilder: (context, index) {
              return HomeContainer(
                imageurl: mydata[index]['image'],
                title: mydata[index]['title'],
              );
            }));
  }
}
