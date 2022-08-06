import 'package:flutter/material.dart';
import 'package:frontend_flutter/model/news/news_model.dart';
import 'package:frontend_flutter/services/news/news_repository.dart';
import 'package:frontend_flutter/views/news/Component/news_detail.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsRepository newsRepository = NewsRepository();
  List<News> listNews = [];
  @override
  void initState() {
    super.initState();
    loadNews();
  }

  loadNews() async {
    listNews = await newsRepository.getNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("News"),
      ),
      body: SizedBox(
          child: (listNews.isEmpty)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: listNews.length,
                  itemBuilder: ((context, index) {
                    News news = listNews[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                          horizontal: size.width * 0.05),
                      child: Container(
                        height: size.height * 0.24,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color.fromARGB(63, 0, 0, 0),
                              )
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.01),
                                child: SizedBox(
                                  width: size.width * 0.8,
                                  height: size.height * 0.2 * 0.2,
                                  child: Text(
                                    news.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.004),
                                child: SizedBox(
                                  width: size.width * 0.8,
                                  child: Text(
                                    news.description,
                                    maxLines: 4,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.03),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Author:${news.author}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Material(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewsDetail(
                                                          listNews: listNews,
                                                          id: news.id)));
                                        },
                                        child: Ink(
                                          height: size.height * 0.04,
                                          width: size.width * 0.3,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(12.0)),
                                          child: Center(
                                            child: Text(
                                              "view more",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                )),
    );
  }
}
