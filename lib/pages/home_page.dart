import 'dart:convert';

import 'package:club_api/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<UserModel> UserData;
  void initState() {
    super.initState();
    UserData = fetchData();
  }
  Future<UserModel> fetchData() async {
    var url =
    Uri.parse("https://kavara-club-backend23.uw.r.appspot.com/attendances");
    final response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception("Unexpected error occure");
      UserModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: FutureBuilder(
                future: UserData,
                builder: (context,snapshot) {
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data?.data?.length ,
                        itemBuilder: (context,index) {
                          return Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: const BorderSide(width: 1)),
                              child:
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.network(snapshot.data!.data![index].user!.picture.toString()),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(snapshot.data!.data![index].user!.name.toString(),style: TextStyle(color: Colors.black,fontSize: 16)),
                                            Text(snapshot.data!.data![index].user!.position.toString(),style: TextStyle(color: Colors.black,fontSize: 16)),
                                            Text(
                                              snapshot.data!.data![index].status.toString(),style: TextStyle(color: Colors.green,fontSize: 24),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        const Text("In-time:   ",style: TextStyle(color: Colors.blue),),
                                        Text(snapshot.data!.data![index].inTime.toString(),style: TextStyle(color: Colors.blue)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("Out-time:   ",style: TextStyle(color: Colors.red)),
                                        Text(snapshot.data!.data![index].outTime.toString(),style: TextStyle(color: Colors.red)),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Text(snapshot.data!.data![index].date.toString()),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  }else if(snapshot.hasError){
                    return Text(snapshot.error.toString());

                  }
                  return CircularProgressIndicator();

                }
            ),
          ),
        )
    );
  }
}
