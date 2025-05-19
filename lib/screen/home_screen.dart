import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  }
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 35),
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
              child: ListView.builder(
                itemCount: newsProvider.newsApi?.articles.length,
                itemBuilder: (context, index) {
                return ListTile(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return DetailHome();
                 },));
                },
                leading: CircleAvatar(
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Image.asset("assets/images/moon.png"),
                  ),
                ),
                title: Text(newsProvider.newsApi?.articles[index].title ?? 'Rabu, 19 Agustus 2024',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF979797)
                ),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(newsProvider.newsApi?.articles[index].title ?? "Penemuan Mengejutkan di Bulan",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                    ),), 
                    Text(newsProvider.newsApi?.articles[index].title ?? "Bulan, satelit alami yang paling dekat dengan...",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF404040),
                      fontWeight: FontWeight.w600
                    ),), 
                    ],
                ),
              );
              },),
            )
           
          ],
        ),
      ),
    );
  }
}
