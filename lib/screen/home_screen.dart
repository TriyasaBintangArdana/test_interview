import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_interview/models/news_models.dart';
import 'package:test_interview/providers/news_provider.dart';
import 'package:test_interview/screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsProvider>(context, listen: false).loadNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(elevation: 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hai, Mulai Explorasi Kamu",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 5),
            Text(
              "Masuk ke aplikasi untuk mulai eksplorasi bersama kami sekarang",
              style: TextStyle(fontSize: 14, color: Color(0xFF979797)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child:
                  newsProvider.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : newsProvider.newsApi == null ||
                          newsProvider.newsApi!.articles == null
                      ? Center(child: Text("Gagal memuat berita."))
                      : ListView.builder(
                        itemCount: newsProvider.newsApi?.articles.length,
                        itemBuilder: (context, index) {
                          final article =
                              newsProvider.newsApi!.articles![index];
                          return ListTile(
                            onTap: () {
                              showModal(context, article);
                            },
                            leading: CircleAvatar(
                              child: Container(
                                width: 60,
                                height: 60,
                                child: Image.asset("assets/images/moon.png"),
                              ),
                            ),
                            title: Text(
                              "${article.publishedAt}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF979797),
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title ?? "Tidak ada judul",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  article.title ?? "Tidak ada judul",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF404040),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }

 Future<dynamic> showModal(BuildContext context, Article article) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 43,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/moon2.png"),
                ),
                const SizedBox(height: 27),
                Text(
                  article.title ?? "Tidak Ada Judul",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "${article.publishedAt}",
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20),
                Text(
                  "${article.source}",
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20),
                Text(
                  "${article.description}",
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20),
                 Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite, color: Colors.blue),
                              ),
                              Text("Suka"),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.message),
                              ),
                              Text("Komentar"),
                            ],
                          ),
                        ),
                      ],
                    ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      );
    },
  );
}


}
