import 'package:flutter/material.dart';
import 'package:login_post_api/home_screen.dart';
import 'package:login_post_api/model.dart';

import 'api_services.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  LoginModel loginModel = LoginModel();
  bool isReady = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  loginModel.token ==null || loginModel.token ==""?
        const Text("Login Screen"):Text("Login Screen ${loginModel.token}"),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(
                hintText: "Enter Email"
              ),
            ),


            TextField(
              controller: password,
              decoration: const InputDecoration(
                  hintText: "Enter Password"
              ),
            ),


            const SizedBox(height: 50),


            SizedBox(
              height: 50, width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    setState(() {isReady = true;});

                    // With Model
                    ApiServices().loginWithModel(email.text.toString(), password.text.toString()).then((value){
                      setState(() {
                        loginModel = value!;
                        isReady = false;
                        print(loginModel.token);

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(
                          token : loginModel.token.toString()
                        )));

                      });
                    }).onError((error, stackTrace){
                      setState(() {isReady = false;});

                      print(error);
                    });

                    // Without Model
                    // ApiServices().loginWithOutModel(email.text.toString(), password.text.toString()).then((value){
                    //   setState(() {
                    //     isReady = false;
                    //     print(value["token"]);
                    //
                    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(
                    //         token : value["token"].toString()
                    //     )));
                    //
                    //   });
                    // }).onError((error, stackTrace){
                    //   setState(() {isReady = false;});
                    //   print(error);
                    // });


                  },
                  child: isReady ==true?
                  const Center(child: CircularProgressIndicator(color: Colors.white,),):
                  const Text("Login")),
            ),
          ],
        ),
      ),
    );
  }
}
