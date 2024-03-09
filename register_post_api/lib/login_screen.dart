import 'package:flutter/material.dart';
import 'package:register_post_api/api_services.dart';
import 'package:register_post_api/home_screen.dart';
import 'package:register_post_api/model.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  RegisterModel registerModel = RegisterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Register Screen"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(hintText: "Email"),
            ),

            TextField(
              controller: password,
              decoration: const InputDecoration(hintText: "Password"),
            ),

            const SizedBox(height: 50,),

            SizedBox(
              height: 50,width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){

                    ApiServices().register(email.text.toString(), password.text.toString()).then((value){

                      setState(() {
                        registerModel = value!;

                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(
                          id : registerModel.id.toString(),
                          token: registerModel.token.toString()
                        )));

                      });


                    }).onError((error, stackTrace){
                      print(error);
                    });

                  },
                  child: const Text("Sign Up")),
            )
          ],
        ),
      ),
    );
  }
}
