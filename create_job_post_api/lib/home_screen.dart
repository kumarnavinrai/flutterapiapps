import 'package:create_job_post_api/model.dart';
import 'package:create_job_post_api/see_my_job.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'api_services.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();


  CreateJobModel createJobModel = CreateJobModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  createJobModel.name == null || createJobModel.name == ""?
        Text("Create Job"):Text("Create Job ${createJobModel.name}"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(hintText: "Name"),
            ),

            TextField(
              controller: job,
              decoration: const InputDecoration(hintText: "Job"),
            ),

            const SizedBox(height: 70,),

            SizedBox(
              height: 50,width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    ApiServices().createJob(name.text.toString(), job.text.toString()).then((value){
                      setState(() {
                        createJobModel = value!;
                        print(value);

                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SeeMyJob(
                          id: createJobModel.id.toString(),
                          name: createJobModel.name.toString(),
                          job: createJobModel.job.toString(),
                        )));

                      });
                    }).onError((error, stackTrace){
                      print(error);
                    });
                  },
                  child: const Text("Create Job")),
            )
          ],
        ),
      ),
    );
  }
}
