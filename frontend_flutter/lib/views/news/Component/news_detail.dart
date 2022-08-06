import 'package:flutter/material.dart';
import 'package:frontend_flutter/model/news/news_model.dart';

class NewsDetail extends StatelessWidget {
  final List<News> listNews;
  final int id;
  const NewsDetail({Key? key, required this.listNews, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    News news = listNews.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.02, horizontal: size.width * 0.05),
          child: Container(
            width: size.height,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: const [
                  BoxShadow(color: Color.fromARGB(59, 0, 0, 0), blurRadius: 5.0)
                ]),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: size.height*0.03,horizontal: size.width*0.05),
              child: Text(news.description,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
