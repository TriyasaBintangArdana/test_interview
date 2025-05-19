import 'package:flutter/material.dart';

class DetailHome extends StatefulWidget {
  const DetailHome({super.key});

  @override
  State<DetailHome> createState() => _DetailHomeState();
}

class _DetailHomeState extends State<DetailHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 76),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset("assets/images/moon2.png"),
                ),
                const SizedBox(height: 27),
                Text(
                  "Penemuan Mengejutkan di Bulan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Text(
                  "Tanggal 19 Agustus 2024",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Text(
                  "Lokasi : Jakarta, Indonesia",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Text(
                  "Jakarta, 19 Agustus 2024 – Bulan, satelit alami yang paling dekat dengan Bumi, telah mengejutkan para ilmuwan dengan penemuan terbaru yang membuka babak baru dalam penelitian luar angkasa. Data yang diperoleh dari misi Artemis dan teleskop canggih menunjukkan temuan signifikan tentang geologi dan potensi sumber daya di permukaan Bulan.",
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Image.asset("assets/images/wpf_like.png"),
                            const SizedBox(width: 5,),
                            Text("Suka")
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Image.asset("assets/images/message.png"),
                            const SizedBox(width: 5,),
                            Text("Komentar")
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
