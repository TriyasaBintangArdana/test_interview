import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_interview/providers/auth_provider.dart';
import 'package:test_interview/screen/home_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context,listen: false);
    return Scaffold(
    appBar: AppBar(),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset("assets/images/image_login.png"),
          ),
          const SizedBox(height: 18),
          Center(
            child: Text("Hai, Mulai Eksplorasi Kamu",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text("Masuk ke aplikasi untuk mulai eksplorasi bersama kami sekarang",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF979797)
            ),),
          ),
          const SizedBox(height: 20),
          Text("Email"),
          const SizedBox(height: 8,),
          TextField(
            controller: _controllerEmail,
            decoration: InputDecoration(
              hintText: "email@gmail.com",
              fillColor: Color(0xFFF9F9FA),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )
            ),
          ),
          const SizedBox(height: 14,),
          Text("Kata sandi"),
          const SizedBox(height: 8,),
          TextField(
            controller: _controllerPassword,
            decoration: InputDecoration(
              hintText: "....",
              fillColor: Color(0xFFF9F9FA),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )
            ),
          ),
          const SizedBox(height: 31),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3DB9F5)
                ),
                onPressed: () async {
                try {
                  await auth.login(_controllerEmail.text, _controllerPassword.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  },));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Login Gagal"))
                  );
                }
                }, 
                child: Text("Masuk",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white
                ),)),
              ),
            ],
          ),
          const SizedBox(height: 47,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Belum Punya Akun?"),
              TextButton(onPressed: (){}, 
              child: Text("Daftar Sekarang",
              style: TextStyle(
                color: Color(0xFF3DB9F5)
              ),))
            ],
          )
        ],
       ),
     ),
    );
  }
}