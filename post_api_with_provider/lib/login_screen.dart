import 'package:flutter/material.dart';
import 'package:post_api_with_provider/provider.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:  Colors.brown,
        title: const Text("Login Screen",  style: TextStyle(color: Colors.white),),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration:const InputDecoration(
                  hintText: "Enter email"
                ),
              ),

              const SizedBox(height: 10,),

              TextFormField(
                controller: passwordController,
                decoration: const  InputDecoration(
                    hintText: "Enter password"
                ),
              ),

              const SizedBox(height: 30,),
              SizedBox(
                height: 50,width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

                        Provider.of<ApiProvider>(context,  listen: false).getData(context,
                            emailController.text.toString(),
                            passwordController.text.toString());
                      });
                    },
                    child:  Provider.of<ApiProvider>(context).isLoading?
                        const CircularProgressIndicator():
                    const Text("LogIn")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
